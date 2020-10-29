    <header class="header">
           <?php
                require 'topo.php';
#                require 'checkLogin.php';
                if($_POST){
                     if($db->inserir('usuario', $_POST)){
                        header('location:usuarios.php');
                     }
                }
           ?>
              <style type="text/css">
            textarea, input[type="text"], input[type="password"], input[type="datetime"], input[type="datetime-local"], input[type="date"], input[type="month"], input[type="time"], input[type="week"], input[type="number"], input[type="email"], input[type="url"], input[type="search"], input[type="tel"], input[type="color"], .uneditable-input{
	           padding: 10px;
                height:auto;
            }
        </style>
    </header>
    <div class="container">
    <div class="row">
    <div class="span12" style="margin-top:20px">
        <legend class="title">
            <h3>+ Novo Usuário</h3>
        </legend>

		<form action="#" method="post" class="form">
			<p>
				<label for="id_cli">Empresa</label> <input type="text" name="id_cli"
					id="id_cli" required>
			</p>
		    <p>
				<label for="nome">Login</label> <input type="text" name="nome"
					id="nome" required>
			</p>
<p>
				<button class="btn">Gravar</button>
			</p>
		</form>


 <div class="">
		<legend class="title">
		    <h3>Lista de Usuários</h3>
		</legend>
          <table class="table table-striped">
<thead>
		            <tr class="bold">
		                <td>Empresa</td>
		                <td>Nome</td>
		                <td style="width: 36px;">Ações</td>
		            </tr>
		        </thead>
		        <tbody>

		            <?php //inicio do codigo

							$registros = $db->listar('usuario','id_cli, id, nome');
								foreach( $registros as $registro ){

							?>
						     <tr class="bold">
		                <td><?php echo $registro['id_cli'] ?></td>
		                <td><?php echo $registro['nome'] ?></td>
		                <td style="width: 36px;">
				<a href="alterarCliente.php?id=<?php echo $registro['id'] ?>"><i class="icon-pencil"> </i></a>
				<a href="excluirCliente.php?id=<?php echo $registro['id'] ?>"><i class="icon-remove"> </i></a>
									</td>
		            </tr>
						  <?php //fim do codigo
						    }
							?>

		        </tbody>
          </table>
        </div>
      
	
<?php
                require 'footer.php';
           ?>


