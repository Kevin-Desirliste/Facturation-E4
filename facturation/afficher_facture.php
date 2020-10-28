<?php $racine = $_SERVER['DOCUMENT_ROOT'] ?><!DOCTYPE html>
<html lang="fr">

<head>
	<body>
  <title>Facturation - Le Bora-Bora</title>
  <?php include_once $racine .'/facturation/include/head.php' ?>
</head>
<body>
  <?php include_once $racine .'/facturation/include/header.php' ?>

<!-- Lien avec le css -->
<link rel="stylesheet" type="text/css" media="screen" href="/facturation/css/index_facture.css">

<!-- Code pour le bouton imprimer : on imprimer que la partie concernée -->
<script language="JavaScript" type="text/javascript">
	function imprimer(divID)
	{
		var printContents= document.getElementById(divID).innerHTML;
		var originalContents= document.body.innerHTML;
		document.body.innerHTML=printContents;
		window.print();
		document.body.innerHTML=originalContents;
	}
</script>


<div id="section_a_imprimer">


<!-- Image -->
<img class="image1" src="/facturation/img/borabora.jpeg">


<!-- En tête de la facture -->
<h2 class="hôtel">HOTEL BORABORA</h2>
<h2 class="hôtel">ILE DES PINS</h2>
<h2 class="hôtel">BAIE DE KANUMERA</h2>

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




//Connexion à la base de données
$connex=connexion_bd();

// récupération du nom du client
$req_client = "SELECT nom_client, prenom_client 
			   FROM client 
			   		INNER JOIN sejour 
			   			ON client.num_client=sejour.num_cli 
			   		INNER JOIN concerne_chambre 
			   			ON sejour.num_sejour=concerne_chambre.num_sej_chambre 
			   WHERE concerne_chambre.num_chambre=".$_POST["numero_chambre"]."";

$res_client=$connex->query($req_client);
verif_erreur_mysql($res_client,$connex);


if ($ligne=$res_client->fetch(PDO::FETCH_NUM)) {
  $nom=$ligne[0];
  $prenom=$ligne[1];

		// Nom et prénom du client
		echo "<br><h2 class='personne'>Mr/Mme : " .$nom." ".$prenom."</h2>";
}
else
{
		echo "";
}

// On récupère les informations concernant les chambres / le séjour 
$req_chambre="SELECT date_arrivee, date_depart, libelle_chambre, nbr_personne, prix_chambre, nbr_personne*prix_chambre
			  FROM sejour
					INNER JOIN concerne_chambre
						ON sejour.num_sejour=concerne_chambre.num_sej_chambre
					INNER JOIN chambre
						ON concerne_chambre.num_chambre = chambre.num_chambre
					INNER JOIN categorie_chambre
						ON chambre.cat_chambre = id_cat_chambre
			  WHERE concerne_chambre.num_chambre=".$_POST["numero_chambre"]."";

$res_chambre=$connex->query($req_chambre);
verif_erreur_mysql($res_chambre,$connex);

// On récupère les informations concernant le spa
$req_spa="SELECT date_facture_spa, libelle_soin, quantite_spa, prix_soin, quantite_spa*prix_soin 
		  FROM sejour 
		  		INNER JOIN facture_spa 
		  			ON sejour.num_sejour=facture_spa.num_sej_spa 
		  		INNER JOIN concerne_spa 
		  			ON facture_spa.num_facture_spa=concerne_spa.num_facture_spa 
		  		INNER JOIN spa 
		  			ON concerne_spa.num_soin=spa.num_soin 
		  		INNER JOIN concerne_chambre 
		  			ON sejour.num_sejour=concerne_chambre.num_sej_chambre 
		  WHERE concerne_chambre.num_chambre=".$_POST["numero_chambre"]."";

$res_spa=$connex->query($req_spa);
verif_erreur_mysql($res_spa,$connex);

// On récupère les informations concerant le bar
$req_bar="SELECT date_conso_bar, libelle_consommation, quantité_bar, prix_consommation, quantité_bar*prix_consommation
		  FROM sejour
		  		INNER JOIN facture_bar
		  				ON sejour.num_sejour=facture_bar.num_sej_bar 
		  		INNER JOIN concerne_bar 
		  				ON facture_bar.num_facture_bar=concerne_bar.num_facture_bar
		  		INNER JOIN consommation 
		  				ON concerne_bar.id_consommation_bar=consommation.id_consommation_bar
		  		INNER JOIN concerne_chambre 
		  			ON sejour.num_sejour=concerne_chambre.num_sej_chambre  
		  WHERE concerne_chambre.num_chambre=".$_POST["numero_chambre"]."";

$res_bar=$connex->query($req_bar);
verif_erreur_mysql($res_spa,$connex);

// On récupère les informations concerant la brasserie

$req_brasserie="SELECT date_facture_brasserie, libelle_plat, quantité_brasserie, prix_plat, quantité_brasserie*prix_plat
		  FROM sejour
		  		INNER JOIN facture_brasserie
		  				ON sejour.num_sejour=facture_brasserie.num_sej_brasserie
		  		INNER JOIN concerne_brasserie
		  				ON facture_brasserie.num_facture_brasserie=concerne_brasserie.num_facture_brasserie
		  		INNER JOIN brasserie 
		  				ON concerne_brasserie.id_plat_brasserie=brasserie.id_plat_brasserie
		  		INNER JOIN concerne_chambre 
		  			ON sejour.num_sejour=concerne_chambre.num_sej_chambre  
		  WHERE concerne_chambre.num_chambre=".$_POST["numero_chambre"]."";

$res_brasserie=$connex->query($req_brasserie);
verif_erreur_mysql($res_brasserie,$connex);

?>


<?php



// Numéro de chambre
echo "<h2 class='numero'>Chambre : ".$_POST['numero_chambre']."</h2>";
?>

<br><br>

<!-- tableau contenant de les informations de la facture -->
<?php


if ($ligne=$res_chambre->fetch(PDO::FETCH_NUM)) {
  $date_arrivee=$ligne[0];
  $date_depart=$ligne[1];
  $libelle=$ligne[2]; 
  $nombre_pers=$ligne[3]; 
  $prixChambre=$ligne[4];
  $prix = $ligne[5];



  echo "<table>
	

        <tr>
            <th>DATE</th>
            <th>PRESTATIONS</th>  
            <th>nbre</th>
            <th>PU</th>
            <th>Prix en FCP</th>
        </tr>";

  // Ligne du tableau affichant les informations concernant le séjour / les chambres 
      echo "<tr>
       		<td>".$date_arrivee. " AU " .$date_depart."</td>",
       		"<td>".$libelle."</td>",
       		"<td>".$nombre_pers."</td>",
       		"<td>".$prixChambre."</td>",
       		"<td>".$prix."</td>",
       		"</tr>";

}
else
{
	echo "<h3>Aucune facture n'a été saisie pour cette chambre</h3><br>";
}

// Ligne du tableau affichant les informations concernant le spa

while ($ligne=$res_spa->fetch(PDO::FETCH_NUM)) {
  $date_spa=$ligne[0];
  $libelle_soin=$ligne[1];
  $quantite_spa=$ligne[2];
  $prix_soin=$ligne[3]; 
  $prixtotal_spa=$ligne[4]; 

	  

      echo "<tr>
       		<td>".$date_spa."</td>",
       		"<td>SPA - ".$libelle_soin."</td>",
       		"<td>".$quantite_spa."</td>",
       		"<td>".$prix_soin."</td>",
       		"<td>".$prixtotal_spa."</td>",
       		"</tr>";
}

// Ligne du tableau affichant les informations concernant le bar

// Boucle pour récupérer les informations sur le bar 
while ($ligne=$res_bar->fetch(PDO::FETCH_NUM)) {
  $date_bar=$ligne[0];
  $libelle_consommation=$ligne[1];
  $quantite_consommation=$ligne[2];
  $prix_consommation=$ligne[3]; 
  $prixtotal_bar=$ligne[4]; 


	
// Afficher dans un tableau les informations concernant le bar selon le numéro de chambre saisi
	echo "<tr>
       		<td>".$date_bar."</td>",
       		"<td>BAR - ".$libelle_consommation."</td>",
       		"<td>".$quantite_consommation."</td>",
       		"<td>".$prix_consommation."</td>",
       		"<td>".$prixtotal_bar."</td>",
       		"</tr><br>";

}
// Ligne du tableau affichant les informations concernant la brasserie

// Boucle pour récupérer les informations sur le bar 
while ($ligne=$res_brasserie->fetch(PDO::FETCH_NUM)) {
  $date_brasserie=$ligne[0];
  $libelle_plat=$ligne[1];
  $quantite_plat=$ligne[2];
  $prix_brasserie=$ligne[3]; 
  $prixtotal_brasserie=$ligne[4]; 

// Afficher dans un tableau les informations concernant la brasserie selon le numéro de chambre saisi

	echo "<tr>
       		<td>".$date_brasserie."</td>",
       		"<td>BRASSERIE - ".$libelle_plat."</td>",
       		"<td>".$quantite_plat."</td>",
       		"<td>".$prix_brasserie."</td>",
       		"<td>".$prixtotal_brasserie."</td>",
       		"</tr>";

}

?>



</table>

<br>


<!-- Total -->
<?php

// On calcule le montant total de la facture
$req_total=$prix+$prixtotal_spa+$prixtotal_bar+$prixtotal_brasserie;



	echo "<h2 class='numero'>Total : ".$req_total."</h2>";


// TSS
 	echo"<h2 class='numero'>TSS</h2>";

?>

</div>


<!-- Bouton imprimer -->
<form>
	<br><input class="impression" type="button" value="Imprimer" onclick="imprimer('section_a_imprimer')"></br>
</form>





<!-- footer -->
<footer>
<?php include_once $racine .'/facturation/include/footer.php' ?>
</footer>



	</body>
</html>