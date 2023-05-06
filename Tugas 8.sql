--  didalam table pembayaran tambahkan kolom status_pembayaran --
MariaDB [dbpos]> alter table pembayaran modify status_pembayaran varchar(20) default 'Belum Lunas';
Query OK, 0 rows affected (0.033 sec)
Records: 0  Duplicates: 0  Warnings: 0

-- membuat trigger --
MariaDB [dbpos]> DELIMITER $$
MariaDB [dbpos]> create trigger update_status_pembayaran before insert on pembayaran
    -> for each row
    -> begin
    -> declare total_bayar double;
    -> declare total_pesan double;

-- mengambil total pembayaran dari table pembayaran --
    -> select sum(jumlah) into total_bayar from pembayaran where pesanan_id = NEW.pesanan_id;

-- mengambil total pesanan dari table pesanan --
    -> select total into total_pesan from pesanan2 where id = NEW.pesanan_id;

-- jika pesanan sudah dibayar maka status pembayaran akan berubah menjadi lunas --
    -> if total_bayar >= total_pesan then
    -> set NEW.status_pembayaran = 'Lunas';
    -> end if;
    -> end
    -> $$
Query OK, 0 rows affected (0.028 sec)

-- menambahkankan data ke dalam table pembayaran--
MariaDB [dbpos]> insert into pembayaran (nokuitansi, tanggal, jumlah, ke, pesanan_id)
    -> values ('ABC12', '2023-05-06', 50000, 1, 5);
Query OK, 1 row affected (0.018 sec)

MariaDB [dbpos]> select * from pembayaran;
+----+------------+------------+--------+------+------------+-------------------+
| id | nokuitansi | tanggal    | jumlah | ke   | pesanan_id | status_pembayaran |
+----+------------+------------+--------+------+------------+-------------------+
|  1 | ABC12      | 2023-05-06 |  50000 |    1 |          5 | Lunas             |
+----+------------+------------+--------+------+------------+-------------------+
1 row in set (0.001 sec)
