import MySQLdb
import subprocess
from subprocess import Popen, PIPE, STDOUT

def insert(user, tipo, path, size, cursor2):
	ins = "INSERT INTO disk_user SELECT id, 1, %s, now(), '%s', %s FROM usuario WHERE nome = '%s'" % (tipo, path, size, user)
	cursor2.execute(ins);

subprocess.call('kdestroy', shell=True)

db = MySQLdb.connect("localhost","root","","sentry")
db2 = MySQLdb.connect("localhost","root","","daas")

cursor = db.cursor()
cursor2 = db2.cursor()

cursor.execute("SELECT role.ROLE_NAME, db.DB_NAME FROM SENTRY_ROLE_DB_PRIVILEGE_MAP db_role INNER JOIN SENTRY_ROLE role ON role.ROLE_ID = db_role.ROLE_ID INNER JOIN SENTRY_DB_PRIVILEGE db ON db.DB_PRIVILEGE_ID = db_role.DB_PRIVILEGE_ID WHERE DB_NAME NOT IN ('default', '__NULL__') and PRIVILEGE_SCOPE = 'DATABASE' ORDER BY role.ROLE_NAME")

subprocess.call('kinit -kt /hdfs.keytab hdfs/bgdtldapp0001.lwo.locaweb.com.br@HADOOP.LOCAL', shell=True)

dir = Popen('hive -e "set hive.metastore.warehouse.dir" | cut -d= -f2', shell=True, stdout=PIPE).stdout.read().strip()

print "Obtendo tamanho dos databases: %s" % dir
for row in cursor:
	print "Dono: %s, database: %s" % (row[0],row[1])
	cmd = 'hdfs dfs -du -s %s/%s.db | cut -d" " -f3 ' % (dir,row[1])
	du = Popen(cmd, shell=True, stdout=PIPE).stdout.read().strip()	
	path = dir + "/" + row[1] + ".db"
	insert(row[0], 2, path, du, cursor2)
	print "DB: %s - Size: %s " % (row[1], du)

cursor.execute("SELECT DISTINCT ROLE_NAME FROM SENTRY_ROLE ORDER BY ROLE_NAME")
for row in cursor:
	cmd = 'hdfs dfs -du -s /user/%s | cut -d" " -f3 ' % row[0]
        du = Popen(cmd, shell=True, stdout=PIPE).stdout.read().strip()
	insert(row[0], 1 ,'/user/'+row[0], du, cursor2)
	print "Path: /user/%s - Size: %s" % (row[0],du)

db2.commit()
db.close

db2.close

