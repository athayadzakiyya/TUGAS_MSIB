<marquee   direction="right" >
<H2 align="center">DAFTAR NILAI MAHASISWA</H2>
</marquee>
<?php
    $m1 = ['NIM'=>'01111021', 'nama'=>'Andi', 'nilai'=>80];
    $m2 = ['NIM'=>'01111022', 'nama'=>'Ani', 'nilai'=>70];
    $m3 = ['NIM'=>'01111023', 'nama'=>'Ari', 'nilai'=>50];
    $m4 = ['NIM'=>'01111024', 'nama'=>'Aji', 'nilai'=>40];
    $m5 = ['NIM'=>'01111025', 'nama'=>'Ali', 'nilai'=>90];
    $m6 = ['NIM'=>'01111026', 'nama'=>'Ai', 'nilai'=>75];
    $m7 = ['NIM'=>'01111027', 'nama'=>'Budi', 'nilai'=>30];
    $m8 = ['NIM'=>'01111028', 'nama'=>'Bani', 'nilai'=>85];
    $mahasiswa = [$m1,$m2,$m3,$m4,$m5,$m6,$m7,$m8];
    $ar_judul = ['No','NIM','Nama','Nilai','Keterangan','Grade','Predikat'];

    //fungsi-fungsi sederhana
    $jumlah_mahasiswa = count($mahasiswa);
    $jml_nilai = array_column($mahasiswa,'nilai');
    $total_nilai = array_sum($jml_nilai);
    $max_nilai = max($jml_nilai);
    $min_nilai = min($jml_nilai);
    $keterangan = [
        'Jumlah Mahasiswa'=>$jumlah_mahasiswa,
        'Nilai Tertinggi'=>$max_nilai,
        'Nilai Terendah'=>$min_nilai,
        'Rata-Rata Nilai Mahasiswa'=>$total_nilai/$jumlah_mahasiswa
    ]

?>

<!-- membuat tabel -->
<table border="1" width="60%" cellpadding="10" bgcolor="lightgreen" align="center">
    <thead >
        <tr>
            <?php
            foreach($ar_judul as $judul){?>
                <th><?= $judul ?></th>
                <?php
            }?>
        </tr>
    </thead>
    <tbody align="center">
        <?php
        $no = 1;
        foreach($mahasiswa as $mhs){
            $ket = ($mhs['nilai']>= 60) ? 'Lulus' : 'Tidak lulus';
            //grade
            if ($mhs['nilai'] >= 80 && $mhs['nilai'] <= 100) $grade = 'A';
            else if ($mhs['nilai']>= 75 && $mhs['nilai'] < 79) $grade = 'B';
            else if ($mhs['nilai']>= 60 && $mhs['nilai'] < 74) $grade = 'C';
            else if ($mhs['nilai']>= 30 && $mhs['nilai'] < 59) $grade = 'D';
            else if ($mhs['nilai']>= 0 && $mhs['nilai'] < 29) $grade = 'E';
            else $grade = '';

            //predikat
            switch ($grade){
                case "A" : $predikat = "Memuaskan"; break;
                case "B" : $predikat = "Bagus"; break;
                case "C" : $predikat = "Cukup"; break;
                case "D" : $predikat = "Kurang"; break;
                case "E" : $predikat = "Buruk"; break;
                default: $predikat ="";
            }
        ?>
        <tr>
            <td><?= $no ?></td>
            <td><?= $mhs['NIM']?></td>
            <td><?= $mhs['nama']?></td>
            <td><?= $mhs['nilai']?></td>
            <td><?= $ket ?></td>
            <td><?= $grade ?></td>
            <td><?= $predikat ?></td>
        </tr>
        <?php $no++;
        } ?>
    </tbody>
    <tfoot>
        <?php
        foreach($keterangan as $k =>$hasil){
    ?>
    <tr>
        <th colspan="6"><?= $k ?></th>
        <th><?= $hasil ?></th>

        </tr>
    <?php } ?>
    </tfoot>
    </table>