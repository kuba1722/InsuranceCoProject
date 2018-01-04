<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Dodaj ekran</title>
</head>
<body>
	<?php
		require_once "funkcje.php";
		$polaczenie = Polacz();
		if ( isset( $_POST['usun'] ) )
		{
			$data_missing = array();
				
			//sprawdzenie poprawności wprowadzonych danych
			if( empty( $_POST['typ1'] ) ) $data_missing[] = 'typ1';
				else $typ1 = trim( $_POST['typ1'] );
				
			if ( empty( $data_missing ) )
			{
				Usuwanie_klientow($polaczenie,$typ1);
			}
			else
			{
				echo '<font color="red">Musisz uzupełnić następujące pola:</font><br />';
					
				foreach( $data_missing as $missing )
					echo "$missing<br />";
					
				echo "<br />";
			}
		}
	?>
	
	<form action="usuwanie_klienta.php" method="post">
	<table>
		<b>Usuwanie:</b><br>
		<tr>
			<p><td>Podzaj ID klienta do usuniecia :</td> 
				<td> <input type="int" name="typ1" size="30" value="" /></td>  
			</p>
		</tr>
		
		<tr>
		<p>
			<td><input type="submit" name="usun" value="Usun" />
		</p>
		</tr>
	</table>	
	<table>
	</form>
		<table width="500" align="center" border="1" bordercolor="#d5d5d5"  cellpadding="0" cellspacing="0">
        <tr>
			<?php
					$rezultat = Pobierz_klientow($polaczenie);
					Wyswitl($rezultat);
			?>
		</tr>
	</table>
	
</body>
</html>