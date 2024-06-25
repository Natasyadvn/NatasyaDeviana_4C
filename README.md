# Halo! Semua 👋

## 🌟 Perkenalkan saya
- **Nama:** Natasya Deviana
- **NPM:** 2110010454
- **Kelas:** 4C Reg Pagi FTI UNISKA Banjarbaru
- **Jurusan:** Teknik Informatika
- **Kampus:** Universitas Islam Kalimantan Muhammad Arsyad Al Banjari Banjarmasin 


# Sistem Penjualan menggunakan Aplikasi Delphi

Sistem Penjualan adalah aplikasi sederhana yang dibangun menggunakan Delphi untuk membantu dalam pengelolaan penjualan barang di suatu toko atau usaha kecil.

## Fitur Utama:
- Autentikasi pengguna (admin, pemilik, kasir)
- Perekaman data kategori (khusus admin)
- Menu dashboard

## Cara Menggunakan Aplikasi:
1. **Login**:
   - Masukkan role yang ingin di hubungkan terlebih dahulu.

2. **Management Kategori**:
   - Tambahkan, edit, atau hapus data kategori barang sesuai kebutuhan.

3. **Dashboard**:
   - Pilihan berbagai macam menu seperti login, logout, menu admin, menu pemilik, menu kasir


### Langkah-langkah:

1. **Clone Repository**:
   ```bash
   git clone https://github.com/Natasyadvn/NatasyaDeviana_4C.git
   ```
2. **Masuk Ke folder**:
    ```bash
    cd NatasyaDeviana_4c
    ```
3. **Menjalankan database MySQL**
    - Jalankan database mysql anda terlebih dahulu bisa menggunakan xampp, laragon, dll (direkomendasikan menggunakan port: 3306,
    jika bukan port 3306 pastikan anda mengganti terlebih dahulu port di ZConnection DataModule)
    - Buat database terlebih dahulu ketika belum membuat database delphi
    - Ikuti struktur table seperti code berikut ini
    ```sql
    CREATE DATABASE sistem_penjualan
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
        name VARCHAR(25) NOT NULL
        INDEX name_index (name),
        FULLTEXT kategori_search (name)
    );

    CREATE TABLE satuan (
	    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(100) NOT NULL,
        deskripsi VARCHAR(255),
	    INDEX name_deskripsi_index (name, deskripsi),
        FULLTEXT satuan_search (name, deskripsi)
    );

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

    CREATE TABLE barang (
	    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        barcode CHAR(13) NOT NULL,
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
        CONSTRAINT fk_barangKategori FOREIGN KEY (kategori_id) REFERENCES kategori(id),
        CONSTRAINT fk_barangSatuan FOREIGN KEY (satuan_id) REFERENCES satuan(id),
        CONSTRAINT fk_barangSupplier FOREIGN KEY (supplier_id) REFERENCES supplier (id),
        CONSTRAINT fk_barangUser FOREIGN KEY (user_id) REFERENCES user(id),
        INDEX name_index (name),
        INDEX harga_jual_index (harga_jual),
        INDEX harga_beli_index (harga_beli),
        INDEX stok_index (stok),
        INDEX createdat_index (created_at),
        FULLTEXT name_search (name),
        CONSTRAINT harga_jual_check  CHECK (harga_jual >= harga_beli)
    );

    CREATE TABLE penjualan (
	    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        invoice CHAR(10) NOT NULL,
        total  BIGINT UNSIGNED NOT NULL,
        bayar BIGINT UNSIGNED NOT NULL,
        kembali BIGINT UNSIGNED NOT NULL,
        tanggal DATE NOT NULL,
        customer_id INT NOT NULL,
        user_id INT NOT NULL,
        created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        UNIQUE KEY invoice_unique (invoice),
        CONSTRAINT fk_penjualanCustomer FOREIGN KEY (customer_id) REFERENCES customer (id),
        CONSTRAINT fk_penjualanUser FOREIGN KEY (user_id) REFERENCES user (id),
        INDEX  total_index (total)
    );

    ```
4. **Buka project menggunakan borland delphi**
5. **Selamat Mencoba 👌**


## Catatan:
- Aplikasi ini hanya merupakan proyek sederhana untuk tujuan tugas kuliah
- Project ini dibuat menggunakan borland delphi 7
