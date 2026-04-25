DELIMITER $$

CREATE PROCEDURE cek_status_stok(IN p_stok INT)
BEGIN
    IF p_stok = 0 THEN
        SELECT 'Status: Habis' AS Hasil;
        
    ELSEIF p_stok BETWEEN 1 AND 5 THEN
        SELECT 'Status: Hampir Habis' AS Hasil;
        
    ELSEIF p_stok BETWEEN 6 AND 20 THEN
        SELECT 'Status: Tersedia' AS Hasil;
        
    ELSE
        SELECT 'Status: Stok Aman' AS Hasil;
        
    END IF;
END $$

DELIMITER ;

CREATE TABLE produk (
    id_produk INT AUTO_INCREMENT PRIMARY KEY,
    nama_produk VARCHAR(100),
    stok INT
);

INSERT INTO produk (nama_produk, stok) VALUES
('Beras',0),
('Gula',3),
('Minyak',10),
('Telur',25),
('Tepung',5);

SELECT 
id_produk,
nama_produk,
stok,
CASE
    WHEN stok = 0 THEN 'Habis'
    WHEN stok BETWEEN 1 AND 5 THEN 'Hampir Habis'
    WHEN stok BETWEEN 6 AND 20 THEN 'Tersedia'
    ELSE 'Stok Aman'
END AS status_stok
FROM produk;

DELIMITER $$

CREATE PROCEDURE hitung_diskon(IN total_belanja INT)
BEGIN
    DECLARE diskon INT;
    DECLARE jumlah_diskon INT;
    DECLARE total_bayar INT;

    IF total_belanja >= 1000000 THEN
        SET diskon = 15;

    ELSEIF total_belanja >= 500000 THEN
        SET diskon = 10;

    ELSEIF total_belanja >= 250000 THEN
        SET diskon = 5;

    ELSE
        SET diskon = 0;

    END IF;

    SET jumlah_diskon = total_belanja * diskon / 100;
    SET total_bayar = total_belanja - jumlah_diskon;

    SELECT 
    total_belanja,
    CONCAT(diskon,'%') AS diskon,
    jumlah_diskon,
    total_bayar;
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE cek_predikat_mahasiswa(IN p_nilai INT)
BEGIN
    DECLARE predikat VARCHAR(50);
    DECLARE status_kelulusan VARCHAR(50);

    IF p_nilai BETWEEN 90 AND 100 THEN
        SET predikat = 'Sangat Memuaskan';

    ELSEIF p_nilai BETWEEN 80 AND 89 THEN
        SET predikat = 'Memuaskan';

    ELSEIF p_nilai BETWEEN 70 AND 79 THEN
        SET predikat = 'Baik';

    ELSEIF p_nilai BETWEEN 60 AND 69 THEN
        SET predikat = 'Cukup';

    ELSE
        SET predikat = 'Kurang';

    END IF;

    IF p_nilai >= 70 THEN
        SET status_kelulusan = 'Lulus';
    ELSE
        SET status_kelulusan = 'Tidak Lulus';
    END IF;

    SELECT 
    p_nilai AS Nilai,
    predikat AS Predikat,
    status_kelulusan AS Status;
END $$

DELIMITER ;