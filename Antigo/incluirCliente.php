    <header class="header">
           <?php
                require 'topo.php';
#                require 'checkLogin.php';
		include('../include/utils.php');// o ponto barra volta um diretório
#		include('../include/user.php');
                if($_POST){
                     if(inserir('clientes', $_POST)){
                        header('location:clientes.php');
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
            <h3>+ Novo Cliente</h3>
        </legend>

		<form action="#" method="post" class="form">
			<p>
				<label for="nome">Nome/Razao</label> <input type="text" name="nome"
					id="nome" required>
			</p>
		    <p>
				<label for="cnpj">CNPJ</label> <input type="text" name="cnpj"
					id="cnpj" required>
			</p>
		</form>

   <table width="100%" class="table">
                <col style="width:10%">
                <thead>
                    <tr class="bold">
                        <td>Cpf/CNPJ</td>
                        <td>Nome/Razão</td>
                        <td style="width: 36px;">Ações</td>
                    </tr>
                    <?php //inicio do codigo

							$registros = listar('cliente','cnpj,nome');
							foreach( $registros as $registro ){

						?>
					     <tr class="bold">
                        <td><?php echo $registro['cnpj'] ?></td>
                        <td><?php echo $registro['nome'] ?></td>
                        <td style="width: 36px;">
			<a href="alterarCliente.php?id=<?php echo $registro['id'] ?>"><i class="icon-pencil"> </i></a>
			<a href="excluirCliente.php?id=<?php echo $registro['id'] ?>"><i class="icon-remove"> </i></a>
								</td>
                    </tr>
					  <?php //fim do codigo
					    }
						?>
                </thead>
                <tbody>

                </tbody>
            </table>


