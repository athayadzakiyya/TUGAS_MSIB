<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tugas 1</title>
</head>
<body bgcolor="pink" align="center">

    <form method="post">
    <table border="3" align="center" cellpadding="10" width="25%">

            <thead>
                <tr bgcolor="white">
                    <th colspan="2">Perhitungan Luas Jajargenjang</th>
                </tr>
            </thead>

            <tbody>
                <tr>
                    <tr>
                        <td> Alas </td>
                        <td><input type="text" name="alas" placeholder="masukan angka" require></td>
                    </tr>
                    <tr>
                        <td>Tinggi</td>
                        <td><input type="text" name="tinggi" placeholder="masukan angka" require></td>
                    </tr>
                    <tr>
                        <td>Sisi Miring</td>
                        <td><input type="text" name="sisi" placeholder="masukan angka" require></td>
                    </tr>
            </tbody>

            <tfoot bgcolor="white">
                    <td colspan="2" align="center">
                    <button type="submit" name="luas">Luas</button>&nbsp
                    <button type="submit" name="keliling">Keliling</button>
                    </td>
            </tfoot>
</table>
    </form>

    <?php 
    if(isset($_POST['luas'])){
        $alas = $_POST['alas'];
        $tinggi = $_POST['tinggi'];

        $luas = $alas * $tinggi;
        echo '<hr>';
        echo 'Hasil perhitungan dari Luas Jajargenjang';
        echo '<br> Diketahui :';
        echo '<br> Alas = '.$alas;
        echo '<br> Tinggi = '.$tinggi;

        echo '<br> Maka Luasnya adalah ' .$luas;
    } elseif(isset($_POST['keliling'])){
        $alas = $_POST['alas'];
        $sisi = $_POST['sisi'];

        $keliling = 2 * ($alas + $sisi);
        echo '<hr>';
        echo 'Hasil perhitungan dari Keliling Jajargenjang';
        echo '<br> Diketahui :';
        echo '<br> Alas = '.$alas;
        echo '<br> Sisi Miring = '.$sisi;

        echo '<br> Maka Kelilingnya adalah ' .$keliling;
    }
    ?>
</body>
</html>