Soal 3.1

1. Tampilkan produk yang asset nya diatas 20jt
MariaDB [dbpos]> SELECT * FROM produk WHERE harga_beli * stok > 20000000;
+----+------+--------+------------+------------+------+----------+-----------------+
| id | kode | nama   | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+--------+------------+------------+------+----------+-----------------+
|  3 | K001 | Kulkas |    4000000 |    5000000 |   10 |        3 |               1 |
+----+------+--------+------------+------------+------+----------+-----------------+
1 row in set (0.021 sec)

2. Tampilkan data produk beserta selisih stok dengan minimal stok
MariaDB [dbpos]> SELECT SUM(stok - min_stok) as selisih from produk;
+---------+
| selisih |
+---------+
|       9 |
+---------+
1 row in set (0.015 sec)

3. Tampilkan total asset produk secara keseluruhan
MariaDB [dbpos]> SELECT sum(stok) as total_asset from produk;
+-------------+
| total_asset |
+-------------+
|          32 |
+-------------+
1 row in set (0.001 sec)

4. Tampilkan data pelanggan yang lahirnya antara tahun 1999 sampai 2004
MariaDB [dbpos]> SELECT * FROM pelanggan WHERE YEAR(tgl_lahir) BETWEEN 1999 AND 2004;
+----+--------+----------------+------+-----------+------------+-------------------+----------+------------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | tgl_lahir  | email             | kartu_id | alamat     |
+----+--------+----------------+------+-----------+------------+-------------------+----------+------------+
|  3 | 011103 | Sekar          | P    | Kediri    | 2001-09-08 | sekar@gmail.com   |        3 | Jakarta    |
|  5 | 011105 | Pradana        | L    | Jakarta   | 2001-08-01 | pradana@gmail.com |        2 | Medan      |
|  6 | 011106 | Gayatri        | P    | Jakarta   | 2002-09-01 | gayatri@gmail.com |        1 | Yogyakarta |
+----+--------+----------------+------+-----------+------------+-------------------+----------+------------+
3 rows in set (0.025 sec)

5. Tampilkan data pelanggan yang lahirnya tahun 1998
MariaDB [dbpos]> SELECT * FROM pelanggan WHERE YEAR(tgl_lahir)=1998;
+----+--------+----------------+------+------------+------------+-----------------------+----------+------------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email                 | kartu_id | alamat     |
+----+--------+----------------+------+------------+------------+-----------------------+----------+------------+
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1998-08-07 | pandanwangi@gmail.com |        2 | Yogyakarta |
+----+--------+----------------+------+------------+------------+-----------------------+----------+------------+
1 row in set (0.003 sec)

6. Tampilkan data pelanggan yang berulang tahun bulan agustus
MariaDB [dbpos]> SELECT * FROM pelanggan WHERE MONTH(tgl_lahir)=08;
+----+--------+----------------+------+------------+------------+-----------------------+----------+------------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email                 | kartu_id | alamat     |
+----+--------+----------------+------+------------+------------+-----------------------+----------+------------+
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1998-08-07 | pandanwangi@gmail.com |        2 | Yogyakarta |
|  5 | 011105 | Pradana        | L    | Jakarta    | 2001-08-01 | pradana@gmail.com     |        2 | Medan      |
+----+--------+----------------+------+------------+------------+-----------------------+----------+------------+
2 rows in set (0.002 sec)

7. Tampilkan data pelanggan : nama, tmp_lahir, tgl_lahir dan umur (selisih tahun sekarang dikurang tahun kelahiran)
MariaDB [dbpos]> SELECT nama_pelanggan, tmp_lahir, tgl_lahir, (YEAR(NOW())-YEAR(tgl_lahir)) AS umur FROM pelanggan;
+----------------+------------+------------+------+
| nama_pelanggan | tmp_lahir  | tgl_lahir  | umur |
+----------------+------------+------------+------+
| Agung          | Bandung    | 1997-09-06 |   26 |
| Pandan Wangi   | Yogyakarta | 1998-08-07 |   25 |
| Sekar          | Kediri     | 2001-09-08 |   22 |
| Suandi         | Jakarta    | 1997-09-08 |   26 |
| Pradana        | Jakarta    | 2001-08-01 |   22 |
| Gayatri        | Jakarta    | 2002-09-01 |   21 |
+----------------+------------+------------+------+
6 rows in set (0.002 sec)


Soal 3.2

1. Berapa jumlah pelanggan yang tahun lahirnya 1998
MariaDB [dbpos]> select count(*) as jumlah_pelanggan from pelanggan where year(tgl_lahir) = 1998;
+------------------+
| jumlah_pelanggan |
+------------------+
|                1 |
+------------------+
1 row in set (0.006 sec)

2. Berapa jumlah pelanggan perempuan yang tempat lahirnya di Jakarta
MariaDB [dbpos]> SELECT COUNT(*) AS jumlah_pelanggan FROM pelanggan WHERE jk='P' AND tmp_lahir='Jakarta';
+------------------+
| jumlah_pelanggan |
+------------------+
|                1 |
+------------------+
1 row in set (0.015 sec)

3. Berapa jumlah total stok semua produk yang harga jualnya dibawah 10rb
MariaDB [dbpos]> SELECT SUM(stok) AS total_stok FROM produk WHERE harga_jual < 10000;
+------------+
| total_stok |
+------------+
|          5 |
+------------+
1 row in set (0.006 sec)

4. Ada berapa produk yang mempunyai kode awal K
MariaDB [dbpos]> SELECT count(*) AS jumlah_produk FROM produk WHERE kode like  'K%';
+---------------+
| jumlah_produk |
+---------------+
|             1 |
+---------------+
1 row in set (0.009 sec)

5. Berapa harga jual rata-rata produk yang diatas 1jt
MariaDB [dbpos]> SELECT AVG(harga_jual) AS harga_rata2 FROM produk WHERE harga_jual > 1000000;
+-------------+
| harga_rata2 |
+-------------+
|     3500000 |
+-------------+
1 row in set (0.001 sec)

6. Tampilkan jumlah stok yang paling besar
MariaDB [dbpos]> SELECT MAX(stok) AS jumlah_stok_terbesar FROM produk;
+----------------------+
| jumlah_stok_terbesar |
+----------------------+
|                   10 |
+----------------------+
1 row in set (0.003 sec)

7. Ada berapa produk yang stoknya kurang dari minimal stok
MariaDB [dbpos]> SELECT COUNT(*) AS jumlah_produk FROM produk WHERE stok < min_stok;
+---------------+
| jumlah_produk |
+---------------+
|             1 |
+---------------+
1 row in set (0.001 sec)

8. Berapa total asset dari keseluruhan produk
MariaDB [dbpos]>  SELECT SUM(stok) AS total_asset FROM produk;
+-------------+
| total_asset |
+-------------+
|          32 |
+-------------+
1 row in set (0.001 sec)

Soal 3.3

1. Tampilkan data produk : id, nama, stok dan informasi jika stok telah sampai batas minimal atau kurang dari minimum stok dengan informasi ‘segera belanja’ jika tidak ‘stok aman’.
MariaDB [dbpos]> SELECT id, nama, stok,
    -> case
    -> WHEN stok <= min_stok THEN 'Segera Belanja'
    -> ELSE 'Stok Aman'
    -> END AS Informasi
    -> FROM produk;
+----+------------+------+----------------+
| id | nama       | stok | Informasi      |
+----+------------+------+----------------+
|  1 | TV         |    3 | Stok Aman      |
|  2 | TV 21 Inch |   10 | Stok Aman      |
|  3 | Kulkas     |   10 | Stok Aman      |
|  4 | Meja Makan |    4 | Stok Aman      |
|  5 | Taro       |    3 | Stok Aman      |
|  6 | Teh Kotak  |    2 | Segera Belanja |
+----+------------+------+----------------+
6 rows in set (0.003 sec)

2. Tampilkan data pelanggan: id, nama, umur dan kategori umur : jika umur < 17 → ‘muda’ , 17-55 → ‘Dewasa’, selainnya ‘Tua’
MariaDB [dbpos]> SELECT id, nama_pelanggan, timestampdiff(year, tgl_lahir, curdate()) AS umur,
    ->  CASE
    -> WHEN timestampdiff(year, tgl_lahir, curdate()) < 17 THEN 'Muda'
    -> WHEN timestampdiff(year, tgl_lahir, curdate()) > 17 AND timestampdiff(year, tgl_lahir, curdate()) <= 55 THEN 'Dewasa'
    -> ELSE 'Tua'
    -> END AS 'kategori_umur'
    -> FROM pelanggan;
+----+----------------+------+---------------+
| id | nama_pelanggan | umur | kategori_umur |
+----+----------------+------+---------------+
|  1 | Agung          |   25 | Dewasa        |
|  2 | Pandan Wangi   |   24 | Dewasa        |
|  3 | Sekar          |   21 | Dewasa        |
|  4 | Suandi         |   25 | Dewasa        |
|  5 | Pradana        |   21 | Dewasa        |
|  6 | Gayatri        |   20 | Dewasa        |
+----+----------------+------+---------------+
6 rows in set (0.009 sec)

3. Tampilkan data produk: id, kode, nama, dan bonus untuk kode ‘TV01’ →’DVD Player’ , ‘K001’ → ‘Rice Cooker’ selain dari diatas ‘Tidak Ada’
MariaDB [dbpos]> SELECT id, kode, nama,
    ->  CASE
    -> WHEN kode='TV01' THEN 'DVD Player'
    -> WHEN kode='K001' THEN 'Rice Cooker'
    -> ELSE 'Tidak Ada'
    -> END AS bonus
    -> FROM produk;
+----+------+------------+-------------+
| id | kode | nama       | bonus       |
+----+------+------------+-------------+
|  1 | TV01 | TV         | DVD Player  |
|  2 | TV02 | TV 21 Inch | Tidak Ada   |
|  3 | K001 | Kulkas     | Rice Cooker |
|  4 | M001 | Meja Makan | Tidak Ada   |
|  5 | T001 | Taro       | Tidak Ada   |
|  6 | TK01 | Teh Kotak  | Tidak Ada   |
+----+------+------------+-------------+
6 rows in set (0.001 sec)

Soal 3.4

1. Tampilkan data statistik jumlah tempat lahir pelanggan
MariaDB [dbpos]> SELECT tmp_lahir, COUNT(tmp_lahir) AS jumlah_pelanggan FROM pelanggan GROUP BY tmp_lahir;
+------------+------------------+
| tmp_lahir  | jumlah_pelanggan |
+------------+------------------+
| Bandung    |                1 |
| Jakarta    |                3 |
| Kediri     |                1 |
| Yogyakarta |                1 |
+------------+------------------+
4 rows in set (0.009 sec)

2. Tampilkan jumlah statistik produk berdasarkan jenis produk
MariaDB [dbpos]> SELECT jenis_produk_id, COUNT(jenis_produk_id) AS jumlah_produk FROM produk GROUP BY jenis_produk_id;
+-----------------+---------------+
| jenis_produk_id | jumlah_produk |
+-----------------+---------------+
|               1 |             3 |
|               2 |             1 |
|               3 |             1 |
|               4 |             1 |
+-----------------+---------------+
4 rows in set (0.001 sec)

3. Tampilkan data pelanggan yang usianya dibawah rata usia pelanggan
MariaDB [dbpos]> SELECT AVG(timestampdiff(year, tgl_lahir, curdate())) AS rata2_usia FROM pelanggan;
+------------+
| rata2_usia |
+------------+
|    22.6667 |
+------------+
1 row in set (0.001 sec)

MariaDB [dbpos]> SELECT * ,  timestampdiff(year, tgl_lahir, curdate()) AS umur FROM pelanggan
    -> WHERE timestampdiff(year, tgl_lahir, curdate()) <  (SELECT AVG(timestampdiff(year, tgl_lahir, curdate())) AS rata2_usia FROM pelanggan);
+----+--------+----------------+------+-----------+------------+-------------------+----------+------------+------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | tgl_lahir  | email             | kartu_id | alamat     | umur |
+----+--------+----------------+------+-----------+------------+-------------------+----------+------------+------+
|  3 | 011103 | Sekar          | P    | Kediri    | 2001-09-08 | sekar@gmail.com   |        3 | Jakarta    |   21 |
|  5 | 011105 | Pradana        | L    | Jakarta   | 2001-08-01 | pradana@gmail.com |        2 | Medan      |   21 |
|  6 | 011106 | Gayatri        | P    | Jakarta   | 2002-09-01 | gayatri@gmail.com |        1 | Yogyakarta |   20 |
+----+--------+----------------+------+-----------+------------+-------------------+----------+------------+------+
3 rows in set (0.008 sec)

4. Tampilkan data produk yang harganya diatas rata-rata harga produk
MariaDB [dbpos]> SELECT AVG(harga_beli) AS rata2_harga FROM produk;
+--------------------+
| rata2_harga        |
+--------------------+
| 1667833.3333333333 |
+--------------------+
1 row in set (0.001 sec)

MariaDB [dbpos]> SELECT * FROM produk WHERE harga_beli > (SELECT AVG(harga_beli) FROM produk);
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
+----+------+------------+------------+------------+------+----------+-----------------+
3 rows in set (0.004 sec)

5. Tampilkan data pelanggan yang memiliki kartu dimana iuran tahunan kartu diatas 90rb
MariaDB [dbpos]> SELECT * FROM pelanggan INNER JOIN kartu ON pelanggan.kartu_id = kartu.id WHERE kartu.iuran > 90000;
Empty set (0.002 sec)

6. Tampilkan statistik data produk dimana harga produknya dibawah rata-rata harga produk secara keseluruhan
MariaDB [dbpos]> SELECT AVG(harga_beli) AS rata2_harga_produk, COUNT(*) AS jumlah_produk FROM produk WHERE harga_beli < (SELECT AVG(harga_beli) FROM produk);
+--------------------+---------------+
| rata2_harga_produk | jumlah_produk |
+--------------------+---------------+
|  335666.6666666667 |             3 |
+--------------------+---------------+
1 row in set (0.001 sec)

7. Tampilkan data pelanggan yang memiliki kartu dimana diskon kartu yang diberikan diatas 3%
MariaDB [dbtoko1]> SELECT * FROM pelanggan INNER JOIN kartu ON pelanggan.kartu_id = kartu.id WHERE kartu.diskon > 0.03;
+----+--------+----------------+------+------------+------------+-----------------------+------------+----------+----+-------+--------+--------+-------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email                 | alamat     | kartu_id | id | kode  | nama   | diskon | iuran |
+----+--------+----------------+------+------------+------------+-----------------------+------------+----------+----+-------+--------+--------+-------+
|  1 | 011101 | Agung          | L    | Bandung    | 1997-09-06 | agung@gmail.com       | Bandung    |        1 |  1 | 10111 | Gold   |  20000 |  2000 |
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1998-08-07 | pandanwangi@gmail.com | Yogyakarta |        2 |  2 | 10112 | Silver |  15000 |  1500 |
|  3 | 011103 | Sekar          | P    | Kediri     | 2001-09-08 | sekar@gmail.com       | Jakarta    |        3 |  2 | 10112 | Silver |  15000 |  1500 |
|  4 | 011104 | Suandi         | L    | Jakarta    | 1997-09-08 | suandi@gmail.com      | Bandung    |        1 |  1 | 10111 | Gold   |  20000 |  2000 |
|  5 | 011105 | Pradana        | L    | Jakarta    | 2001-08-01 | pradana@gmail.com     | Medan      |        2 |  2 | 10112 | Silver |  15000 |  1500 |
|  6 | 011106 | Gayatri        | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com     | Yogyakarta |        1 |  1 | 10111 | Gold   |  20000 |  2000 |
+----+--------+----------------+------+------------+------------+------------------+------------+----------+----+----+-------+--------+--------+-------+
5 rows in set (0.001 sec)


