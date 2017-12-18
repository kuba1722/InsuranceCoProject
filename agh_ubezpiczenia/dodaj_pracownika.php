<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Dodaj ekran</title>
</head>
<body>
	<?php
		if ( isset( $_POST['dodaj'] ) )
		{
			$data_missing = array();
				
			//sprawdzenie poprawności wprowadzonych danych
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
				
			if ( empty( $data_missing ) )
			{
				require_once "dbconnect.php";
				$polaczenie = mysqli_connect($host, $user, $password, $database);
				mysqli_query($polaczenie, "SET CHARSET utf8");
				mysqli_query($polaczenie, "SET NAMES 'utf8' COLLATE 'utf8_polish_ci'");
				
				if($polaczenie === false)
					die("BŁĄD: Nie można połączyć " . mysqli_connect_error());

				$zapytanie = "INSERT INTO pracownicy (ID, imie, nazwisko, pesel, numer_telefonu, adres_zamieszkania, kod_pocztowy, seria_dowodu, email)
													VALUES (NULL, '$typ1', '$typ2', '$typ3', '$typ4', '$typ5', '$typ6', '$typ7', '$typ8')";
				
				if(mysqli_query($polaczenie, $zapytanie))
					echo '<font color="#15dc00">'."Poprawnie dodano wpis.".'</font>'.'<br><br>';
				else
					echo "BŁĄD: Nie można wykonać polecenia $zapytanie. " . mysqli_error($polaczenie);

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
	?>
	
	<form action="dodaj_pracownika.php" method="post">
	<table>
		<b>Rejestracja:</b><br>
		<tr>
			<p><td>Imie:</td> 
				<td> <input type="text" name="typ1" size="30" value="" /></td>  
			</p>
		</tr>
		
		<tr>
		<p><td>Nazwisko:</td> 
			<td><input type="text" name="typ2" size="30" value="" /> </td>
		</p>
		</tr>
		<tr>
		<p><td>pesel:</td> 
			<td><input type="int" name="typ3" size="30" value="" /> </td>
		</p>
		</tr>
		
		<tr>
		<p><td>numer_telefonu: </td>
			<td><input type="int" name="typ4" size="30" value="" /> </td>
		</p>
		</tr>
		
		<tr>
		<p><td>adres_zamieszkania:</td> 
			<td><input type="text" name="typ5" size="30" value="" /> </td>
		</p>
		</tr>
		
		<tr>
		<p><td>kod_pocztowy:</td> 
			<td><input type="int" name="typ6" size="30" value="" /> </td>
		</p>
		</tr>
		
		<tr>
		<p><td>seria_dowodu:</td> 
			<td><input type="text" name="typ7" size="30" value="" /></td> 
		</p>
		</tr>
		
		<tr>
		<p><td>email:</td> 
			<td><input type="text" name="typ8" size="30" value="" /></td> 
		</p>
		</tr>
		
		<tr>
		<p>
			<td><input type="submit" name="dodaj" value="Dodaj" /></td>
		</p>
		</tr>
	</table>	
	</form>
	
	
</body>
</html>