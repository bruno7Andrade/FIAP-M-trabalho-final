<?php
                require 'topo.php';

				?>

<script>
window.onload = function() {
  var data = {
   labels: [<?php echo $label ?>],
   series: [
    [<?php echo $values ?>]
   ]
   };
	new Chartist.Bar('#por_usu', data);

new Chartist.Bar('#por_serv', {
  labels: ['First quarter of the year', 'Second quarter of the year', 'Third quarter of the year', 'Fourth quarter of the year'],
  series: [
    [60000, 40000, 80000, 70000],
    [40000, 30000, 70000, 65000],
    [8000, 3000, 10000, 6000]
  ]
}, {
  seriesBarDistance: 10,
  axisX: {
    offset: 60
  },
  axisY: {
    offset: 80,
    labelInterpolationFnc: function(value) {
      return value + ' CHF'
    },
    scaleMinSpace: 15
  }
});

  var data2 = {
   labels: [<?php echo $label2 ?>],
   series: [
    [<?php echo $values2 ?>],    [<?php echo $tamanho2 ?>]
   ]
   };
	

};
</script>
	
    <div class="row" style="margin-top:50px">
        <div class="col-sm-4">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h3 class="panel-title">Uso de Disco por usuário</h3>
            </div>
            <div class="panel-body">
		<div id="por_usu" class="ct-chart ct-square"></div>
            </div>
          </div>
          <div class="panel panel-primary">
            <div class="panel-heading">
              <h3 class="panel-title">Uso de Disco por Serviço</h3>
            </div>
            <div class="panel-body">

            </div>
          </div>
        </div><!-- /.col-sm-4 -->
        <div class="col-sm-4">
          <div class="panel panel-success">
            <div class="panel-heading">
              <h3 class="panel-title">Panel title</h3>
            </div>
            <div class="panel-body">
		<div id="por_serv" class="ct-chart ct-square"></div>
            </div>
          </div>
          <div class="panel panel-info">
            <div class="panel-heading">
              <h3 class="panel-title">Panel title</h3>
            </div>
            <div class="panel-body">
              <div class="ct-chart ct-square"></div>
            </div>
          </div>
        </div><!-- /.col-sm-4 -->
        <div class="col-sm-4">
          <div class="panel panel-warning">
            <div class="panel-heading">
              <h3 class="panel-title">Panel title</h3>
            </div>
            <div class="panel-body">
              <div class="ct-chart ct-square"></div>
            </div>
          </div>
          <div class="panel panel-danger">
            <div class="panel-heading">
              <h3 class="panel-title">Panel title</h3>
            </div>
            <div class="panel-body">
              <div class="ct-chart ct-square"></div>
            </div>
          </div>
        </div><!-- /.col-sm-4 -->
      </div>



<?php
                require 'footer.php';
           ?>

