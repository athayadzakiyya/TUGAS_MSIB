-- isi data table pelanggan --
MariaDB [dbpos]> SELECT * FROM pelanggan;
+----+--------+----------------+------+------------+------------+-----------------------+----------+------------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email                 | kartu_id | alamat     |
+----+--------+----------------+------+------------+------------+-----------------------+----------+------------+
|  1 | 011101 | Agung          | L    | Bandung    | 1997-09-06 | agung@gmail.com       |        1 | Bandung    |
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1998-08-07 | pandanwangi@gmail.com |        2 | Yogyakarta |
|  3 | 011103 | Sekar          | P    | Kediri     | 2001-09-08 | sekar@gmail.com       |        3 | Jakarta    |
|  4 | 011104 | Suandi         | L    | Jakarta    | 1997-09-08 | suandi@gmail.com      |        1 | Bandung    |
|  5 | 011105 | Pradana        | L    | Jakarta    | 2001-08-01 | pradana@gmail.com     |        2 | Medan      |
|  6 | 011106 | Gayatri        | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com     |        1 | Yogyakarta |
+----+--------+----------------+------+------------+------------+-----------------------+----------+------------+
6 rows in set (0.000 sec)

-- isi data table produk --
MariaDB [dbpos]> SELECT * FROM produk;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        3 |               4 |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 |
|  6 | TK01 | Teh Kotak  |       3000 |       4000 |    2 |       10 |               3 |
+----+------+------------+------------+------------+------+----------+-----------------+
6 rows in set (0.000 sec)

-- isi data table jenis produk --
MariaDB [dbpos]> SELECT * FROM jenis_produk;
+----+-------------+----------------+
| id | nama        | ket            |
+----+-------------+----------------+
|  1 | elektronika | tersedia       |
|  2 | makanan     | tersedia       |
|  3 | minuman     | tidak tersedia |
|  4 | furniture   | tersedia       |
+----+-------------+----------------+
4 rows in set (0.001 sec)


SOAL 2.1

-- Tampilkan seluruh data produk diurutkan berdasarkan harga_jual mulai dari yang termahal --
-- DSC : dari yang terbawah urutan --
MariaDB [dbpos]> SELECT * FROM produk ORDER BY harga_beli DESC LIMIt 4;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        3 |               4 |
+----+------+------------+------------+------------+------+----------+-----------------+
4 rows in set (0.001 sec)

-- Tampilkan data kode, nama, tmp_lahir, tgl_lahir dari table pelanggan --
MariaDB [dbpos]> select kode, nama_pelanggan, tmp_lahir, tgl_lahir from pelanggan;
+--------+----------------+------------+------------+
| kode   | nama_pelanggan | tmp_lahir  | tgl_lahir  |
+--------+----------------+------------+------------+
| 011101 | Agung          | Bandung    | 1997-09-06 |
| 011102 | Pandan Wangi   | Yogyakarta | 1998-08-07 |
| 011103 | Sekar          | Kediri     | 2001-09-08 |
| 011104 | Suandi         | Kediri     | 1997-09-08 |
| 011105 | Pradana        | Jakarta    | 2001-08-01 |
| 011106 | Gayatri        | Jakarta    | 2002-09-01 |
+--------+----------------+------------+------------+
6 rows in set (0.002 sec)

-- Tampilkan kode,nama,stok dari table produk yang stok-nya hanya 4 --
MariaDB [dbpos]> select kode, nama, stok from produk where stok=4;
+------+------------+------+
| kode | nama       | stok |
+------+------------+------+
| M001 | Meja Makan |    4 |
+------+------------+------+
1 row in set (0.014 sec)

-- Tampilkan seluruh data pelanggan yang tempat lahirnya Jakarta --
MariaDB [dbpos]> select * from pelanggan where tmp_lahir='jakarta';
+----+--------+----------------+------+-----------+------------+-------------------+----------+------------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | tgl_lahir  | email             | kartu_id | alamat     |
+----+--------+----------------+------+-----------+------------+-------------------+----------+------------+
|  4 | 011104 | Suandi         | L    | Jakarta   | 1997-09-08 | suandi@gmail.com  |        1 | Bandung    |
|  5 | 011105 | Pradana        | L    | Jakarta   | 2001-08-01 | pradana@gmail.com |        2 | Medan      |
|  6 | 011106 | Gayatri        | P    | Jakarta   | 2002-09-01 | gayatri@gmail.com |        1 | Yogyakarta |
+----+--------+----------------+------+-----------+------------+-------------------+----------+------------+
3 rows in set (0.003 sec)

-- Tampilkan kode, nama, tmp_lahir, tgl_lahir dari pelanggan diurutkan dari yang paling muda usianya --
-- DSC : dari yang terbawah urutan --
MariaDB [dbpos]> SELECT kode, nama_pelanggan, tmp_lahir, tgl_lahir from pelanggan ORDER BY tgl_lahir DESC;
+--------+----------------+------------+------------+
| kode   | nama_pelanggan | tmp_lahir  | tgl_lahir  |
+--------+----------------+------------+------------+
| 011106 | Gayatri        | Jakarta    | 2002-09-01 |
| 011103 | Sekar          | Kediri     | 2001-09-08 |
| 011105 | Pradana        | Jakarta    | 2001-08-01 |
| 011102 | Pandan Wangi   | Yogyakarta | 1998-08-07 |
| 011104 | Suandi         | Jakarta    | 1997-09-08 |
| 011101 | Agung          | Bandung    | 1997-09-06 |
+--------+----------------+------------+------------+
6 rows in set (0.002 sec)

SOAL 2.2

-- Tampilkan data produk yang stoknya 3 dan 10 --
MariaDB [dbpos]> select * from produk where stok=3 or stok=10;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 |
+----+------+------------+------------+------------+------+----------+-----------------+
4 rows in set (0.001 sec)

-- Tampilkan data produk yang harga jualnya kurang dari 5 juta tetapi lebih dari 500 ribu --
MariaDB [dbpos]> select * from produk where harga_jual<5000000 and harga_jual>500000;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        3 |               4 |
+----+------+------------+------------+------------+------+----------+-----------------+
3 rows in set (0.006 sec)

-- Tampilkan data produk yang harus segera ditambah stoknya --
MariaDB [dbpos]> SELECT * FROM produk WHERE min_stok > stok;
+----+------+-----------+------------+------------+------+----------+-----------------+
| id | kode | nama      | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+-----------+------------+------------+------+----------+-----------------+
|  6 | TK01 | Teh Kotak |       3000 |       4000 |    2 |       10 |               3 |
+----+------+-----------+------------+------------+------+----------+-----------------+
1 row in set (0.001 sec)

-- Tampilkan data pelanggan mulai dari yang paling muda --
-- DSC : dari yang terbawah urutan --
MariaDB [dbpos]> SELECT * from pelanggan ORDER BY tgl_lahir DESC;
+----+--------+----------------+------+------------+------------+-----------------------+----------+------------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email                 | kartu_id | alamat     |
+----+--------+----------------+------+------------+------------+-----------------------+----------+------------+
|  6 | 011106 | Gayatri        | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com     |        1 | Yogyakarta |
|  3 | 011103 | Sekar          | P    | Kediri     | 2001-09-08 | sekar@gmail.com       |        3 | Jakarta    |
|  5 | 011105 | Pradana        | L    | Jakarta    | 2001-08-01 | pradana@gmail.com     |        2 | Medan      |
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1998-08-07 | pandanwangi@gmail.com |        2 | Yogyakarta |
|  4 | 011104 | Suandi         | L    | Jakarta    | 1997-09-08 | suandi@gmail.com      |        1 | Bandung    |
|  1 | 011101 | Agung          | L    | Bandung    | 1997-09-06 | agung@gmail.com       |        1 | Bandung    |
+----+--------+----------------+------+------------+------------+-----------------------+----------+------------+
6 rows in set (0.001 sec)

-- Tampilkan data pelanggan yang lahirnya di Jakarta dan gendernya perempuan --
MariaDB [dbpos]> SELECT * from pelanggan where tmp_lahir = 'jakarta' and jk = 'P';
+----+--------+----------------+------+-----------+------------+-------------------+----------+------------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | tgl_lahir  | email             | kartu_id | alamat     |
+----+--------+----------------+------+-----------+------------+-------------------+----------+------------+
|  6 | 011106 | Gayatri        | P    | Jakarta   | 2002-09-01 | gayatri@gmail.com |        1 | Yogyakarta |
+----+--------+----------------+------+-----------+------------+-------------------+----------+------------+
1 row in set (0.001 sec)

-- Tampilkan data pelanggan yang ID nya 2, 4 dan 6 --
MariaDB [dbpos]> SELECT * from pelanggan where id IN (2,4,6);
+----+--------+----------------+------+------------+------------+-----------------------+----------+------------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email                 | kartu_id | alamat     |
+----+--------+----------------+------+------------+------------+-----------------------+----------+------------+
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1998-08-07 | pandanwangi@gmail.com |        2 | Yogyakarta |
|  4 | 011104 | Suandi         | L    | Jakarta    | 1997-09-08 | suandi@gmail.com      |        1 | Bandung    |
|  6 | 011106 | Gayatri        | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com     |        1 | Yogyakarta |
+----+--------+----------------+------+------------+------------+-----------------------+----------+------------+
3 rows in set (0.008 sec)

-- Tampilkan data produk yang harganya antara 500 ribu sampai 6 juta --
MariaDB [dbpos]> select * from produk where harga_jual <= 6000000 and harga_jual >= 500000;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        3 |               4 |
+----+------+------------+------------+------------+------+----------+-----------------+
4 rows in set (0.001 sec)

SOAL 2.3

-- Tampilkan produk yang kode awalnya huruf K dan huruf M --
MariaDB [dbpos]> SELECT * FROM produk WHERE kode LIKE 'K%' OR kode LIKE 'M%';
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        3 |               4 |
+----+------+------------+------------+------------+------+----------+-----------------+
2 rows in set (0.011 sec)

-- Tampilkan produk yang kode awalnya bukan huruf M --
MariaDB [dbpos]> SELECT * FROM produk WHERE kode NOT LIKE 'M%';
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 |
|  6 | TK01 | Teh Kotak  |       3000 |       4000 |    2 |       10 |               3 |
+----+------+------------+------------+------------+------+----------+-----------------+
5 rows in set (0.001 sec)

-- Tampilkan produk-produk televisi --
MariaDB [dbpos]> SELECT * FROM produk WHERE kode LIKE 'TV%';
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
+----+------+------------+------------+------------+------+----------+-----------------+
2 rows in set (0.007 sec)

-- Tampilkan pelanggan mengandung huruf 'SA' --
MariaDB [dbpos]> SELECT * FROM pelanggan where nama_pelanggan LIKE '%sa%';
Empty set (0.001 sec)

-- Tampilkan pelanggan yang lahirnya bukan di Jakarta dan mengandung huruf ‘yo‘ --
MariaDB [dbpos]> SELECT * FROM pelanggan where tmp_lahir != 'jakarta' AND nama_pelanggan LIKE '%yo%';
Empty set (0.001 sec)

-- Tampilkan pelanggan yang karakter huruf ke – 2 nya adalah A --
MariaDB [dbpos]> SELECT * FROM pelanggan where nama_pelanggan LIKE '_a%';
+----+--------+----------------+------+------------+------------+-----------------------+----------+------------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email                 | kartu_id | alamat     |
+----+--------+----------------+------+------------+------------+-----------------------+----------+------------+
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1998-08-07 | pandanwangi@gmail.com |        2 | Yogyakarta |
|  6 | 011106 | Gayatri        | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com     |        1 | Yogyakarta |
+----+--------+----------------+------+------------+------------+-----------------------+----------+------------+
2 rows in set (0.001 sec)

SOAL 2.4

-- Tampilkan 2 data produk termahal --
MariaDB [dbpos]> SELECT * FROM produk ORDER BY harga_beli DESC LIMIT 2;
+----+------+--------+------------+------------+------+----------+-----------------+
| id | kode | nama   | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+--------+------------+------------+------+----------+-----------------+
|  3 | K001 | Kulkas |    4000000 |    5000000 |   10 |        3 |               1 |
|  1 | TV01 | TV     |    3000000 |    4000000 |    3 |        2 |               1 |
+----+------+--------+------------+------------+------+----------+-----------------+
2 rows in set (0.001 sec)

-- Tampilkan produk yang paling murah --
MariaDB [dbpos]> SELECT * FROM produk ORDER BY harga_beli ASC;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  6 | TK01 | Teh Kotak  |       3000 |       4000 |    2 |       10 |               3 |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        3 |               4 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
+----+------+------------+------------+------------+------+----------+-----------------+
6 rows in set (0.000 sec)

-- Tampilkan produk yang stoknya paling banyak --
MariaDB [dbpos]> SELECT MAX(nama) as stok_terbanyak from produk;
+----------------+
| stok_terbanyak |
+----------------+
| TV 21 Inch     |
+----------------+
1 row in set (0.006 sec)

-- Tampilkan dua produk yang stoknya paling sedikit --
MariaDB [dbpos]> SELECT * FROM produk ORDER BY stok ASC LIMIt 2;
+----+------+-----------+------------+------------+------+----------+-----------------+
| id | kode | nama      | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+-----------+------------+------------+------+----------+-----------------+
|  6 | TK01 | Teh Kotak |       3000 |       4000 |    2 |       10 |               3 |
|  1 | TV01 | TV        |    3000000 |    4000000 |    3 |        2 |               1 |
+----+------+-----------+------------+------------+------+----------+-----------------+
2 rows in set (0.001 sec)

-- Tampilkan pelanggan yang paling muda --
MariaDB [dbpos]> SELECT * FROM pelanggan order by tgl_lahir DESC LIMIT 1;
+----+--------+----------------+------+-----------+------------+-------------------+----------+------------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | tgl_lahir  | email             | kartu_id | alamat     |
+----+--------+----------------+------+-----------+------------+-------------------+----------+------------+
|  6 | 011106 | Gayatri        | P    | Jakarta   | 2002-09-01 | gayatri@gmail.com |        1 | Yogyakarta |
+----+--------+----------------+------+-----------+------------+-------------------+----------+------------+
1 row in set (0.001 sec)

-- Tampilkan pelanggan yang paling tua --
MariaDB [dbpos]> SELECT * FROM pelanggan order by tgl_lahir ASC LIMIT 1;
+----+--------+----------------+------+-----------+------------+-----------------+----------+---------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | tgl_lahir  | email           | kartu_id | alamat  |
+----+--------+----------------+------+-----------+------------+-----------------+----------+---------+
|  1 | 011101 | Agung          | L    | Bandung   | 1997-09-06 | agung@gmail.com |        1 | Bandung |
+----+--------+----------------+------+-----------+------------+-----------------+----------+---------+
1 row in set (0.001 sec)
