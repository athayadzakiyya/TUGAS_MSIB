<?php 
require 'h.php';

$pegawai1 = new Pegawai('01111','Andi','Manager','Islam','Menikah');
$pegawai2 = new Pegawai('01111','Andi','Manager','kristen','Belum Menikah');


$ar_pegawai = [$pegawai1, $pegawai2];

foreach($ar_pegawai as $pegawai){
    $pegawai->cetak();
}


?>