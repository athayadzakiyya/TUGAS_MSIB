<?php
require_once 'Abstract1.php';

class PersegiPanjang extends Bentuk2D {
    public $panjang;
    public $lebar;
    
    public function __construct($panjang, $lebar) {
        $this->panjang = $panjang;
        $this->lebar = $lebar;    
    }
 
    public function namaBidang(){
        echo "Persegi Panjang";
    }

    public function LuasBidang(){
        // $luas = $this->panjang * $this->lebar;
        // return $luas;
        return ($this->panjang * $this->lebar);
    }

    public function KelilingBidang(){
        // $keliling = (2 * $this->panjang) + (2 * $this->lebar);
        // return $keliling;
        return ((2 * $this->panjang) + (2 * $this->lebar));
    }

}
?>