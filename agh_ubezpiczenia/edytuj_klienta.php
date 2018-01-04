<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Dodaj ekran</title>
</head>
<body>
	<?php
	error_reporting(E_ALL ^ E_NOTICE);
		if ( isset( $_POST['edytuj'] ) )
		{
			$data_missing = array();
				
			//sprawdzenie poprawności wprowadzonych danych
			if( empty( $_POST['typ1'] ) ) $data_missing[] = 'typ1';
				else $typ1 = trim( $_POST['typ1'] );

				
			if ( empty( $data_missing ) )
			{
				include "funkcje.php";
				$polaczenie = Polacz();
				
				if($polaczenie === false)
					die("BŁĄD: Nie można połączyć " . mysqli_connect_error());

				$zapytanie = "SELECT klienci.ID, klienci.imie, klienci.nazwisko, klienci.pesel,klienci.numer_telefonu, klienci.adres_zamieszkania, klienci.kod_pocztowy, klienci.seria_dowodu, klienci.email FROM klienci WHERE ID='$typ1'";	
				$rezultat = mysqli_query($polaczenie, $zapytanie);
				$ile = mysqli_num_rows($rezultat);
				for ($i = 1; $i <= $ile; $i++) 
				{				
					$row = mysqli_fetch_row($rezultat);
					$a1 = $row[0];
					$a2 = $row[1];
					$a3 = $row[2];
					$a4 = $row[3];
					$a5 = $row[4];
					$a6 = $row[5];
					$a7 = $row[6];
					$a8 = $row[7];
					$a9 = $row[8];
								
				}	
				mysqli_close($polaczenie);
			}
			else
			{
				echo '<font color="red">Musisz uzupełnić następujące pola:</font><br />';
					
				foreach( $data_missing as $missing )
					echo "$missing<br />";
					
				echo "<br />";
			}
			
		}
		if ( isset( $_POST['zapisz'] ) )
		{
			if( empty( $_POST['typ1'] ) ) $data_missing[] = 'typ1';
				else $typ1 = trim( $_POST['typ1'] );
			if( empty( $_POST['typ2'] ) ) $data_missing[] = 'typ2';
				else $typ2 = trim( $_POST['typ2'] );
			if( empty( $_POST['typ3'] ) ) $data_missing[] = 'typ3';
				else $typ3 = trim( $_POST['typ3'] );
			if( empty( $_POST['typ4'] ) ) $data_missing[] = 'typ4';
				else $typ4 = trim( $_POST['typ4'] );
			if( empty( $_POST['typ5'] ) ) $data_missing[] = 'typ5';
				else $typ5 = trim( $_POST['typ5'] );
			if( empty( $_POST['typ6'] ) ) $data_missing[] = 'typ6';
				else $typ6 = trim( $_POST['typ6'] );
			if( empty( $_POST['typ7'] ) ) $data_missing[] = 'typ7';
				else $typ7 = trim( $_POST['typ7'] );
			if( empty( $_POST['typ8'] ) ) $data_missing[] = 'typ8';
				else $typ8 = trim( $_POST['typ8'] );
			if( empty( $_POST['typ9'] ) ) $data_missing[] = 'typ9';
				else $typ9 = trim( $_POST['typ9'] );
				
				include "funkcje.php";
				$polaczenie = Polacz();
				$zapytanie = "UPDATE klienci SET imie='$typ9',nazwisko='$typ2',pesel='$typ3',numer_telefonu='$typ4',adres_zamieszkania='$typ5',kod_pocztowy='$typ6',seria_dowodu='$typ7',email='$typ8' WHERE ID='$typ1'";	
				mysqli_query($polaczenie, $zapytanie);
			header("Location: dane_klientow_wyswietl.php");

		}
	?>
	
	<form action="edytuj_klienta.php" method="post">
	<table>
		<b>Edycja:</b><br>
		<tr>
			<p><td>Podzaj ID klienta do edytowanego:</td> 
				<td> <input type="text" name="typ1" size="30" value="<?php echo "$a1"?>" /></td>  
			</p>
		</tr>
		<tr>
			<p><td>Imie:</td> 
				<td> <input type="text" name="typ9" size="30" value="<?php echo "$a2"?>" /></td>  
			</p>
		</tr>
		
		<tr>
		<p><td>Nazwisko:</td> 
			<td><input type="text" name="typ2" size="30" value="<?php echo "$a3"?>" /> </td>
		</p>
		</tr>
		<tr>
		<p><td>pesel:</td> 
			<td><input type="int" name="typ3" size="30" value="<?php echo "$a4"?>" /> </td>
		</p>
		</tr>
		
		<tr>
		<p><td>numer_telefonu: </td>
			<td><input type="int" name="typ4" size="30" value="<?php echo "$a5"?>" /> </td>
		</p>
		</tr>
		
		<tr>
		<p><td>adres_zamieszkania:</td> 
			<td><input type="text" name="typ5" size="30" value="<?php echo "$a6"?>" /> </td>
		</p>
		</tr>
		
		<tr>
		<p><td>kod_pocztowy:</td> 
			<td><input type="int" name="typ6" size="30" value="<?php echo "$a7"?>" /> </td>
		</p>
		</tr>
		
		<tr>
		<p><td>seria_dowodu:</td> 
			<td><input type="text" name="typ7" size="30" value="<?php echo "$a8"?>" /></td> 
		</p>
		</tr>
		
		<tr>
		<p><td>email:</td> 
			<td><input type="text" name="typ8" size="30" value="<?php echo "$a9"?>" /></td> 
		</p>
		</tr>
		
		<tr>
		<p>
			<td><input type="submit" name="edytuj" value="Edytuj" />
				<input type="submit" name="zapisz" value="Zapisz" /></td>
		</p>
		</tr>
	</table>	
	</form>
	
	
</body>
</html>