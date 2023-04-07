//masuk ke mysql 
C:\xampp\mysql\bin>mysql -u root -p

//membuat database baru
MariaDB [(none)]>  CREATE DATABASE dbpos;

//melihat semua database yang pernah dibuat
MariaDB [(none)]> show databases;

//menggunakan salah satu database
MariaDB [(none)]> use dbpos;

//membuat table kartu
MariaDB [dbpos]>create table kartu(
    -> id int auto_increment primary key,
    -> kode varchar(6) unique,
    -> nama varchar(30) not null,
    -> diskon double,
    -> iuran double);
Query OK, 0 rows affected (0.020 sec)

//membuat table pelanggan
MariaDB [dbpos]> create table pelanggan(
    -> id int auto_increment primary key,
    -> kode varchar(10) unique,
    -> nama varchar(45),
    -> jk char(1),
    -> tmp_lahir varchar(30),
    -> tgl_lahir date,
    -> email varchar(45),
    -> kartu_id int not null references kartu(id));
Query OK, 0 rows affected (0.030 sec)

//membuat table pesanan
MariaDB [dbpos]> create table pesanan(
    -> id int(11) not null auto_increment primary key,
    -> tanggal date,
    -> total double,
    -> pelanggan_id int(11) not null references pelanggan(id));
Query OK, 0 rows affected (0.029 sec)

//membuat table pembayaran
MariaDB [dbpos]> create table pembayaran(
    -> id int(11) not null auto_increment primary key,
    -> nokuitansi varchar(10) unique,
    -> tanggal date,
    -> jumlah double,
    -> ke int(11),
    -> pesanan_id int not null references pesanan(id));
Query OK, 0 rows affected (0.022 sec)

//membuat table jenis_produk
MariaDB [dbpos]> create table jenis_produk(
    -> id int(11) not null auto_increment primary key,
    -> nama varchar(45));
Query OK, 0 rows affected (0.021 sec)

//membuat table pesanan_items
MariaDB [dbpos]> create table pesanan_items(
    -> id int(11) not null auto_increment primary key,
    -> produk_id int(11) not null references produk(id),
    -> pesanan_id int(11) not null references pesanan(id),
    -> qty int(11),
    -> harga double);
Query OK, 0 rows affected (0.030 sec)

//membuat table vendor
MariaDB [dbpos]> create table vendor(
    -> id int(11) not null auto_increment primary key,
    -> nomor varchar(4),
    -> nama varchar(40),
    -> kota varchar(30),
    -> kontak varchar(30));
Query OK, 0 rows affected (0.018 sec)

//membuat table pembelian
MariaDB [dbpos]> create table pembelian(
    -> id int(11) not null auto_increment primary key,
    -> tanggal varchar(45),
    -> nomor varchar(10),
    -> produk_id int(11) not null references produk(id),
    -> jumlah int(11),
    -> harga double,
    -> vendor_id int(11) not null references vendor(id));
Query OK, 0 rows affected (0.023 sec)

//membuat table produk
MariaDB [dbpos]> Create table produk(
    -> id int(11) auto_increment primary key,
    -> kode varchar(10) unique,
    -> nama varchar(45) not null,
    -> harga_beli double,
    -> harga_jual double,
    -> stok int(11),
    -> min_stok int(11),
    -> jenis_produk_id int not null references jeni_produk(id));
Query OK, 0 rows affected (0.039 sec)

//Tambahkan kolom alamat pada pelanggan dengan tipe data varchar (40)
MariaDB [dbpos]> alter table pelanggan add alamat varchar(40);
Query OK, 0 rows affected (0.030 sec)
Records: 0  Duplicates: 0  Warnings: 0

//Ubah kolom nama pada pelanggan menjadi nama_pelanggan
MariaDB [dbpos]> alter table pelanggan change nama nama_pelanggan varchar(45);
Query OK, 0 rows affected (0.029 sec)
Records: 0  Duplicates: 0  Warnings: 0

//edit tipe data nama_pelanggan menjadi varchar(50)
MariaDB [dbpos]> alter table pelanggan modify nama_pelanggan varchar(50);
Query OK, 0 rows affected (0.023 sec)
Records: 0  Duplicates: 0  Warnings: 0

//menampilkan table pelanggan
MariaDB [dbpos]> desc pelanggan;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| id             | int(11)     | NO   | PRI | NULL    | auto_increment |
| kode           | varchar(10) | YES  | UNI | NULL    |                |
| nama_pelanggan | varchar(50) | YES  |     | NULL    |                |
| jk             | char(1)     | YES  |     | NULL    |                |
| tmp_lahir      | varchar(30) | YES  |     | NULL    |                |
| tgl_lahir      | date        | YES  |     | NULL    |                |
| email          | varchar(45) | YES  |     | NULL    |                |
| kartu_id       | int(11)     | NO   |     | NULL    |                |
| alamat         | varchar(40) | YES  |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+
9 rows in set (0.008 sec)

//menampilkan seluruh table
MariaDB [dbpos]> show tables;
+-----------------+
| Tables_in_dbpos |
+-----------------+
| jenis_produk    |
| kartu           |
| pelanggan       |
| pembayaran      |
| pembelian       |
| pesanan         |
| pesanan_items   |
| produk          |
| vendor          |
+-----------------+
9 rows in set (0.006 sec)
