<?php
$ar_prodi = ["SI"=>"Sistem Informasi", "TI"=>"Teknik Informatika","ILKOM"=>"Ilmu Komputer","TE"=>"Teknik Elektro"];
$ar_skill = ["HTML"=>10,"CSS"=>10, "Javascript"=>20, "RWD Bootstrap"=>20, "PHP"=>30, "Phython"=>30,"Laravel"=>40];
$domisili = ["Jakarta","Bandung","Bekasi","Malang","Surabaya", "lainnya"];
$jenis_kel = ["L"=>"Laki-Laki", "P"=>"Perempuan"];
?>

<fieldset style="background-color:lightsalmon">
    <legend>Form Registrasi Kelompok Belajar</legend>
    <table border="1" width="60%" cellpadding="5"  align="center">
        <thead>
            <th colspan="2" bgcolor="white">Form Registrasi</th>
        </thead>
        <tbody>
            <form method="POST">
                <tr>
                    <td>NIM </td>
                    <td>
                        <input type="text" name="nim" style="width:30%">
                    </td>
                </tr>
                <tr>
                    <td>Nama </td>
                    <td>
                        <input type="text" name="nama" style="width:30%">
                    </td>
                </tr>
                <tr>
                    <td>Email </td>
                    <td>
                        <input type="text" name="email" style="width:30%">
                    </td>
                </tr>
                <tr>
                    <td>Jenis Kelamin </td>
                    <td>
                        <?php
                        foreach($jenis_kel as $jk => $j){
                            ?>
                        <input type="radio" name ="jk" value="<?= $jk ?>"><?= $j ?> &nbsp;
                        <?php } ?>
                    </td>
                </tr>
                
                <tr>
                    <td>Program Studi  </td>
                    <td>
                        <select name="prodi" style="width:30%">
                            <?php
                            foreach($ar_prodi as $prodi => $v){
                                ?>
                                <option value="<?= $prodi ?>"><?= $v ?></option>
                            <?php } ?>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Skill Programming </td>
                    <td>
                        <?php
                        foreach($ar_skill as $skill => $s){
                            ?>
                        <input type="checkbox" name="skill[]" value=<?= $skill ?>><?= $skill ?> &nbsp;
                        <?php } ?>
                    </td>
                </tr>
                <tr>
                    <td>Program Studi </td>
                    <td>
                        <select name="domisili" style="width:30%">
                            <?php
                            foreach($domisili as $d){
                                ?>
                                <option value="<?= $d ?>"><?= $d ?></option>
                            <?php } ?>
                        </select>
                    </td>
                </tr>
            
        </tbody>
        <tfoot>
            <th colspan="2">
                <button name="submit">Submit</button>
            </th>
        </tfoot>
    </table>
</fieldset>




<?php
error_reporting(0);
if(isset($_POST['submit'])){
    $nim = $_POST['nim'];
    $nama = $_POST['nama'];
    $jk = $_POST['jk'];
    $prodi = $_POST['prodi'];
    $skill = $_POST['skill'];
    $domisili = $_POST['domisili'];
    $email = $_POST['email'];
}

$total = 0;
foreach($skill as $t ){
    if(isset($ar_skill[$t])){
        $total += $ar_skill[$t];
    }
}

function kategori($total){
    if($total >= 100 && $total <= 150){
        return "Sangat Baik";
    }else if($total >= 60 && $total <= 100){
        return "Baik";
    }else if($total >= 40 && $total <= 60){
        return "Cukup";
    }else if($total >= 0 && $total <= 40){
        return "Kurang";
    }else{return "Tidak Memadai";
    }
}
?>

NIM : <?= $nim ?><br>
Nama : <?= $nama ?><br>
Jenis Kelamin : <?= $jk ?><br>
Program Studi : <?= $prodi ?><br>
Skill : <?php 
        foreach($skill as $s){ ?>
        <?= $s ?> ,
        <?php } ?> <br>
Skor Skill : <?= $total ?> <br>
Kategori Skill : <?= kategori($total) ?> <br>
Domisili : <?= $domisili ?><br>
Email : <?= $email ?>