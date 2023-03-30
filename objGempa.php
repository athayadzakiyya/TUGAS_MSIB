<?php
require 'Gempa.php';
$g1 = new Gempa('Banten',0.1);
$g2 = new Gempa('Tokyo',2);
$g3 = new Gempa('Tel aviv',4);
$g4 = new Gempa('florida',6);

$ar_data = [$g1,$g2,$g3,$g4];


foreach ($ar_data as $d){
    $d->cetak();
}
?>