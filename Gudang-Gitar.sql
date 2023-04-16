CREATE TABLE `Rute`(
    `id_rute` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `id_gudang_asal` INT NOT NULL,
    `id_gudang_tujuan` INT NOT NULL,
    `id_outlet` INT NOT NULL
);
ALTER TABLE
    `Rute` ADD PRIMARY KEY(`id_rute`);
CREATE TABLE `Outlet`(
    `id_Outlet` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Nama_Outlet` VARCHAR(255) NOT NULL,
    `Alamat_Outlet` VARCHAR(255) NOT NULL,
    `Telp_Outlet` INT NOT NULL,
    `id_pengguna` INT NOT NULL
);
ALTER TABLE
    `Outlet` ADD PRIMARY KEY(`id_Outlet`);
CREATE TABLE `jenis_Gitar`(
    `id_jenis` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `nama_jenis` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `jenis_Gitar` ADD PRIMARY KEY(`id_jenis`);
CREATE TABLE `Supir`(
    `id_Supir` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Nama_Supir` VARCHAR(255) NOT NULL,
    `Alamat_Supir` VARCHAR(255) NOT NULL,
    `Telp_Supir` INT NOT NULL
);
ALTER TABLE
    `Supir` ADD PRIMARY KEY(`id_Supir`);
CREATE TABLE `truk`(
    `id_truk` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `nopol_truk` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `truk` ADD PRIMARY KEY(`id_truk`);
CREATE TABLE `Pengiriman`(
    `id_Pengiriman` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `id_Admin` INT NOT NULL,
    `id_jenis` INT NOT NULL,
    `jumlah` INT NOT NULL,
    `Waktu_Pengiriman` DATE NOT NULL,
    `id_Supir` INT NOT NULL,
    `id_truk` INT NOT NULL,
    `id_rute` INT NOT NULL
);
ALTER TABLE
    `Pengiriman` ADD PRIMARY KEY(`id_Pengiriman`);
CREATE TABLE `Gudang`(
    `id_gudang` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Nama_Gudang` VARCHAR(255) NOT NULL,
    `alamat_gudang` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Gudang` ADD PRIMARY KEY(`id_gudang`);
CREATE TABLE `Gitar`(
    `id_Gitar` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Nama_Gitar` VARCHAR(255) NOT NULL,
    `Stok_Gitar` INT NOT NULL,
    `id_jenis` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Gitar` ADD PRIMARY KEY(`id_Gitar`);
CREATE TABLE `Pengguna`(
    `id_Pengguna` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Nama_Pengguna` VARCHAR(255) NOT NULL,
    `Username_Pengguna` VARCHAR(255) NOT NULL,
    `Password_Pengguna` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Pengguna` ADD PRIMARY KEY(`id_Pengguna`);
CREATE TABLE `Admin`(
    `id_Admin` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Nama_Admin` VARCHAR(255) NOT NULL,
    `Username_Admin` VARCHAR(255) NOT NULL,
    `Password_Admin` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Admin` ADD PRIMARY KEY(`id_Admin`);
ALTER TABLE
    `Pengiriman` ADD CONSTRAINT `pengiriman_id_rute_foreign` FOREIGN KEY(`id_rute`) REFERENCES `Rute`(`id_rute`);
ALTER TABLE
    `Gitar` ADD CONSTRAINT `gitar_id_jenis_foreign` FOREIGN KEY(`id_jenis`) REFERENCES `jenis_Gitar`(`id_jenis`);
ALTER TABLE
    `Rute` ADD CONSTRAINT `rute_id_outlet_foreign` FOREIGN KEY(`id_outlet`) REFERENCES `Outlet`(`id_Outlet`);
ALTER TABLE
    `Rute` ADD CONSTRAINT `rute_id_gudang_tujuan_foreign` FOREIGN KEY(`id_gudang_tujuan`) REFERENCES `Gudang`(`id_gudang`);
ALTER TABLE
    `Pengiriman` ADD CONSTRAINT `pengiriman_id_supir_foreign` FOREIGN KEY(`id_Supir`) REFERENCES `Supir`(`id_Supir`);
ALTER TABLE
    `Outlet` ADD CONSTRAINT `outlet_id_pengguna_foreign` FOREIGN KEY(`id_pengguna`) REFERENCES `Pengguna`(`id_Pengguna`);
ALTER TABLE
    `Pengiriman` ADD CONSTRAINT `pengiriman_id_jenis_foreign` FOREIGN KEY(`id_jenis`) REFERENCES `jenis_Gitar`(`id_jenis`);
ALTER TABLE
    `Rute` ADD CONSTRAINT `rute_id_gudang_asal_foreign` FOREIGN KEY(`id_gudang_asal`) REFERENCES `Gudang`(`id_gudang`);
ALTER TABLE
    `Pengiriman` ADD CONSTRAINT `pengiriman_id_admin_foreign` FOREIGN KEY(`id_Admin`) REFERENCES `Admin`(`id_Admin`);
ALTER TABLE
    `Pengiriman` ADD CONSTRAINT `pengiriman_id_truk_foreign` FOREIGN KEY(`id_truk`) REFERENCES `truk`(`id_truk`);