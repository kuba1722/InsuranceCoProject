<?php
			function Wyswitl($rezultat)
			{
				$ile = mysqli_num_rows($rezultat);
				echo "znaleziono: ".$ile;
				if ($ile>=1) 
				{
					echo'<td width="50" align="center" bgcolor="e5e5e5"><b>ID</b></td>
					<td width="50" align="center" bgcolor="e5e5e5"><b>imie</b></td>
					<td width="50" align="center" bgcolor="e5e5e5"><b>nazwisko</b></td>
					<td width="50" align="center" bgcolor="e5e5e5"><b>pesel</b></td>
					<td width="50" align="center" bgcolor="e5e5e5"><b>seria_dowodu</b></td>
					<td width="50" align="center" bgcolor="e5e5e5"><b>numer_telefonu</b></td>
					<td width="50" align="center" bgcolor="e5e5e5"><b>email</b></td>
					<td width="50" align="center" bgcolor="e5e5e5"><b>adres_zamieszkania</b></td>
					<td width="50" align="center" bgcolor="e5e5e5"><b>kod_pocztowy</b></td>
					</tr><tr>';
				}
				
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
					
					echo '<td width="50" align="center">'.$a1.'</td>
					<td width="100" align="center">'.$a2.'</td>
					<td width="100" align="center">'.$a3.'</td>
					<td width="100" align="center">'.$a4.'</td>
					<td width="100" align="center">'.$a5.'</td>
					<td width="100" align="center">'.$a6.'</td>
					<td width="100" align="center">'.$a7.'</td>
					<td width="100" align="center">'.$a8.'</td>
					<td width="100" align="center">'.$a9.'</td>

					</tr><tr>';				
				}	
			}
//***********************************************************************************************************************************************************
			function Polacz()
			{
				require_once "dbconnect.php";
				$polaczenie = mysqli_connect($host, $user, $password, $database);
				mysqli_query($polaczenie, "SET CHARSET utf8");
				mysqli_query($polaczenie, "SET NAMES 'utf8' COLLATE 'utf8_polish_ci'");

				return $polaczenie;
			}
//***********************************************************************************************************************************************************
			function Pobierz_pracownikow($polaczenie)
			{	
				$zapytanie = "SELECT pracownicy.ID, pracownicy.imie, pracownicy.nazwisko, pracownicy.pesel,pracownicy.numer_telefonu, pracownicy.adres_zamieszkania, pracownicy.kod_pocztowy, pracownicy.seria_dowodu, pracownicy.email FROM pracownicy";	
				$rezultat = mysqli_query($polaczenie, $zapytanie);
				return $rezultat;
			}
//***********************************************************************************************************************************************************			
			function Pobierz_klientow($polaczenie)
			{
				$zapytanie = "SELECT klienci.ID, klienci.imie, klienci.nazwisko, klienci.pesel,klienci.numer_telefonu, klienci.adres_zamieszkania, klienci.kod_pocztowy, klienci.seria_dowodu, klienci.email FROM klienci";	
				$rezultat = mysqli_query($polaczenie, $zapytanie);
				return $rezultat;
			}
//***********************************************************************************************************************************************************			
			function Usuwanie_klientow($polaczenie,$typ1)
			{

				if($polaczenie === false)
					die("BŁĄD: Nie można połączyć " . mysqli_connect_error());
				
				$zapytanie = "DELETE FROM klienci WHERE ID ='$typ1'";
				
				if(mysqli_query($polaczenie, $zapytanie))
					echo '<font color="#15dc00">'."Usunieto wpis.".'</font>'.'<br><br>';
				else
					echo "BŁĄD: Nie można wykonać polecenia $zapytanie. " . mysqli_error($polaczenie);

				mysqli_close($polaczenie);
				header("Location: usuwanie_klienta.php");
			}

?>