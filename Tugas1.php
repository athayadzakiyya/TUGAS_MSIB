<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tugas 1</title>
</head>
<body bgcolor="pink">
    <H1>Perhitungan Luas Jajargenjang</H1>
    <form method="post">
        <table>
            <tr>
                <td>Alas</td>
                <td> <input type="text" name="alas" require> </td>
            </tr>
            <tr>
                <td>Tinggi</td>
                <td> <input type="text" name="tinggi" require> </td>
            </tr>
            <tr>
                <td><input type="submit" name="submit" value="Hasil"></td>
            </tr>
        </table>
    </form>

    <?php 
    if(isset($_POST['submit'])){
        $alas = $_POST['alas'];
        $tinggi = $_POST['tinggi'];

        $luas = $alas * $tinggi;
        echo '<hr>';
        echo 'Hasil perhitungan dari Luas Jajargenjang';
        echo '<br> Diketahui :';
        echo '<br> Alas = '.$alas;
        echo '<br> Tinggi = '.$tinggi;

        echo '<br> Maka Luasnya adalah ' .$luas;
    }
    ?>
</body>
</html>