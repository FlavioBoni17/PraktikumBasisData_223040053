use kelas_d;
/* 1. Tampilkan Semua Data Mahasiswa yang masuk antara tahun 2019 dan 2020 */
SELECT * FROM mahasiswa WHERE (tahun_masuk) BETWEEN 2019 AND 2020;

/* 2. Tampilkan Semua Data Mahasiswa yang berada di jurusan teknik informatika dan alamatnya mengandung kata "Jl. Merdeka"*/
SELECT * FROM mahasiswa WHERE jurusan = 'Teknik Informatika' AND alamat LIKE '%Jl. Merdeka%';

/* 3. Hitung total mahasiswa teknik informatika dan tampilkan sebagai jumlah_total_mahasiswa_informatika*/
SELECT COUNT(*) AS jumlah_total_mahasiswa_informatika
FROM mahasiswa
WHERE jurusan = 'Teknik Informatika';

/* 4. Tampilkan 5 pembayaran dpp terbesar dan urutkan dari yang terbesar ke kecil*/
SELECT TOP 5 * 
FROM dpp_mahasiswa
ORDER BY jumlah_pembayaran DESC;

/* 5. Tampilkan secara unik nama dosen pengajar dari tabel jadwal mata kuliah*/
SELECT DISTINCT dosen_pengajar
FROM jadwal_mata_kuliah;

/* 6. Hitung mata kuliah pada hari senin*/
SELECT COUNT(*) AS jumlah_mata_kuliah_senin
FROM jadwal_mata_kuliah
WHERE hari = 'Senin';

/* 7. Tampilkan mata kuliah yang memiliki kode 'TI101', 'SI201', atau 'TS301'*/
SELECT *
FROM jadwal_mata_kuliah
WHERE kode_mata_kuliah IN ('TI101', 'SI201', 'TS301');

/* 8. Tampilkan mahasiswa yang dari jurusan teknik informatika dan beralamat seperti "Jl.Sudirman" dari tahun 2018 sampai 2020 */
SELECT *
FROM mahasiswa
WHERE jurusan = 'Teknik Informatika'
	  AND alamat LIKE '%Jl. Sudirman%'
	  AND (tahun_masuk) BETWEEN 2018 AND 2020;

/* 9. Tampilkan nama mata kuliah yang dosen pengajarnya mengandung kata "ang" dan urutkan berdasarkan alfabetis */
SELECT nama_mata_kuliah
FROM jadwal_mata_kuliah
WHERE dosen_pengajar LIKE '%ang%'
ORDER BY nama_mata_kuliah ASC;

/* 10. Tampilkan data mahasiswa yang status pembayaran DPP nya Lunas, gunakan sub query untuk mencari data mahasiswa yang lunas*/
SELECT *
FROM mahasiswa
WHERE nim IN (SELECT nim
				FROM dpp_mahasiswa
				WHERE status_pembayaran = 'Lunas');