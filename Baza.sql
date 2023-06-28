-- --------------------------------------------------------
-- Host:                         .\SQLEXPRESS
-- Server version:               Microsoft SQL Server 2014 - 12.0.2269.0
-- Server OS:                    Windows NT 6.3 <X64> (Build 19042: )
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES  */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for procedure AutoSkolaKZ.broj_polaznika_proc
DELIMITER //
CREATE PROCEDURE broj_polaznika_proc
	@ime VARCHAR(20)
AS
BEGIN
	SELECT COUNT(*)
	FROM polaznik
	WHERE polaznik.ime = @ime
END//
DELIMITER ;

-- Dumping structure for table AutoSkolaKZ.cas
CREATE TABLE IF NOT EXISTS "cas" (
	"id_cas" VARCHAR(20) NOT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"id_polaznik" VARCHAR(20) NOT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"broj_casova_prva_pomoc" VARCHAR(20) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"broj_casova_testovi" VARCHAR(20) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"id_instruktor" VARCHAR(20) NOT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"id_vozilo" VARCHAR(20) NOT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"broj_casova_voznja" VARCHAR(20) NOT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	FOREIGN KEY INDEX "FK__cas__id_instrukt__182C9B23" ("id_instruktor"),
	FOREIGN KEY INDEX "FK__cas__id_polaznik__173876EA" ("id_polaznik"),
	FOREIGN KEY INDEX "FK__cas__id_vozilo__1920BF5C" ("id_vozilo"),
	PRIMARY KEY ("id_cas"),
	CONSTRAINT "FK__cas__id_polaznik__173876EA" FOREIGN KEY ("id_polaznik") REFERENCES "polaznik" ("id_polaznik") ON UPDATE NO_ACTION ON DELETE NO_ACTION,
	CONSTRAINT "FK__cas__id_vozilo__1920BF5C" FOREIGN KEY ("id_vozilo") REFERENCES "vozilo" ("id_vozilo") ON UPDATE NO_ACTION ON DELETE NO_ACTION,
	CONSTRAINT "FK__cas__id_instrukt__182C9B23" FOREIGN KEY ("id_instruktor") REFERENCES "instruktor" ("id_instruktor") ON UPDATE NO_ACTION ON DELETE NO_ACTION
);

-- Dumping data for table AutoSkolaKZ.cas: -1 rows
/*!40000 ALTER TABLE "cas" DISABLE KEYS */;
INSERT INTO "cas" ("id_cas", "id_polaznik", "broj_casova_prva_pomoc", "broj_casova_testovi", "id_instruktor", "id_vozilo", "broj_casova_voznja") VALUES
	('Cas1', 'Pol1', '8', '40', 'Ins1', 'Voz1', '38'),
	('Cas2', 'Pol2', '8', '40', 'Ins2', 'Voz2', '40'),
	('Cas3', 'Pol3', '8', '32', 'Ins1', 'Voz1', '0'),
	('Cas4', 'Pol4', '4', '3', 'Ins1', 'Voz1', '0'),
	('Cas5', 'Pol5', '1', '0', 'Ins3', 'Voz3', '0');
/*!40000 ALTER TABLE "cas" ENABLE KEYS */;

-- Dumping structure for table AutoSkolaKZ.instruktor
CREATE TABLE IF NOT EXISTS "instruktor" (
	"id_instruktor" VARCHAR(20) NOT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"ime" VARCHAR(20) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"prezime" VARCHAR(20) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"godiste" NUMERIC(5,0) NULL DEFAULT NULL,
	"broj_telefona" VARCHAR(15) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"id_vozilo" VARCHAR(20) NOT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	FOREIGN KEY INDEX "FK__instrukto__id_vo__145C0A3F" ("id_vozilo"),
	PRIMARY KEY ("id_instruktor"),
	CONSTRAINT "FK__instrukto__id_vo__145C0A3F" FOREIGN KEY ("id_vozilo") REFERENCES "vozilo" ("id_vozilo") ON UPDATE NO_ACTION ON DELETE NO_ACTION
);

-- Dumping data for table AutoSkolaKZ.instruktor: -1 rows
/*!40000 ALTER TABLE "instruktor" DISABLE KEYS */;
INSERT INTO "instruktor" ("id_instruktor", "ime", "prezime", "godiste", "broj_telefona", "id_vozilo") VALUES
	('Ins1', 'Mustafa', 'Mustafic', 1973, '061444555', 'Voz1'),
	('Ins2', 'Suljo', 'Zukic', 1980, '061555666', 'Voz2'),
	('Ins3', 'Haso', 'Husic', 1977, '0626767878', 'Voz3');
/*!40000 ALTER TABLE "instruktor" ENABLE KEYS */;

-- Dumping structure for table AutoSkolaKZ.kurs
CREATE TABLE IF NOT EXISTS "kurs" (
	"id_kurs" VARCHAR(20) NOT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"id_polaznik" VARCHAR(20) NOT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"kategorija" VARCHAR(10) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"id_cas" VARCHAR(20) NOT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"odslusani_casovi" VARCHAR(20) NOT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"id_testiranje" VARCHAR(20) NOT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"polozen_vozacki_ispit" VARCHAR(20) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	FOREIGN KEY INDEX "FK__kurs__id_cas__24927208" ("id_cas"),
	FOREIGN KEY INDEX "FK__kurs__id_polazni__239E4DCF" ("id_polaznik"),
	FOREIGN KEY INDEX "FK__kurs__id_testira__25869641" ("id_testiranje"),
	PRIMARY KEY ("id_kurs"),
	CONSTRAINT "FK__kurs__id_polazni__239E4DCF" FOREIGN KEY ("id_polaznik") REFERENCES "polaznik" ("id_polaznik") ON UPDATE NO_ACTION ON DELETE NO_ACTION,
	CONSTRAINT "FK__kurs__id_cas__24927208" FOREIGN KEY ("id_cas") REFERENCES "cas" ("id_cas") ON UPDATE NO_ACTION ON DELETE NO_ACTION,
	CONSTRAINT "FK__kurs__id_testira__25869641" FOREIGN KEY ("id_testiranje") REFERENCES "testiranje" ("id_testiranje") ON UPDATE NO_ACTION ON DELETE NO_ACTION
);

-- Dumping data for table AutoSkolaKZ.kurs: -1 rows
/*!40000 ALTER TABLE "kurs" DISABLE KEYS */;
INSERT INTO "kurs" ("id_kurs", "id_polaznik", "kategorija", "id_cas", "odslusani_casovi", "id_testiranje", "polozen_vozacki_ispit") VALUES
	('Kur1', 'Pol1', 'B', 'Cas1', 'Ne', 'Tes1', 'Ne'),
	('Kur2', 'Pol2', 'C', 'Cas2', 'Da', 'Tes2', 'Da'),
	('Kur3', 'Pol3', 'B', 'Cas3', 'Ne', 'Tes3', 'Ne'),
	('Kur4', 'Pol4', 'B', 'Cas4', 'Ne', 'Tes4', 'Ne'),
	('Kur5', 'Pol5', 'A', 'Cas5', 'Ne', 'Tes5', 'Ne');
/*!40000 ALTER TABLE "kurs" ENABLE KEYS */;

-- Dumping structure for table AutoSkolaKZ.polaznik
CREATE TABLE IF NOT EXISTS "polaznik" (
	"id_polaznik" VARCHAR(20) NOT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"ime" VARCHAR(20) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"prezime" VARCHAR(20) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"godiste" NUMERIC(5,0) NULL DEFAULT NULL,
	"broj_telefona" VARCHAR(15) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	PRIMARY KEY ("id_polaznik")
);

-- Dumping data for table AutoSkolaKZ.polaznik: -1 rows
/*!40000 ALTER TABLE "polaznik" DISABLE KEYS */;
INSERT INTO "polaznik" ("id_polaznik", "ime", "prezime", "godiste", "broj_telefona") VALUES
	('Pol1', 'Kemal', 'Gogic', 2000, '061234567'),
	('Pol2', 'Zijo', 'Jusufovic', 1998, '062333444'),
	('Pol3', 'Kenan', 'Hamidovic', 1995, '061222999'),
	('Pol4', 'Haris', 'Hamidovic', 1993, '062987654'),
	('Pol5', 'Muamer', 'Hodžic', 1999, '062343565');
/*!40000 ALTER TABLE "polaznik" ENABLE KEYS */;

-- Dumping structure for table AutoSkolaKZ.testiranje
CREATE TABLE IF NOT EXISTS "testiranje" (
	"id_testiranje" VARCHAR(20) NOT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"id_polaznik" VARCHAR(20) NOT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"polozena_prva_pomoc" VARCHAR(20) NOT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"polozeni_testovi" VARCHAR(20) NOT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"polozena_voznja" VARCHAR(20) NOT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	FOREIGN KEY INDEX "FK__testiranj__id_po__1BFD2C07" ("id_polaznik"),
	PRIMARY KEY ("id_testiranje"),
	CONSTRAINT "FK__testiranj__id_po__1BFD2C07" FOREIGN KEY ("id_polaznik") REFERENCES "polaznik" ("id_polaznik") ON UPDATE NO_ACTION ON DELETE NO_ACTION
);

-- Dumping data for table AutoSkolaKZ.testiranje: -1 rows
/*!40000 ALTER TABLE "testiranje" DISABLE KEYS */;
INSERT INTO "testiranje" ("id_testiranje", "id_polaznik", "polozena_prva_pomoc", "polozeni_testovi", "polozena_voznja") VALUES
	('Tes1', 'Pol1', 'Da', 'Da', 'Ne'),
	('Tes2', 'Pol2', 'Da', 'Da', 'Da'),
	('Tes3', 'Pol3', 'Da', 'Ne', 'Ne'),
	('Tes4', 'Pol4', 'Ne', 'Ne', 'Ne'),
	('Tes5', 'Pol5', 'Ne', 'Ne', 'Ne');
/*!40000 ALTER TABLE "testiranje" ENABLE KEYS */;

-- Dumping structure for table AutoSkolaKZ.vozilo
CREATE TABLE IF NOT EXISTS "vozilo" (
	"id_vozilo" VARCHAR(20) NOT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"model" VARCHAR(20) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"godiste" NUMERIC(5,0) NULL DEFAULT NULL,
	"registracija" VARCHAR(30) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	"kategorija" VARCHAR(5) NULL DEFAULT NULL COLLATE 'SQL_Latin1_General_CP1_CI_AS',
	PRIMARY KEY ("id_vozilo")
);

-- Dumping data for table AutoSkolaKZ.vozilo: -1 rows
/*!40000 ALTER TABLE "vozilo" DISABLE KEYS */;
INSERT INTO "vozilo" ("id_vozilo", "model", "godiste", "registracija", "kategorija") VALUES
	('Voz1', 'Golf 4', 2014, 'K21-M-453', 'B'),
	('Voz2', 'Volvo D7F290', 2010, 'M43-M-123', 'C'),
	('Voz3', 'Suzuki v-storm650', 2010, 'T11-T-222', 'A');
/*!40000 ALTER TABLE "vozilo" ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
