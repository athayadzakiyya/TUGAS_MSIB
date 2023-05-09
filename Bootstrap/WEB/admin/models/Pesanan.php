<?php
class Pesanan{
    private $koneksi;
    public function __construct()
    {
        global $dbh; //instance object koneksi.php
        $this->koneksi = $dbh;
    }
    public function Pesanan()
    {
        $sql = "SELECT * FROM pesanan2";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute();
        $rs = $ps->fetchAll();
        return $rs;
    }
    public function getPesanan($id){
        $sql = "SELECT * FROM pesanan2 =?";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute([$id]);
        $rs = $ps->fetch();
        return $rs;
    }
    public function simpan($data){
    $sql = "INSERT INTO pesanan2(tanggal, total, pelanggan_id)
    VALUES (?,?,?)";
    $ps = $this->koneksi->prepare($sql);
    $ps->execute($data);
    }
    public function ubah(){
        
    }
}
?>