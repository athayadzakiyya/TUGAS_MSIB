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
    <table border="3" align="center" cellpadding="20" width="40%">

            <thead>
                <tr bgcolor="white">
                    <th colspan="20">Perhitungan Bangun Datar</th>
                </tr>
            </thead>

            <tbody>
                <tr>
                <?php
                require_once 'Segitiga.php';
                require_once 'Lingkaran.php';
                require_once 'PersegiPanjang.php';

                $s1 = new Segitiga(14, 10,12);
                $l2 = new Lingkaran(7);
                $p3 = new PersegiPanjang(50, 2);

                $ar_bangun = [$s1, $l2, $p3];
                
                foreach($ar_bangun as $bd){
                    ?> <tr>
                    <td colspan="4" bgcolor="white">
                    <?= $bd->namaBidang() . '<br>' ?></td></tr>
                
                    <td>Keliling:</td>
                    <td> <?= $bd->KelilingBidang(). '<br>'?></td>
                    <tr>
                    <td>Luas:</td>
                    <td> <?= $bd->LuasBidang() . '<br>'?></td></tr>
                <?php 
            } ?>
                </tr>
            </tbody>
</table>
    </form>

    </body>
</html>