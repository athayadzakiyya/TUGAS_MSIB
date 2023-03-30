<?php
require 'Pegawai.php';

//5 instance object pegawai
//cetaklah semua struktur gaji pegawai

$pegawai1 = new Pegawai('0111','Lusi','Asisten Manager','Islam','Belum Menikah');
$pegawai2 = new Pegawai('0112','Keita','Manager','Hindhu','Menikah');
$pegawai3 = new Pegawai('0113','Jonathan','Kepala Bagian','Kristen','Belum Menikah');
$pegawai4 = new Pegawai('0114','Keyra','Manager','Islam','Belum Menikah');
$pegawai5 = new Pegawai('0115','Jacob','Staff','Katholik','Menikah');

$ar_pegawai = [$pegawai1, $pegawai2, $pegawai3, $pegawai4, $pegawai5];

foreach($ar_pegawai as $p){
    $p->cetak();
}

?>
