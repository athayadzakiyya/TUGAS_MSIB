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
        $sql = "SELECT pesanan2.*, pelanggan.nama_pelanggan as nama_pelanggan from pesanan2 
        INNER JOIN pelanggan ON pelanggan.id = pesanan2.pelanggan_id";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute();
        $rs = $ps->fetchAll();
        return $rs;
    }
    public function getPesanan($id){
        $sql = "SELECT pesanan2.*, pelanggan.nama_pelanggan as nama_pelanggan from pesanan2 
        INNER JOIN pelanggan ON pelanggan.id = pesanan2.pelanggan_id WHERE pesanan2.id =?";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute([$id]);
        $rs = $ps->fetch();
        return $rs;
    }
    public function simpan($data){
        $sql = "INSERT INTO pesanan2 (tanggal, total, pelanggan_id)
        VALUES (?,?,?)";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute($data);
    }
    public function ubah($data){
        $sql = "UPDATE pesanan2 SET tanggal=? , total=? , pelanggan_id=?
        WHERE id=?";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute($data);
    
    }
    public function hapus($id){
        $sql = "DELETE FROM pesanan2 WHERE id=?";
        $ps = $this->koneksi->prepare($sql);
        $ps->execute([$id]);
    }
}
?>