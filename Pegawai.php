<?php
class Pegawai{
    protected $nip;
    public $nama;
    private $jabatan;
    private $agama;
    private $status;
    static $jml = 0;
    const PT = 'PT. HPT Indonesia';

    public function __construct($nip, $nama, $jabatan, $agama, $status){
        $this->nip = $nip;
        $this->nama = $nama;
        $this->jabatan = $jabatan;
        $this->agama = $agama;
        $this->status = $status;
        self::$jml++; 
    }

    public function setGajiPokok($jabatan){
        $this->jabatan = $jabatan;
        switch($jabatan){
            case 'Manager' : $gapok = 15000000; break;
            case 'Asisten Manager' : $gapok = 10000000; break;
            case 'Kepala Bagian' : $gapok = 7000000; break;
            case 'Staff' : $gapok = 5000000; break;
            default: $gapok;
        }
        return $gapok;
    }

    //setTunjab = 20% dari Gaji Pokok
    public function setTunjJab($jabatan){
        $this->jabatan = $jabatan;
        $TJ =  $this->setGajiPokok($jabatan) * 0.2;
        return $TJ;
    }

    //setTunkel= 10% dari Gaji Pokok untuk sudah menikah (ternary)
    public function setTunKel($status){
        $this->status = $status;
        $TK = ($this->status == 'Menikah') ? $this->setGajiPokok($this->jabatan) * 0.1 : 0;
        return $TK;
    }

    //setZakatProfesi= 2,5% dari GajiPokok untuk muslim dan 
    //Gaji Kotor minimal 6jt
    public function setZakatProfesi($agama){
        $this->agama = $agama;
        if($this->agama == 'Islam' && $this->setGajiPokok($this->jabatan) >= 6000000) 
        $zakat = $this->setGajiPokok($this->jabatan) * 0.025;
        else{
            $zakat = 0;
        }
        return $zakat;
    }

    public function setGajiBersih(){
        $GB = $this->setGajiPokok($this->jabatan) + $this->setTunjJab($this->jabatan) + 
        $this->setTunKel($this->status) - $this->setZakatProfesi($this->agama);
        return $GB;
    }

    //mencetak => nip, nama, jabatan, agama, status, 
    //Gaji Pokok, Tunj Jab, Tunkel, Zakat, Gaji Bersih
    public function cetak(){
        echo '<b><u>'.self::PT.'</u></b><br>';
        echo 'NIP Pegawai => '.$this->nip;
        echo '<br>Nama Pegawai => '.$this->nama;
        echo '<br>Jabatan => '. $this->jabatan;
        echo '<br>Agama => '.$this->agama;
        echo '<br>Status => '.$this->status;
        echo '<br>Gaji Pokok => Rp.'.number_format($this->setGajiPokok($this->jabatan),0,',','.');
        echo "<br>Tunjangan Jabatan => Rp.".number_format($this->setTunjJab($this->jabatan),0,',','.');
        echo "<br>Tunjangan Keluarga => Rp.".number_format($this->setTunKel($this->status),0,',','.');
        echo "<br>Zakat Profesi => Rp.".number_format($this->setZakatProfesi($this->agama),0,',','.');
        echo "<br>Gaji Bersih => Rp.".number_format($this->setGajiBersih(),0,',','.');
        echo '<hr>';

    }


}
?>