/* TUGAS KELOMPOK 
Buat sebuah alur bisnis dengan minimal jumlah tabel 5, untuk hubungan relasi dibebaskan sesuai dengan studi kasus bisnis masing-masing, dan isi masing" tabel dengan minimal data 30 */

use Tugas1_Kelompok

CREATE TABLE pelanggan (
    id_pelanggan INT PRIMARY KEY IDENTITY(1,1),
    nama VARCHAR(50) NOT NULL,
    alamat VARCHAR(100),
    no_telepon VARCHAR(15)
);

CREATE TABLE menu (
    id_menu INT PRIMARY KEY IDENTITY(1,1),
    nama_menu VARCHAR(50) NOT NULL,
    harga DECIMAL(10, 2) NOT NULL,
    kategori VARCHAR(20),
    stok INT DEFAULT 0
);

CREATE TABLE karyawan (
    id_karyawan INT PRIMARY KEY IDENTITY(1,1),
    nama_karyawan VARCHAR(50) NOT NULL,
    jabatan VARCHAR(30)
);

CREATE TABLE pesanan (
    id_pesanan INT PRIMARY KEY IDENTITY(1,1),
    id_pelanggan INT,
    id_karyawan INT,
    tanggal_pesanan DATETIME DEFAULT GETDATE(),
    status_pesanan VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan),
    FOREIGN KEY (id_karyawan) REFERENCES karyawan(id_karyawan)
);

CREATE TABLE transaksi (
    id_transaksi INT PRIMARY KEY IDENTITY(1,1),
    id_pesanan INT,
    total DECIMAL(10, 2) NOT NULL,
    metode_pembayaran VARCHAR(20),
    tanggal_transaksi DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (id_pesanan) REFERENCES pesanan(id_pesanan)
);

CREATE TABLE detil_pesanan (
    id_detil INT PRIMARY KEY IDENTITY(1,1),
    id_pesanan INT,
    id_menu INT,
    jumlah INT,
    harga DECIMAL(10, 2),
    FOREIGN KEY (id_pesanan) REFERENCES pesanan(id_pesanan),
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu)
);

INSERT INTO pelanggan (nama, alamat, no_telepon) VALUES
('Andi Pratama', 'Jalan Melati No. 10', '081234567890'),
('Siti Nurhaliza', 'Jalan Mawar No. 5', '081345678901'),
('Budi Santoso', 'Jalan Kenanga No. 3', '081456789012'),
('Dedi Wijaya', 'Jalan Cempaka No. 7', '081567890123'),
('Lina Agustina', 'Jalan Anggrek No. 8', '081678901234'),
('Rudi Hartono', 'Jalan Flamboyan No. 9', '081789012345'),
('Maya Putri', 'Jalan Dahlia No. 11', '081890123456'),
('Hendra Kurniawan', 'Jalan Mawar No. 6', '081901234567'),
('Desi Ratnasari', 'Jalan Melur No. 4', '081012345678'),
('Anton Wijaya', 'Jalan Melati No. 20', '081123456789'),
('Fahmi Ramadhan', 'Jalan Cendana No. 21', '081234567891'),
('Ratna Sari', 'Jalan Kenanga No. 14', '081345678902'),
('Eko Wibowo', 'Jalan Teratai No. 2', '081456789013'),
('Sari Kusuma', 'Jalan Mawar No. 3', '081567890124'),
('Wahyu Saputra', 'Jalan Merpati No. 15', '081678901235'),
('Rina Oktavia', 'Jalan Cemara No. 12', '081789012346'),
('Putri Amelia', 'Jalan Pinus No. 22', '081890123457'),
('Dian Pertiwi', 'Jalan Jati No. 13', '081901234568'),
('Adi Prasetyo', 'Jalan Cemara No. 17', '081012345679'),
('Citra Lestari', 'Jalan Kamboja No. 18', '081123456780'),
('Dodi Irawan', 'Jalan Bougenville No. 19', '081234567892'),
('Lisa Mariana', 'Jalan Sakura No. 23', '081345678903'),
('Rio Firmansyah', 'Jalan Anggrek No. 24', '081456789014'),
('Yulia Permata', 'Jalan Mangga No. 25', '081567890125'),
('Tono Sutrisno', 'Jalan Jeruk No. 26', '081678901236'),
('Mega Sari', 'Jalan Apel No. 27', '081789012347'),
('Andre Surya', 'Jalan Nanas No. 28', '081890123458'),
('Susi Rahmawati', 'Jalan Jambu No. 29', '081901234569'),
('Ali Yusuf', 'Jalan Durian No. 30', '081012345670'),
('Nina Hapsari', 'Jalan Rambutan No. 31', '081123456781');
SELECT * FROM pelanggan

INSERT INTO menu (nama_menu, harga, kategori, stok) VALUES
('Nasi Goreng Spesial', 25000, 'Makanan', 50),
('Ayam Bakar Madu', 30000, 'Makanan', 40),
('Sate Ayam', 20000, 'Makanan', 60),
('Mie Goreng', 18000, 'Makanan', 70),
('Sop Buntut', 45000, 'Makanan', 30),
('Bakso Kuah', 15000, 'Makanan', 80),
('Nasi Uduk', 12000, 'Makanan', 90),
('Es Teh Manis', 5000, 'Minuman', 100),
('Jus Alpukat', 10000, 'Minuman', 50),
('Es Jeruk', 8000, 'Minuman', 75),
('Kopi Hitam', 7000, 'Minuman', 60),
('Capuccino', 15000, 'Minuman', 40),
('Teh Tarik', 6000, 'Minuman', 85),
('Es Campur', 12000, 'Minuman', 70),
('Salad Buah', 18000, 'Makanan', 55),
('Steak Sapi', 50000, 'Makanan', 25),
('Burger Spesial', 22000, 'Makanan', 45),
('Pizza Mini', 30000, 'Makanan', 35),
('Sushi Roll', 28000, 'Makanan', 20),
('Dimsum', 12000, 'Makanan', 65),
('Ramen Kuah Pedas', 35000, 'Makanan', 50),
('Es Kelapa Muda', 8000, 'Minuman', 90),
('Cendol', 6000, 'Minuman', 100),
('Smoothie Mangga', 15000, 'Minuman', 60),
('Nasi Padang', 20000, 'Makanan', 70),
('Gado-gado', 12000, 'Makanan', 85),
('Bubur Ayam', 10000, 'Makanan', 75),
('Sop Iga', 40000, 'Makanan', 30),
('Teh Hijau', 7000, 'Minuman', 80),
('Kopi Latte', 18000, 'Minuman', 55);
SELECT * FROM menu

INSERT INTO karyawan (nama_karyawan, jabatan) VALUES
('Dewi Kusuma', 'Kasir'),
('Budi Santoso', 'Pelayan'),
('Siti Aisyah', 'Koki'),
('Rudi Hartono', 'Manajer'),
('Aminah Rahmawati', 'Kasir'),
('Yusuf Hakim', 'Pelayan'),
('Intan Lestari', 'Koki'),
('Hendra Wijaya', 'Manajer'),
('Citra Amalia', 'Kasir'),
('Dian Pratama', 'Pelayan'),
('Maya Putri', 'Koki'),
('Eko Prasetyo', 'Kasir'),
('Ratna Permata', 'Pelayan'),
('Fahmi Ramadhan', 'Koki'),
('Nurul Hasanah', 'Manajer'),
('Wawan Setiawan', 'Pelayan'),
('Mega Puspita', 'Koki'),
('Heri Saputra', 'Kasir'),
('Tini Susanti', 'Pelayan'),
('Anton Wijaya', 'Koki'),
('Rina Oktaviani', 'Kasir'),
('Dodi Irawan', 'Pelayan'),
('Lisa Rahmawati', 'Koki'),
('Adi Surya', 'Manajer'),
('Dewi Maharani', 'Kasir'),
('Rio Firmansyah', 'Pelayan'),
('Susi Rahayu', 'Koki'),
('Andre Sutrisno', 'Kasir'),
('Yulia Indah', 'Pelayan'),
('Cahyo Nugroho', 'Manajer');
SELECT * FROM karyawan

INSERT INTO pesanan (id_pelanggan, id_karyawan, tanggal_pesanan, status_pesanan) VALUES
(5, 2, '2024-01-15 10:30:00', 'Pending'),
(3, 4, '2024-02-20 14:15:00', 'Selesai'),
(7, 1, '2024-03-12 09:45:00', 'Dibatalkan'),
(10, 3, '2024-04-05 12:00:00', 'Selesai'),
(2, 6, '2024-05-19 18:30:00', 'Pending'),
(15, 8, '2024-06-10 16:20:00', 'Selesai'),
(20, 5, '2024-07-07 11:40:00', 'Pending'),
(9, 7, '2024-08-21 14:00:00', 'Dibatalkan'),
(14, 10, '2024-09-02 13:50:00', 'Selesai'),
(6, 11, '2024-10-11 17:05:00', 'Pending'),
(17, 12, '2024-03-25 09:30:00', 'Selesai'),
(8, 4, '2024-05-14 20:10:00', 'Dibatalkan'),
(1, 15, '2024-06-19 08:45:00', 'Selesai'),
(21, 18, '2024-07-30 19:50:00', 'Pending'),
(12, 20, '2024-09-18 13:15:00', 'Selesai'),
(18, 3, '2024-10-23 11:00:00', 'Dibatalkan'),
(4, 9, '2024-04-02 10:20:00', 'Pending'),
(25, 13, '2024-07-15 15:30:00', 'Selesai'),
(16, 16, '2024-08-12 14:40:00', 'Pending'),
(11, 2, '2024-09-21 17:25:00', 'Selesai'),
(30, 19, '2024-01-19 18:35:00', 'Pending'),
(19, 22, '2024-03-05 20:55:00', 'Selesai'),
(26, 24, '2024-05-09 12:25:00', 'Dibatalkan'),
(13, 27, '2024-06-03 08:15:00', 'Selesai'),
(22, 28, '2024-07-25 14:55:00', 'Pending'),
(28, 25, '2024-08-06 19:45:00', 'Selesai'),
(23, 30, '2024-09-29 13:10:00', 'Pending'),
(29, 14, '2024-02-18 17:30:00', 'Selesai'),
(24, 17, '2024-03-31 10:40:00', 'Dibatalkan'),
(27, 21, '2024-05-15 15:20:00', 'Selesai');
SELECT * FROM pesanan

INSERT INTO transaksi(id_pesanan, total, metode_pembayaran, tanggal_transaksi) VALUES
(1, 40000, 'Tunai', '2024-01-15 11:00:00'),
(2, 45000, 'Kartu Kredit', '2024-02-20 14:45:00'),
(3, 15000, 'Tunai', '2024-03-12 10:15:00'),
(4, 16000, 'E-Wallet', '2024-04-05 12:30:00'),
(5, 15000, 'Tunai', '2024-05-19 19:00:00'),
(6, 60000, 'Transfer Bank', '2024-06-10 16:50:00'),
(7, 54000, 'Kartu Kredit', '2024-07-07 12:10:00'),
(8, 12000, 'Kartu Kredit', '2024-08-21 14:30:00'),
(9, 14000, 'Tunai', '2024-09-02 14:20:00'),
(10, 60000, 'E-Wallet', '2024-10-11 17:35:00'),
(11, 22000, 'Kartu Kredit', '2024-03-25 10:00:00'),
(12, 24000, 'E-Wallet', '2024-05-14 20:40:00'),
(13, 12000, 'Transfer Bank', '2024-06-19 09:15:00'),
(14, 30000, 'Tunai', '2024-07-30 20:20:00'),
(15, 36000, 'E-Wallet', '2024-09-18 13:45:00'),
(16, 25000, 'Kartu Kredit', '2024-10-23 11:30:00'),
(17, 70000, 'Tunai', '2024-04-02 10:50:00'),
(18, 30000, 'Kartu Kredit', '2024-07-15 16:00:00'),
(19, 12000, 'Transfer Bank', '2024-08-12 15:10:00'),
(20, 50000, 'Transfer Bank', '2024-09-21 17:55:00'),
(21, 30000, 'Tunai', '2024-01-19 19:05:00'),
(22, 60000, 'E-Wallet', '2024-03-05 21:25:00'),
(23, 7000, 'Transfer Bank', '2024-05-09 12:55:00'),
(24, 80000, 'Transfer Bank', '2024-06-03 08:45:00'),
(25, 20000, 'Kartu Kredit', '2024-07-25 15:25:00'),
(26, 28000, 'Tunai', '2024-08-06 20:15:00'),
(27, 24000, 'E-Wallet', '2024-09-29 13:40:00'),
(28, 12000, 'Transfer Bank', '2024-02-18 18:00:00'),
(29, 18000, 'Kartu Kredit', '2024-03-31 11:10:00'),
(30, 6000, 'E-Wallet', '2024-05-15 15:50:00');
SELECT * FROM transaksi

INSERT INTO detil_pesanan (id_detil, id_pesanan, id_menu, jumlah, harga) VALUES
(1, 1, 3, 2, 20000.00),
(2, 2, 5, 1, 45000.00),
(3, 3, 8, 3, 5000.00),
(4, 4, 10, 2, 8000.00),
(5, 5, 12, 1, 15000.00),
(6, 6, 2, 2, 30000.00),
(7, 7, 15, 3, 18000.00),
(8, 8, 7, 1, 12000.00),
(9, 9, 11, 2, 7000.00),
(10, 10, 6, 4, 15000.00),
(11, 11, 17, 1, 22000.00),
(12, 12, 20, 2, 12000.00),
(13, 13, 14, 1, 12000.00),
(14, 14, 9, 3, 10000.00),
(15, 15, 4, 2, 18000.00),
(16, 16, 1, 1, 25000.00),
(17, 17, 21, 2, 35000.00),
(18, 18, 18, 1, 30000.00),
(19, 19, 13, 2, 6000.00),
(20, 20, 16, 1, 50000.00),
(21, 21, 24, 2, 15000.00),
(22, 22, 25, 3, 20000.00),
(23, 23, 29, 1, 7000.00),
(24, 24, 28, 2, 40000.00),
(25, 25, 27, 2, 10000.00),
(26, 26, 19, 1, 28000.00),
(27, 27, 22, 3, 8000.00),
(28, 28, 26, 1, 47000.00),
(29, 29, 30, 1, 18000.00),
(30, 30, 23, 2, 55000.00);
SELECT * FROM detil_pesanan