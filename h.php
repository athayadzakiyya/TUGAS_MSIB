<?php
// 1. setTunjab = 20% dari gaji pokok
// 2. setTunkel = 10% dari gaji pokok untuk sudah menikah (ternary)
// 3. setZakatProfesi = 2,5% dari gaji pokok untuk muslim dan gaji kotor minimal 6jt
// 4. mencetak => nip, nama, jabatan, agama, status, gaji pokok, tunjab, tunkel, zakat, gaji bersih

// Buatlah objPegawai dengan data:
// - 5 instance object pewagai
// - cetaklah semua struktur gaji pegawai
    class Pegawai{
        protected $nip;
        public $nama;
        private $jabatan;
        private $agama;
        private $status;
        static $jml = 0;
        const PT = 'PT. HTP Indonesia';

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
                default: $gapok = 0;
            }
            return $gapok;
        }

        public function setTunjab($jabatan){
            $this->jabatan = $jabatan;
            $tunjab = $this->setGajiPokok($jabatan) * 0.2;
            return $tunjab;
        }

        public function setTunkel($status){
            $this->status = $status;
            $tunkel = ($this->status == 'Menikah') ? $this->setGajiPokok($this->jabatan) * 0.1 : 0;
            return $tunkel;
        }

        public function setZakatProfesi($agama){
            $this->agama = $agama;
            $zakat = ($this->agama == 'Islam' && $this->setGajiPokok($this->jabatan) > 6000000) ? $this->setGajiPokok($this->jabatan) * 0.025 : 0;
            return $zakat;
        }


        public function getGajiPokok(){
            return $this->setGajiPokok($this->jabatan);
        }

        public function getTunjab(){
            return $this->setTunjab($this->jabatan);
        }

        public function getTunkel(){
            return $this->setTunkel($this->status);
        }

        public function getZakatProfesi(){
            return $this->setZakatProfesi($this->agama);
        }

        public function getGajiBersih(){
            return $this->getGajiPokok() + $this->getTunjab() + $this->getTunkel() - $this->getZakatProfesi();
        }

        public function cetak(){
            echo "NIP : ".$this->nip."<br>";
            echo "Nama : ".$this->nama."<br>";
            echo "Jabatan : ".$this->jabatan."<br>";
            echo "Agama : ".$this->agama."<br>";
            echo "Status : ".$this->status."<br>";
            echo "Gaji Pokok : ".$this->getGajiPokok()."<br>";
            echo "Tunjangan Jabatan : ".$this->getTunjab()."<br>";
            echo "Tunjangan Keluarga : ".$this->getTunkel()."<br>";
            echo "Zakat Profesi : ".$this->getZakatProfesi()."<br>";
            echo "Gaji Bersih : ".$this->getGajiBersih()."<br>";
            echo "<hr>";
        }
    }
?>