<?php
require_once 'Abstract1.php';
// require_once 'ObjectBentuk2D.php';

class Segitiga extends Bentuk2D {
    public $alas;
    public $tinggi;
    public $sisi;

    public function __construct($alas, $tinggi, $sisi){
        $this->alas = $alas;
        $this->tinggi = $tinggi; 
        $this->sisi = $sisi;
    }

    public function namaBidang(){
        echo "Segitiga";
    }

    public function LuasBidang(){
        $luas = 0.5 * $this->alas * $this->tinggi;
        return $luas;
    }

    public function KelilingBidang(){
        $keliling = 2 * ($this->alas + $this->sisi);
        return $keliling;
    }
}