<!DOCTYPE HTML>
<html>
<head>
	<title>L'échartet</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0'/>
	<link rel="stylesheet" href='css/style.css' />
	<link rel="stylesheet" href="css/meteopicto.css"/>
	<link rel="stylesheet" href="css/jquery-ui.css"/>
	<link href="css/lightbox.css" rel="stylesheet" />
	<script src="js/jquery-1.11.0.min.js"></script>
	<script src="js/jquery-ui.js"></script>
	<script src="js/lightbox-2.6.min.js"></script>
	<script src="js/modernizr.custom.js"></script>
	<script>
	$(function() {
	$("#datepicker").datepicker({
	     changeMonth:true,
	     changeYear:true,
	     yearRange:"-100:+0",
		 //dateFormat: 'dd/mm/yy',
		 //dateFormat: 'dd/mm/yy',
	  });
	   });
	</script>
	<style>

	/* Swipe 2 required styles */

	.swipe {
	  overflow: hidden;
	  visibility: hidden;
	  position: relative;
	}
	.swipe-wrap {
	  overflow: hidden;
	  position: relative;
	}
	.swipe-wrap > div {
	  float:left;
	  width:100%;
	  position: relative;
	}

	/* END required styles */

	</style>

</head>

<h1>L'échartet</h1>

<?php

	$start_hour = 9;
	$end_hour = 18;
	$current_hour = date("H");
	$datetoday = date("mdYH");
	$datenow = date("mdYH");
	$datestart = date("Y-m-d 0".$start_hour.":00:00");
	$datestartTS = strtotime($datestart);
	$month = date("m");
	

   	if (isset($_POST['date'])){
	   $dateutilisateur = $_POST['date'];
		//echo ($dateutilisateur);
			$dateuser = strtotime($dateutilisateur);
			$datenow = date("mdY$current_hour", $dateuser);
			$month = date("m",$dateuser);
			$datestart = date("Y-m-d 0".$start_hour.":00:00",$dateuser);
			$datestartTS = strtotime($datestart);
	}

	


	/*$objDateTime = new DateTime('NOW');
	$current_hour = $objDateTime->format('H');
	$start_hour_date_string = $objDateTime->format('mdY');
	$start_hour_date = DateTime::createFromFormat('mdYH', $start_hour_date_string.$start_hour );
	*/
	
	

	
	$dateforpickernow = date("d/m/Y");
	


	
	if ($current_hour < $start_hour) {//morning
		//$objDateTime = new DateTime('yesterday');
		$current_hour = $end_hour; // on affiche toutes les heure
		$datestartTS = $datestartTS - 86400 ;//journée précédente
	}
	
	if ($current_hour > $end_hour || $datetoday > $datenow) {//evening after 18h
		$current_hour = $end_hour;
	}
	
	

	echo ('<div id="mySwipe" style="max-width:700px;margin:0 auto" class="swipe">
	<div class="swipe-wrap" text-align:right>
	
	<div><b><video src="img/timelapse'.$month.'.mp4?'.filectime('img/timelapse'.$month.'.mp4').'" id="timelapse" controls="controls">firefox ou chrom svp</video>Time lapse</b></div>');
	for ($i = 0 ; $i <= ($current_hour - $start_hour); $i++) {
		//$intervalle_h=DateInterval::createfromdatestring('+1 hours');
		//$datestring = $start_hour_date->format('mdYH');
		//dateuserfriendly = $start_hour_date->format('d-m-Y H\h');
		//echo ("\n".$dateuserfriendly."\n");
		//echo ("<div>\n<b><img src=\"img/cam".$datestring.".jpg\" width=\"100%\"/>".$dateuserfriendly."</b></div>");
		//$start_hour_date->add($intervalle_h);
	
		$date = date("mdYH", $datestartTS + (3600*$i));
		$dateuserfriendly = date("d/m/Y H\h", $datestartTS + (3600*$i));
		if((($start_hour + $i) == 12) ){
			echo ('<div><b><video src="img/cam'.$date.'.mp4" id="mov'.$date.'" controls="controls">utilisez un vrai navigateur comme firefox ou chrome</video>'.$dateuserfriendly.'</b></div>');
		}
		else{
			
			if (file_exists('img/cam'.$date.'.jpg')) {
				if( ($start_hour + $i) == 16 || ($start_hour + $i) == 9){
					echo ('<div><b><a href="img/cam'.$date.'.jpg" data-lightbox="image-'.$date.'"><img src="img/cam'.$date.'.jpg" id="" width="100%"/></a>'.$dateuserfriendly.'</b></div>');
				}
				else{
					echo ('<div><b><img src="img/cam'.$date.'.jpg" id="'.$date.'" width="100%"></a>'.$dateuserfriendly.'</b></div>');
				}
			}
			else{
				echo ('<div><b><img src="img/camnotfound.png" width="100%" ></a>'.$dateuserfriendly.'</b></div>');
			}
			
		}
	}
	echo("\n</div>");

	echo("\n<div style=\"text-align:center;padding-top:0px;\">");
	echo    ("\n<button onclick=\"mySwipe.slide(0,500)\">time lapse</button>");
	for ($i = 1 ; $i <= ($current_hour - $start_hour) +1; $i++) {
		if((($start_hour + $i - 1 ) == 12)){
			echo 	("\n<button onclick=\"mySwipe.slide($i,500)\">".($start_hour + $i -1)."h (vidéo)</button>");
		}
		elseif((($start_hour + $i -1 ) == 16 || ($start_hour + $i-1) == 9)){
			echo 	("\n<button onclick=\"mySwipe.slide($i,500)\">".($start_hour + $i -1)."h (HD)</button>");
		}
		else{
			echo 	("\n<button onclick=\"mySwipe.slide($i,500)\">".($start_hour + $i -1)."h</button>");
		}
	}
	echo("\n</div>");
	
	echo('
		<div><b>
	<form method="post" action="">
		Date (mois/jj/aaaa): <input type="text" name="date" id="datepicker" ></input>
		<button type="submit" class="like" name="foo" value="bar">Màj</button>
	</form>
	</b>
	
</div> '); 
?>

<?php
		
		$meteoURL = 'http://widget.meteocity.com/NzMyMTF8NXw0fDF8MXxGRkZGRkZ8MXxGRkZGRkZ8Y3wx/';
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $meteoURL);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_USERAGENT, 'What the fuck');
		$resultat = curl_exec ($ch);

	
		curl_close($ch);

		$pos = strrpos($resultat, "<body>");
		$newmeteo =  substr($resultat,$pos,strlen($resultat)-$pos);
		$healthy = array("<body>", "</body>","</html>");
		$newmeteo = str_replace($healthy, "" , $newmeteo);
		echo '<div style="max-width:700px;display:block;text-align:center;margin:10px;padding:10px 20px">';
		echo $newmeteo;
		echo "</div>";
	?>


<div id="mySwipePNG" style="max-width:700px;margin:0 auto" class="swipe">
	<div class="swipe-wrap" text-align:right>
		<div><b><img src="img/myear.png<?php echo ('?'.filectime('img/myear.png')); ?>" id="" width="100%"/>année</b></div>
		<div><b><img src="img/mmonth.png<?php echo ('?'.filectime('img/mmonth.png')); ?>" id="" width="100%"/>mois</b></div>
		<div><b><img src="img/mweek.png<?php echo ('?'.filectime('img/mweek.png')); ?>" id="" width="100%"/>semaine</b></div>
		<div><b><img src="img/mday.png<?php echo ('?'.filectime('img/mday.png')); ?>" id="" width="100%"/>journée</b></div>
		<div><b><img src="img/mhour.png<?php echo ('?'.filectime('img/mhour.png')); ?>" id="" width="100%"/>6 dernières heures</b></div>
	</div>
</div>

<div style="text-align:center;padding-top:0px;">
	<button onclick="mySwipePNG.slide(0,500)">année</button>
	<button onclick="mySwipePNG.slide(1,500)">mois</button>
	<button onclick="mySwipePNG.slide(2,500)">sem</button>
	<button onclick="mySwipePNG.slide(3,500)">journée</button>
	<button onclick="mySwipePNG.slide(4,500)">heure</button>
</div>

<br>

<div style="text-align:center;padding:10px;">
	<a href="Outdoor3Gcamera.pdf">Comment ça marche ?</a><span> </span>
	<a href="releasenotes.txt">Release notes</a>
</div>


<script src='js/swipe.js'></script>
<script>

// pure JS
<?php
echo ('
var elem = document.getElementById(\'mySwipe\');
window.mySwipe = Swipe(elem, {

   startSlide: '.($current_hour - $start_hour +1).',');
   ?>
  // auto: 3000,
  continuous: false,
  // disableScroll: true,
  // stopPropagation: true,
  // callback: function(index, element) {},
  // transitionEnd: function(index, element) {}
});

var elem = document.getElementById('mySwipePNG');
window.mySwipePNG = Swipe(elem, {
   startSlide: 4,
  // auto: 3000,
  continuous: false,
  // disableScroll: true,
  // stopPropagation: true,
  // callback: function(index, element) {},
  // transitionEnd: function(index, element) {}
});

// with jQuery
// window.mySwipe = $('#mySwipe').Swipe().data('Swipe');

</script>
