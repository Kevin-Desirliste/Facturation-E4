<?php $racine = $_SERVER['DOCUMENT_ROOT'] ?><!DOCTYPE html>
<html lang="fr">

<head>
  <title>Facturation - Le Bora-Bora</title>
  <?php include_once $racine .'/facturation/include/head.php' ?>
</head>
<body>
  <?php include_once $racine .'/facturation/include/header.php' ?>


<link rel="stylesheet" type="text/css" media="screen" href="/facturation/css/index_facturation.css">


<h2><BR>RECHERCHEZ UNE FACTURE :</h2><BR>

<form action='afficher_facture.php' METHOD='POST'>
<h3>Veuillez saisir un numéro de chambre :</h3>
<input type='text' name='numero_chambre' required><BR>
<input type='submit' value='Afficher la facture'></form>	
</form>



<?php

	//Cette procédure vérifie la requete SQL
	function verif_erreur_mysql($var,$co) {
		if (!$var) {
			$err=$co->errorInfo();
		echo "---------------------\nErreur SQL : \n".$err[2]."\n";
		echo "Vérifiez votre code !\n---------------------\n";
		exit;
		}
	}
		
	//Connexion à la base de données
	function connexion_bd() {
		try {
		$c = new PDO('mysql:host=127.0.0.1;dbname=facturation', 'root', '');
		$c->query("SET CHARACTER SET utf8");
		return $c;
		} catch (PDOException $e) {
			//vérification de la connexion
			echo "Erreur!".$e->getMessage()."\n";
			exit;
		}
}
	



	

?>


<br>
 <div id="slide">
    <div class="slider">
      <ul class="items">
        <li>
          <img src="img/vue.png" alt="Vue plage - Hôtel" />
          <div class="banner">
          </div>
        </li>
       
      </ul>
     </div>
  </div>
	

<footer>
<?php include_once $racine .'/facturation/include/footer.php' ?>
</footer>


</body>
</html>




	



