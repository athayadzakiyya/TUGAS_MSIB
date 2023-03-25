<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tugas 2 PHP</title>
</head>
<body style="background-color:rgb(172, 130, 211)" align="center">

    <form method="post">
    <table border="3" align="center" cellpadding="10" width="30%">

            <thead>
                <tr bgcolor="white">
                    <th colspan="2">Gaji Karyawan</th>
                </tr>
            </thead>

            <tbody>
                <tr>
                    <tr>
                        <td>Nama</td>
                        <td><input type="text" style="width:75%" name="nama" placeholder="masukan nama" require></td>
                    </tr>
                    <tr>
                        <td>Jabatan</td>
                        <td>
                            <select name="jabatan" style="width:75%">
                            <option>----pilih jabatan----</option>
                            <option value="Manager">Manager</option>
                            <option value="Asisten">Asisten</option>
                            <option value="Kepala Bagian">Kepala Bagian</option>
                            <option value="Staff">Staff</option>
                        </select>
                    </td>
                    </tr>
                    <tr>
                        <td>Status</td>
                        <td> 
                        <input type="text" style="width:75%" name="status" placeholder="statusmu" require>                     
                    </td>
                    </tr>
                    <tr>
                        <td>Jumlah Anak</td>
                        <td>
                        <select name="jmlh_anak" style="width:75%">
                            <option>----jumlah anak----</option>
                            <option value="2">Kurang dari 2</option>
                            <option value="5">Antara 3-5</option>
                            <option value="0">tidak ada</option>
                            
                        </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Agama</td>
                        <td>
                        <select name="agama" style="width:75%">
                            <option>----pilih agama----</option>
                            <option value="Islam">Islam</option>
                            <option value="Budha">Budha</option>
                            <option value="Hindhu">Hindhu</option>
                            <option value="Kristen">Kristen</option>
                            <option value="Lain">Lainnya</option>
                         </td>
                    </tr>
            </tbody>

            <tfoot bgcolor="white">
                    <td colspan="2" align="right">
                    <button type="submit" name="simpan">simpan</button>
                    </td>
            </tfoot>
</table>
    </form>

    <?php 
    $nama = $_POST ['nama'];
    $jabatan = $_POST['jabatan'];
    $TunjanganKeluarga = $_POST['jmlh_anak'];
    $agama = $_POST['agama'];
    $status = $_POST['status'];
    $button = $_POST['simpan'];


    switch($agama){
        case "Islam" :
             $agama = "Islam"; 
             break;
        case "Kristen" :
            $agama = "Kristen"; 
              break;
        case "Hindhu" :
            $agama = "Hindhu"; 
              break;
        case "Budha" :
            $agama = "Budha"; 
              break;
        default:
         $agama = 0;
    }
    
    switch($jabatan){
        case "Manager" :
             $GajiPokok = 20000000; 
             break;
        case "Asisten" :
            $GajiPokok = 15000000;
              break;
        case "Kepala Bagian" :
            $GajiPokok = 10000000;
              break;
        case "Staff" :
            $GajiPokok = 4000000;
              break;
        default:
         $GajiPokok = 0;
    }

    $TunjanganJabatan = 0.2 * $GajiPokok;

    if($TunjanganKeluarga == 2) $TunjanganKeluarga= 0.05 * $GajiPokok;
    else if ($TunjanganKeluarga = 5 ) $TunjanganKeluarga = 0.1 * $GajiPokok;
    else $TunjanganKeluarga = 0;

    $gajiKotor = $GajiPokok + $TunjanganJabatan + $TunjanganKeluarga;

    if($agama == "islam" && $gajiKotor >= 6000000 ) $zakat = 0.025 * $gajiKotor;
    else $zakat = 0;
    

    if(isset($button)){
        ?>
        <fieldset padding= 5px>
        <legend>Hasil:</legend>
        Nama Karyawan : <?= $nama ?> 
        <br> Jabatan : <?= $jabatan ?>
        <br> Status : <?= $status ?>
        <br> Gaji Pokok : <?= $GajiPokok ?>
        <br> Tunjangan Jabatan : <?= $TunjanganJabatan ?>
        <br> Tunjangan Keluarga : <?= $TunjanganKeluarga ?>
        <br> Gaji Kotor : <?= $gajiKotor ?>
        <br> Jumlah Zakat Profesi : <?= $zakat ?>

        </fieldset>
        <?php 
    } ?>
</body>
</html>