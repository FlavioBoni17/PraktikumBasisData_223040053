use Praktikum_P5

/* 1. Buatkan table sesuai schema database diatas*/
CREATE TABLE jurusan (
    id BIGINT PRIMARY KEY,
    nama_jurusan BIGINT);
CREATE TABLE Dosen_Wali (
    id BIGINT PRIMARY KEY,
    NIP BIGINT,
    nama VARCHAR(255),
    tanggal_lahir DATE,
    alamat VARCHAR(255),
    no_hp INT);
CREATE TABLE Mahasiswa (
    id BIGINT PRIMARY KEY,
    NPM INT,
    nama VARCHAR(255),
    tanggal_lahir DATE,
    alamat VARCHAR(255),
    no_hp INT,
    jurusan_id BIGINT,
    dosen_wali_id BIGINT,
    FOREIGN KEY (jurusan_id) REFERENCES jurusan(id),
    FOREIGN KEY (dosen_wali_id) REFERENCES Dosen_Wali(id)
);

/* 2. Tambahkan field "status" dengan tipe data boolean di tabel mahasiswa*/
ALTER TABLE Mahasiswa
ADD status BIT;

/* 3. Ubah tipe data nama_jurusan di tabel jurusan menjadi varchar*/
ALTER TABLE jurusan
ALTER COLUMN nama_jurusan VARCHAR(255);

/* 4. Masukan data ke tabel jurusan sebanyak 5 data*/
INSERT INTO jurusan (id, nama_jurusan)
VALUES
    (1, 'Teknik Informatika'),
    (2, 'Teknik Mesin'),
    (3, 'Teknik Industri'),
    (4, 'Teknik Pangan'),
    (5, 'Teknik Lingkungan');

/* 5. Masukan data ke tabel dosen_wali sebanyak 10 data*/
INSERT INTO Dosen_Wali (id, NIP, nama, tanggal_lahir, alamat, no_hp)
VALUES
	(1, 00000001, 'Dr. Ahmad Surya', '1975-02-15', 'Bandung', 08123456789),
    (2, 00000002, 'Prof. Siti Aminah', '1968-06-12', 'Bandung', 08134567890),
    (3, 00000003, 'Dr. Budi Pratama', '1980-11-23', 'Bandung', 08145678901),
    (4, 00000004, 'Dr. Indah Lestari', '1979-09-05', 'Subang', 08156789012),
    (5, 00000005, 'Dr. Rina Sari', '1982-04-19', 'Subang', 08167890123),
    (6, 00000006, 'Prof. Agus Pratomo', '1972-03-22', 'Cirebon', 08178901234),
    (7, 00000007, 'Dr. Dedi Supriyadi', '1985-12-11', 'Jakarta', 08189012345),
    (8, 00000008, 'Dr. Erwin Kurniawan', '1983-05-06', 'Jakarta', 08190123456),
    (9, 00000009, 'Prof. Ratna Dewi', '1970-07-30', 'Jakarta', 08201234567),
    (10, 00000010, 'Dr. Syarif Maulana', '1978-10-03', 'Bogor', 08212345678);

/* 6. Masukan data ke tabel mahasiswa sebanyak 20 data*/
INSERT INTO Mahasiswa (id, NPM, nama, tanggal_lahir, alamat, no_hp, jurusan_id, dosen_wali_id)
VALUES
    (1, 1901001, 'Andi Wijaya', '2000-01-15', 'Bandung', 08123456781, 1, 1),
    (2, 1901002, 'Budi Santoso', '1999-02-10', 'Bandung', 08123456782, 2, 2),
    (3, 1901003, 'Citra Ayu', '2000-03-25', 'Bandung', 08123456783, 3, 3),
    (4, 1901004, 'Dewi Lestari', '2001-04-20', 'Bandung', 08123456784, 4, 4),
    (5, 1901005, 'Eko Prasetyo', '1999-05-30', 'Bandung', 08123456785, 5, 5),
    (6, 1901006, 'Fajar Maulana', '2000-06-15', 'Bogor', 08123456786, 1, 6),
    (7, 1901007, 'Gita Wulandari', '2001-07-25', 'Bogor', 08123456787, 2, 7),
    (8, 1901008, 'Hadi Saputra', '1998-08-30', 'Bekasi', 08123456788, 3, 8),
    (9, 1901009, 'Intan Permata', '2000-09-12', 'Bekasi', 08123456789, 4, 9),
    (10, 1901010, 'Joko Widodo', '1999-10-01', 'Cirebon', 08123456790, 5, 10),
    (11, 1901011, 'Kiki Amalia', '2001-11-21', 'Cirebon', 08123456791, 1, 1),
    (12, 1901012, 'Lina Susanti', '1998-12-15', 'Subang', 08123456792, 2, 2),
    (13, 1901013, 'Muhammad Rizky', '2000-01-29', 'Subang', 08123456793, 3, 3),
    (14, 1901014, 'Nina Septiani', '2001-02-14', 'Subang', 08123456794, 4, 4),
    (15, 1901015, 'Omar Dani', '1999-03-10', 'Subang', 08123456795, 5, 5),
    (16, 1901016, 'Putri Amelia', '2000-04-05', 'Subang', 08123456796, 1, 6),
    (17, 1901017, 'Qory Sandria', '1998-05-20', 'Jakarta', 08123456797, 2, 7),
    (18, 1901018, 'Rudi Hartono', '2001-06-01', 'Jakarta', 08123456798, 3, 8),
    (19, 1901019, 'Siti Zubaidah', '1999-07-17', 'Karawang', 08123456799, 4, 9),
    (20, 1901020, 'Tommy Suharto', '2000-08-30', 'Karawang', 08123456700, 5, 10);

/* 7. Hapus data 5 mahasiswa dan pastikan data yang berhubungan dengan mahasiswa tersebut di tabel lain ikut terhapus*/
DELETE FROM Mahasiswa
WHERE id IN (1, 2, 3, 4, 5);
