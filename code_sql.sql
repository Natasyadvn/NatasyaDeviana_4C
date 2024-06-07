SHOW DATABASES;


CREATE DATABASE sistem_penjualan;
CREATE DATABASE penjualan;

USE penjualan;
USE sistem_penjualan;

CREATE TABLE user (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL,
    full_name VARCHAR(150) NOT NULL,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM("OWNER", "ADMIN", "KASIR") NOT NULL,
    nik CHAR(16) NULL,
    telp VARCHAR(20) NULL,
    alamat VARCHAR(255) NULL,
	is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
	UNIQUE KEY username_unique (username),
    UNIQUE KEY email_unique (email),
    INDEX fullname_index (full_name),
    INDEX nik_index (nik),
    INDEX telp_index (telp),
    INDEX alamat_index (alamat)
     );

CREATE TABLE kategori (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(25) NOT NULL,
    deskripsi VARCHAR(255),
    INDEX name_deskripsi_index (name, deskripsi),
    FULLTEXT kategori_search (name, deskripsi)
    );
    
INSERT INTO kategori (name, deskripsi) VALUES
	('ALT', 'Alat Listrik'),
    ('ATK', 'Alat Tulis Kantor'),
    ('MKN', 'Makanan'),
    ('MNM', 'Minuman'),
    ('OBAT', 'Obat-Obatan');

SELECT * FROM kategori;

CREATE TABLE satuan (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    deskripsi VARCHAR(255),
	INDEX name_deskripsi_index (name, deskripsi),
    FULLTEXT satuan_search (name, deskripsi)
    );

INSERT INTO satuan (name, deskripsi) VALUES
	('PCS', '1 Buah'),
    ('DUS', '1 dus = 12 = pcs'),
    ('PACK', 'Paket (tergantung kemasan)'),
    ('BAL', 'Per ikat'),
    ('KG', 'Kilogram');
    
SHOW CREATE TABLE user;

INSERT INTO user (username, full_name, email, password, role, nik, telp, alamat) VALUES
	('admin_account', 'Admin Toko', 'admin_account@gmail.com', 'admin', 'ADMIN', '3204123456789', '6281234567890', ' Jl. Merdeka No. 123, Jakarta');
    
INSERT INTO user (nik, username, full_name, password, role, email, telp, alamat) VALUES
	('3305123456789', 'rizkifirdaus', 'Muhammad Rizki Firdaus', '2210010466', 'OWNER', 'rizkifirdaus2902@gmail.com', '6281349923422', 'Jl. Martapura Kec Indrasai No. 9, Banjarbaru'),
    ('3410123456789', 'gamersjelek', 'Muhammad Raihan Aulia Rachman', '2210010325', 'KASIR', 'gamersjelek@gmail.com', '6287784441509', 'Jl. Mekatama Raya'),
    ('3511123456789', 'exaid1816', 'Muhammad Dhiaulrehan', '2210010521', 'KASIR', 'exaid1816@gmail.com', '6285849388073', 'Jl. Ga punya rumah'),
    ('3612123456789', 'gamersganteng', 'Adi Aulia Rachman', '2310010325', 'KASIR', 'gamersganteng@gmail.com', '6281349923421', 'Jl. Banjarmasin');
    
SELECT * FROM user;

CREATE TABLE customer (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nik CHAR(16) NOT NULL,
    name VARCHAR (100) NOT NULL,
    alamat VARCHAR(255),
    telp VARCHAR(20),
    email VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY nik_unique (nik),
    UNIQUE KEY email_unique (email),
    INDEX name_alamat_telp_index (name, alamat,telp),
    INDEX name_telp_index(name, telp),
    INDEX telp_index (telp),
    FULLTEXT alamat_search(alamat)
    );
    
INSERT INTO customer (nik, name, alamat, telp, email) VALUES
	('1209108765432', 'Budi Santoso', 'Jl. Merdeka No. 123, Jakarta', '6281234567890', 'budi.santoso@gmail.com'),
    ('3812098765432', 'Dewi Cahyani', 'Jl. Jenderal Sudirman No. 456, Surabaya', '6281234567891', 'dewi.cahyani@gmail.com'),
    ('4709234567890', 'Tri Wahyudi', 'Jl. Diponegoro No. 789, Bandung', '6281234567892', 'tri.wahyudi@gmail.com'),
    ('5609123456789', 'Siti Aminah', 'Jl. Gajah Mada No. 101, Yogyakarta', '6281234567893', 'siti.aminah@gmail.com'),
    ('6910123456789', 'Putra Pratama', 'Jl. Imam Bonjol No. 12, Medan', '6281234567894', 'putra.pratama@gmail.com');
    
CREATE TABLE supplier (
	id INT NOT NULL PRIMARY KEY  AUTO_INCREMENT,
    nik CHAR(16) NOT NULL,
    name VARCHAR(100) NOT NULL,
    telp VARCHAR(20) NOT NULL,
    alamat VARCHAR(255),
    email VARCHAR(150),
    perusahaan VARCHAR(100) NOT NULL,
    nama_bank VARCHAR(150) NOT NULL,
    nama_akun_bank VARCHAR(150) NOT NULL,
    no_akun_bank VARCHAR(150) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY nik_unique (nik),
    INDEX alamat_index (alamat),
    INDEX email_index (email),
    INDEX perusahaan_index(perusahaan),
    INDEX nama_akun_bank_index (nama_akun_bank),
    INDEX createdat_index (created_at),
    FULLTEXT name_alamat_perusahaan_nama_akunbank(name, alamat, perusahaan, nama_akun_bank)
    );
    
INSERT INTO supplier (nik, name, telp, alamat, email, perusahaan, nama_bank, nama_akun_bank, no_akun_bank) VALUES
	('123456789012345',	'Asep Sanjaya', '621234567890', '123 Jalan Utama', 'asep.sanjaya@gmail.com', 'ABC Company', 'BRI',	'Asep Sanjaya', '0987654321'),
    ('098765432109876', 'Nurdin Santoso', '629876543210', '456 Jalan Raya', 'nurdin@gmail.com', 'XYZ Corporation', 'BRI', 'Nurdin Santoso', '1234567890'),
    ('135792468013579', 'Muhammad Rizal', '621234567890',  '789 Jalan Besar', 'mhmd.rizal@gmail.com', 'LMN Enterprises', 'BCA', 'Muhammad Rizal', '1357924680'),
    ('246801357924680',	'Yogi', '628888888888', '321 Jalan Kecil', 'yogggg@gmail.com', 'PQR Inc.', 'BCA',	'Yogi', '2468013579'),
    ('369258147036925',	'Danang', '627777777777', '654 Jalan Menengah', 'danang@gmail.com', 'UVW Ltd.', 'BSI', 'Budi utomo', '3692581470');
    
CREATE TABLE barang (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    barcode INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    harga_jual BIGINT UNSIGNED NOT NULL,
    harga_beli BIGINT UNSIGNED NOT NULL,
    stok INT UNSIGNED NOT NULL DEFAULT 0,
    kategori_id INT NOT NULL,
    satuan_id INT NOT NULL,
    supplier_id INT NOT NULL,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY barcode_unique (barcode),
    INDEX name_index (name),
    INDEX harga_jual_index (harga_jual),
    INDEX harga_beli_index (harga_beli),
    INDEX stok_index (stok),
    INDEX createdat_index (created_at),
    FULLTEXT name_search (name),
    CONSTRAINT harga_jual_check  CHECK (harga_jual >= harga_beli)
    );
    

     
INSERT INTO user (username, full_name, email, password, role, nik, telp, alamat) VALUES
	('rayyreall', 'Muhammad Rizki Firdaus', 'rizkifirdaus2902@gmail.com', 'iki251429', 'OWNER', '1234567891234567', '081349923422', 'Martapura'),
    ('admin', 'admin', 'admin@admin.com', 'admin', 'ADMIN', '1234567891234567', '081349923422', 'Martapura');
    
SELECT * FROM user;

SHOW TABLES;
SHOW VARIABLES LIKE 'port';
SHOW CREATE TABLE user;

GRANT ALL PRIVILEGES ON sistem_penjualan.* TO 'root'@'localhost' IDENTIFIED BY 'iki251429';
FLUSH PRIVILEGES;