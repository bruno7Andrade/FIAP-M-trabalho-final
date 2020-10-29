<?php
class Banco
{
    private $conn,$dsn,$st;

    public function __construct()
    {

        global $config;

        try{

            $this->conn = new PDO(
               'pgsql:host=localhost;dbname=daas',
               'felipe',
                '123456'
            );

            $this->conn->setAttribute(
                PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION
            );

        }catch (PDOException $err){
            echo 'Erro:'.$err->getMessage();
        }


    }

    public function inserir($tabela, array $dados)
    {
        #estrutura do array ( campo => valor ) campo == campo da tabela
        #INSERT INTO TABELA(CAMPOS)VALUES(VALORES);
        try{

            foreach ($dados as $campo => $valor){
                $campos[]  = $campo;
                $holders[] = '?';
                $valores[] = $valor;
            }

            $campos  = implode(',', $campos);

            $holders = implode( ',', $holders);

            $sql = "INSERT INTO $tabela($campos)VALUES($holders)";

            $this->st  = $this->conn->prepare($sql);

            return $this->st->execute($valores);

        }catch (PDOException $err){
            die("Erro:{$err->getMessage()}");
        }

    }

    public function alterar($tabela, array $dados, $condicao = null)
    {
        #formato $condicao campo = valor;
        $registro = $this->ver($tabela, $condicao);

        try{

            foreach ($dados as $campo => $valor){
                $sets[]    = "$campo=?";
                $valores[] = $valor;
            }

            $sets = implode( ',', $sets);

            $sql  = "UPDATE $tabela SET $sets";
            $sql .= ($condicao) ? " WHERE $condicao" : '';

            $this->st  = $this->conn->prepare($sql);

            if($this->st->execute($valores)){
                return true;
            }

        }catch (PDOException $err){
            die("Erro:{$err->getMessage()}");
        }

    }

    public function query($tabela, $campos = '*')
    {
        $sql = "SELECT $campos FROM $tabela";
        return $this->conn->query($sql);
    }


    public function listar($tabela, $campos = '*', $condicao = null)
    {
        #SELECT CAMPOS FROM $tabela
        try{

            $sql = "SELECT $campos FROM $tabela";

            return $this->conn->query($sql)->fetchAll(PDO::FETCH_ASSOC);

        }catch (PDOException $err){
            echo "Erro:{$err->getMessage()}";
        }

    }

    public function ver($tabela, $condicao, $campos = '*')
    {
        try{
            $sql = "SELECT $campos FROM $tabela $condicao";
            return $this->conn->query($sql)->fetch(PDO::FETCH_ASSOC);
        }catch (PDOException $err){
            echo "Erro:{$err->getMessage()}";
        }

    }

   public function excluir($tabela, $condicao)
    {
        $registro = $this->ver($tabela, $condicao);

        try{
            $sql = "DELETE FROM $tabela $condicao";
            return $this->conn->query($sql);
        }catch (PDOException $err){
            echo "Erro:{$err->getMessage()}";
        }
    }
}












