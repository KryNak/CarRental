-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2020-05-24 15:30:43.794

-- tables
-- Table: Klient
CREATE TABLE Klient (
    IdKlient integer  NOT NULL,
    Adres varchar2(30)  NOT NULL,
    CONSTRAINT Klient_pk PRIMARY KEY (IdKlient)
) ;

-- Table: Osoba
CREATE TABLE Osoba (
    IdOsoba integer  NOT NULL,
    imie varchar2(20)  NOT NULL,
    nazwisko varchar2(20)  NOT NULL,
    CONSTRAINT Osoba_pk PRIMARY KEY (IdOsoba)
) ;

-- Table: Pracownik
CREATE TABLE Pracownik (
    IdPracownik integer  NOT NULL,
    DataZatrudnienia date  NOT NULL,
    IdPracownikNadzorujacy integer  NULL,
    IdWypozyczalnia integer  NOT NULL,
    CONSTRAINT Pracownik_pk PRIMARY KEY (IdPracownik)
) ;

-- Table: Samochod
CREATE TABLE Samochod (
    IdSamochod integer  NOT NULL,
    Marka varchar2(20)  NOT NULL,
    Silnik_IdSilnik integer  NOT NULL,
    IdWypozyczalnia integer  NOT NULL,
    CONSTRAINT Samochod_pk PRIMARY KEY (IdSamochod)
) ;

-- Table: Silnik
CREATE TABLE Silnik (
    IdSilnik integer  NOT NULL,
    Moc integer  NOT NULL,
    MomentObrotowy integer  NOT NULL,
    IdTypSilnika integer  NOT NULL,
    CONSTRAINT Silnik_pk PRIMARY KEY (IdSilnik)
) ;

-- Table: TypSilnika
CREATE TABLE TypSilnika (
    IdTypSilnika integer  NOT NULL,
    TypSilnika varchar2(20)  NOT NULL,
    CONSTRAINT TypSilnika_pk PRIMARY KEY (IdTypSilnika)
) ;

-- Table: Wlasciciel
CREATE TABLE Wlasciciel (
    IdWlasciciel integer  NOT NULL,
    DataZalozeniaFirmy date  NOT NULL,
    CONSTRAINT Wlasciciel_pk PRIMARY KEY (IdWlasciciel)
) ;

-- Table: Wypozyczalnia
CREATE TABLE Wypozyczalnia (
    IdWypozyczalnia integer  NOT NULL,
    Nazwa varchar2(20)  NOT NULL,
    GodzinaOtwarcia timestamp  NOT NULL,
    GodzinaZamkniecia timestamp  NOT NULL,
    IdWlasciciel integer  NOT NULL,
    CONSTRAINT Wypozyczalnia_pk PRIMARY KEY (IdWypozyczalnia)
) ;

-- Table: Wypozyczanie
CREATE TABLE Wypozyczanie (
    IdWpozyczanie integer  NOT NULL,
    DataWpozyczenia date  NOT NULL,
    DataZwrotu date  NOT NULL,
    IdSamochod integer  NOT NULL,
    IdPracownik integer  NOT NULL,
    IdKlient integer  NOT NULL,
    Naleznosc float(2)  NOT NULL,
    CONSTRAINT Wypozyczanie_pk PRIMARY KEY (IdWpozyczanie)
) ;

-- foreign keys
-- Reference: Klient_Osoba (table: Klient)
ALTER TABLE Klient ADD CONSTRAINT Klient_Osoba
    FOREIGN KEY (IdKlient)
    REFERENCES Osoba (IdOsoba);

-- Reference: Pracownik_Osoba (table: Pracownik)
ALTER TABLE Pracownik ADD CONSTRAINT Pracownik_Osoba
    FOREIGN KEY (IdPracownik)
    REFERENCES Osoba (IdOsoba);

-- Reference: Pracownik_Pracownik (table: Pracownik)
ALTER TABLE Pracownik ADD CONSTRAINT Pracownik_Pracownik
    FOREIGN KEY (IdPracownikNadzorujacy)
    REFERENCES Pracownik (IdPracownik);

-- Reference: Pracownik_Wypozyczalnia (table: Pracownik)
ALTER TABLE Pracownik ADD CONSTRAINT Pracownik_Wypozyczalnia
    FOREIGN KEY (IdWypozyczalnia)
    REFERENCES Wypozyczalnia (IdWypozyczalnia);

-- Reference: Samochod_Silnik (table: Samochod)
ALTER TABLE Samochod ADD CONSTRAINT Samochod_Silnik
    FOREIGN KEY (Silnik_IdSilnik)
    REFERENCES Silnik (IdSilnik);

-- Reference: Samochod_Wypozyczalnia (table: Samochod)
ALTER TABLE Samochod ADD CONSTRAINT Samochod_Wypozyczalnia
    FOREIGN KEY (IdWypozyczalnia)
    REFERENCES Wypozyczalnia (IdWypozyczalnia);

-- Reference: Silnik_TypSilnika (table: Silnik)
ALTER TABLE Silnik ADD CONSTRAINT Silnik_TypSilnika
    FOREIGN KEY (IdTypSilnika)
    REFERENCES TypSilnika (IdTypSilnika);

-- Reference: Wlasciciel_Osoba (table: Wlasciciel)
ALTER TABLE Wlasciciel ADD CONSTRAINT Wlasciciel_Osoba
    FOREIGN KEY (IdWlasciciel)
    REFERENCES Osoba (IdOsoba);

-- Reference: Wypozyczalnia_Wlasciciel (table: Wypozyczalnia)
ALTER TABLE Wypozyczalnia ADD CONSTRAINT Wypozyczalnia_Wlasciciel
    FOREIGN KEY (IdWlasciciel)
    REFERENCES Wlasciciel (IdWlasciciel);

-- Reference: Wypozyczanie_Klient (table: Wypozyczanie)
ALTER TABLE Wypozyczanie ADD CONSTRAINT Wypozyczanie_Klient
    FOREIGN KEY (IdKlient)
    REFERENCES Klient (IdKlient);

-- Reference: Wypozyczanie_Pracownik (table: Wypozyczanie)
ALTER TABLE Wypozyczanie ADD CONSTRAINT Wypozyczanie_Pracownik
    FOREIGN KEY (IdPracownik)
    REFERENCES Pracownik (IdPracownik);

-- Reference: Wypozyczanie_Samochod (table: Wypozyczanie)
ALTER TABLE Wypozyczanie ADD CONSTRAINT Wypozyczanie_Samochod
    FOREIGN KEY (IdSamochod)
    REFERENCES Samochod (IdSamochod);

-- End of file.

-- Osoba
INSERT INTO Osoba(idosoba, imie, nazwisko) VALUES (0,'Bill','Harris');
INSERT INTO Osoba(idosoba, imie, nazwisko) VALUES (1,'Robert','Szybki');
INSERT INTO Osoba(idosoba, imie, nazwisko) VALUES (2,'Maria','Anna');
INSERT INTO Osoba(idosoba, imie, nazwisko) VALUES (3,'Krzysztof','Suchy');
INSERT INTO Osoba(idosoba, imie, nazwisko) VALUES (4,'Ryszard','Cierpki');
INSERT INTO Osoba(idosoba, imie, nazwisko) VALUES (5,'Wlodzimierz','Gazowany');
INSERT INTO Osoba(idosoba, imie, nazwisko) VALUES (6,'Aleksandra','Boka');
INSERT INTO Osoba(idosoba, imie, nazwisko) VALUES (7,'Marek','Dawid');
INSERT INTO Osoba(idosoba, imie, nazwisko) VALUES (8,'Slawomir','Lichy');
INSERT INTO Osoba(idosoba, imie, nazwisko) VALUES (9,'Michal','Nowak');

-- Wlasciciel
INSERT INTO Wlasciciel(idwlasciciel, datazalozeniafirmy) VALUES (0, Date'1967-05-12');

-- Wypozyczalnia
INSERT INTO Wypozyczalnia(IdWypozyczalnia, Nazwa, GodzinaOtwarcia, GodzinaZamkniecia, IdWlasciciel) VALUES (0,'Auto Car','2000-01-01 08:00:00','2000-01-01 17:00:00',0);

-- Pracownik
INSERT INTO Pracownik(idpracownik, datazatrudnienia, idpracowniknadzorujacy, idwypozyczalnia) VALUES (1, Date'1967-08-12',NULL,0);
INSERT INTO Pracownik(idpracownik, datazatrudnienia, idpracowniknadzorujacy, idwypozyczalnia) VALUES (2, Date'1968-01-02',1,0);
INSERT INTO Pracownik(idpracownik, datazatrudnienia, idpracowniknadzorujacy, idwypozyczalnia) VALUES (3, Date'1968-03-05',1,0);
INSERT INTO Pracownik(idpracownik, datazatrudnienia, idpracowniknadzorujacy, idwypozyczalnia) VALUES (4, Date'1968-09-21',2,0);
INSERT INTO Pracownik(idpracownik, datazatrudnienia, idpracowniknadzorujacy, idwypozyczalnia) VALUES (5, Date'1969-02-01',3,0);

-- Klient
INSERT INTO Klient(idklient, adres) VALUES (6, 'Pogodna 10');
INSERT INTO Klient(idklient, adres) VALUES (7, 'Wesola 15');
INSERT INTO Klient(idklient, adres) VALUES (8, 'Ponura 8');
INSERT INTO Klient(idklient, adres) VALUES (9, 'Bursztynowa 39/12');

-- Typ silnika
INSERT INTO TypSilnika(idtypsilnika, typsilnika) VALUES (0,'Diesel');
INSERT INTO TypSilnika(idtypsilnika, typsilnika) VALUES (1,'Benzynowy');
INSERT INTO TypSilnika(idtypsilnika, typsilnika) VALUES (2,'Elektryczny');
INSERT INTO TypSilnika(idtypsilnika, typsilnika) VALUES (3,'Hybrydowy');

-- Silnik
INSERT INTO Silnik(idsilnik, moc, momentobrotowy, idtypsilnika) VALUES (0, 612, 850, 1);
INSERT INTO Silnik(idsilnik, moc, momentobrotowy, idtypsilnika) VALUES (1, 190, 400, 0);
INSERT INTO Silnik(idsilnik, moc, momentobrotowy, idtypsilnika) VALUES (2, 881, 1280, 3);
INSERT INTO Silnik(idsilnik, moc, momentobrotowy, idtypsilnika) VALUES (3, 825, 1300, 2);
INSERT INTO Silnik(idsilnik, moc, momentobrotowy, idtypsilnika) VALUES (4, 963, 700, 3);
INSERT INTO Silnik(idsilnik, moc, momentobrotowy, idtypsilnika) VALUES (5, 1318, 1359, 1);
INSERT INTO Silnik(idsilnik, moc, momentobrotowy, idtypsilnika) VALUES (6, 416, 587, 0);
INSERT INTO Silnik(idsilnik, moc, momentobrotowy, idtypsilnika) VALUES (7, 654, 814, 1);
INSERT INTO Silnik(idsilnik, moc, momentobrotowy, idtypsilnika) VALUES (8, 2000, 1700, 2);
INSERT INTO Silnik(idsilnik, moc, momentobrotowy, idtypsilnika) VALUES (9, 1000, 800, 2);


-- Samochod
INSERT INTO Samochod(idsamochod, marka, silnik_idsilnik, idwypozyczalnia) VALUES (0,'Mercedes',0,0);
INSERT INTO Samochod(idsamochod, marka, silnik_idsilnik, idwypozyczalnia) VALUES (1,'BMW',1,0);
INSERT INTO Samochod(idsamochod, marka, silnik_idsilnik, idwypozyczalnia) VALUES (2,'Porsche',2,0);
INSERT INTO Samochod(idsamochod, marka, silnik_idsilnik, idwypozyczalnia) VALUES (3,'Tesla',3,0);
INSERT INTO Samochod(idsamochod, marka, silnik_idsilnik, idwypozyczalnia) VALUES (4,'LaFerrari',4,0);
INSERT INTO Samochod(idsamochod, marka, silnik_idsilnik, idwypozyczalnia) VALUES (5,'SSC Ultimate Aero XT',5,0);
INSERT INTO Samochod(idsamochod, marka, silnik_idsilnik, idwypozyczalnia) VALUES (6,'Forda F-250',6,0);
INSERT INTO Samochod(idsamochod, marka, silnik_idsilnik, idwypozyczalnia) VALUES (7,'Viper',7,0);
INSERT INTO Samochod(idsamochod, marka, silnik_idsilnik, idwypozyczalnia) VALUES (8,'Lotus',8,0);
INSERT INTO Samochod(idsamochod, marka, silnik_idsilnik, idwypozyczalnia) VALUES (9,'Lotus Stradle',9,0);

-- Wypozyczanie
INSERT INTO Wypozyczanie(idwpozyczanie, datawpozyczenia, datazwrotu, idsamochod, idpracownik, idklient, naleznosc)
    VALUES (0, DATE'2018-01-12', DATE'2021-02-02', 0, 2, 6, 50000);
INSERT INTO Wypozyczanie(idwpozyczanie, datawpozyczenia, datazwrotu, idsamochod, idpracownik, idklient, naleznosc)
    VALUES (1, DATE'2019-01-12', DATE'2020-02-05', 1, 3, 7, 40000);
INSERT INTO Wypozyczanie(idwpozyczanie, datawpozyczenia, datazwrotu, idsamochod, idpracownik, idklient, naleznosc)
    VALUES (2, DATE'2017-08-13', DATE'2021-05-02', 2, 4, 8, 60000);
INSERT INTO Wypozyczanie(idwpozyczanie, datawpozyczenia, datazwrotu, idsamochod, idpracownik, idklient, naleznosc)
    VALUES (3, DATE'2016-01-12', DATE'2021-02-02', 3, 5, 9, 60000);

-- SLECTY

-- Podstawowe (WHERE, ORDER BY itp.) (x2)
SELECT * FROM Osoba WHERE imie LIKE 'R%' OR imie LIKE 'M%' OR imie LIKE 'A%' OR imie LIKE 'R%' ORDER BY nazwisko DESC;

SELECT Nazwa AS "Nazwa Firmy",
       (EXTRACT( HOUR FROM GodzinaOtwarcia) || ' : ' || EXTRACT ( MINUTE FROM GodzinaOtwarcia) || ' : ' || EXTRACT( SECOND FROM GodzinaOtwarcia)) AS "Godzina otwarcia",
       (EXTRACT( HOUR FROM GodzinaZamkniecia) || ' : ' || EXTRACT ( MINUTE FROM GodzinaZamkniecia) || ' : ' || EXTRACT( SECOND FROM GodzinaZamkniecia)) AS "Godzina zamkniecia"
        FROM Wypozyczalnia;

-- Z³¹czenia (x2)

SELECT IdWpozyczanie, DataWpozyczenia, DataZwrotu, Samochod.Marka, prac.imie || ' ' || prac.nazwisko as PRACOWNIK,
       kli.imie || ' ' || kli.nazwisko as KLIENT, Naleznosc FROM Wypozyczanie
    INNER JOIN Klient ON Klient.IdKlient = Wypozyczanie.IdKlient
    INNER JOIN Osoba kli ON Klient.IdKlient = kli.IdOsoba
    INNER JOIN Pracownik ON Pracownik.IdPracownik = Wypozyczanie.IdPracownik
    INNER JOIN Osoba prac ON Pracownik.IdPracownik = prac.IdOsoba
    INNER JOIN Samochod ON Samochod.IdSamochod = Wypozyczanie.IdSamochod;

SELECT IdOsoba, imie, nazwisko, DataZatrudnienia, Nazwa FROM Osoba
    INNER JOIN Pracownik ON Osoba.IdOsoba = Pracownik.IdPracownik
    INNER JOIN WYPOZYCZALNIA ON Pracownik.IdWypozyczalnia = Wypozyczalnia.IdWypozyczalnia;

SELECT os1.imie || ' ' || os1.nazwisko as PRACOWNIK, os2.imie || ' ' || os2.nazwisko as SZEF FROM Pracownik prac
    LEFT JOIN Pracownik szef ON prac.IDPRACOWNIKNADZORUJACY = szef.IDPRACOWNIK
    LEFT JOIN Osoba os1 ON prac.IDPRACOWNIK = os1.IdOsoba
    LEFT JOIN Osoba os2 ON szef.IDPRACOWNIK = os2.IdOsoba
    ORDER BY os1.IdOsoba;

SELECT marka, TypSilnika, moc, MomentObrotowy FROM Samochod
    INNER JOIN Silnik ON Samochod.Silnik_IdSilnik = Silnik.IdSilnik
    INNER JOIN TYPSILNIKA ON Silnik.IdTypSilnika = TypSilnika.IdTypSilnika;

-- Grupuj¹ce (GROUP BY HAVING) (x2)

SELECT TypSilnika.TypSilnika, MAX(moc) FROM Samochod
    INNER JOIN Silnik ON Samochod.Silnik_IdSilnik = Silnik.IdSilnik
    INNER JOIN TypSilnika ON Silnik.IdTypSilnika = TypSilnika.IdTypSilnika
    GROUP BY TypSilnika.TypSilnika HAVING MAX(MomentObrotowy) > 800;

SELECT TypSilnika, COUNT(*) FROM Samochod
    INNER JOIN Silnik ON Samochod.Silnik_IdSilnik = Silnik.IdSilnik
    INNER JOIN TypSilnika ON Silnik.IdTypSilnika = TypSilnika.IdTypSilnika
    GROUP BY TypSilnika.TypSilnika;

-- Podzapytania (x2)

SELECT marka, moc, momentObrotowy, TypSilnika FROM Samochod
    INNER JOIN Silnik ON Samochod.Silnik_IdSilnik = Silnik.IdSilnik
    INNER JOIN TypSilnika a ON Silnik.IdTypSilnika = a.IdTypSilnika
    WHERE moc = (SELECT MAX(moc) FROM Samochod
    INNER JOIN Silnik ON Samochod.Silnik_IdSilnik = Silnik.IdSilnik
    INNER JOIN TypSilnika b ON Silnik.IdTypSilnika = b.IdTypSilnika
    WHERE a.IdTypSilnika = b.IdTypSilnika);

SELECT (imie || ' ' || nazwisko) AS "nadzorca nad nadzorcami" FROM osoba INNER JOIN pracownik a ON IdOsoba = IdPracownik
    WHERE NOT EXISTS (SELECT * FROM osoba INNER JOIN pracownik b ON b.IdPracownik = IdOsoba
    WHERE b.IdPracownik = a.IDPRACOWNIKNADZORUJACY);

-- Zapytania z wyk³adów adv. (x2)

SELECT a.imie || ' ' || a.nazwisko AS "Imie i nazwisko", SUM(Naleznosc) AS "Wygenerowany zarobek dla firmy"
    FROM Wypozyczanie
    INNER JOIN Pracownik ON Wypozyczanie.IdPracownik = Pracownik.IdPracownik
    INNER JOIN KLIENT ON Klient.IdKlient = Wypozyczanie.IdKlient
    INNER JOIN Osoba a ON a.IdOsoba = Pracownik.IdPracownik
    GROUP BY CUBE(a.imie || ' ' || a.nazwisko)
    ORDER BY a.imie || ' ' || a.nazwisko;

SELECT	(a.imie || ' ' || a.nazwisko) AS imie,
       SUM(Naleznosc) OVER ( PARTITION BY a.imie ) AS zarobek,
       (ROUND(100 * SUM(Naleznosc) OVER ( PARTITION BY a.imie ) /Sum(Naleznosc) OVER ( PARTITION BY null ))) AS "PROCENTOWO NA TLE FIRMY"
    FROM Wypozyczanie
    INNER JOIN Pracownik ON Wypozyczanie.IdPracownik = Pracownik.IdPracownik
    INNER JOIN KLIENT ON Klient.IdKlient = Wypozyczanie.IdKlient
    INNER JOIN Osoba a ON a.IdOsoba = Pracownik.IdPracownik;



/*

-- DROP
-- foreign keys
ALTER TABLE Klient
    DROP CONSTRAINT Klient_Osoba;

ALTER TABLE Pracownik
    DROP CONSTRAINT Pracownik_Osoba;

ALTER TABLE Pracownik
    DROP CONSTRAINT Pracownik_Pracownik;

ALTER TABLE Pracownik
    DROP CONSTRAINT Pracownik_Wypozyczalnia;

ALTER TABLE Samochod
    DROP CONSTRAINT Samochod_Silnik;

ALTER TABLE Samochod
    DROP CONSTRAINT Samochod_Wypozyczalnia;

ALTER TABLE Silnik
    DROP CONSTRAINT Silnik_TypSilnika;

ALTER TABLE Wlasciciel
    DROP CONSTRAINT Wlasciciel_Osoba;

ALTER TABLE Wypozyczalnia
    DROP CONSTRAINT Wypozyczalnia_Wlasciciel;

ALTER TABLE Wypozyczanie
    DROP CONSTRAINT Wypozyczanie_Klient;

ALTER TABLE Wypozyczanie
    DROP CONSTRAINT Wypozyczanie_Pracownik;

ALTER TABLE Wypozyczanie
    DROP CONSTRAINT Wypozyczanie_Samochod;

-- tables
DROP TABLE Klient;

DROP TABLE Osoba;

DROP TABLE Pracownik;

DROP TABLE Samochod;

DROP TABLE Silnik;

DROP TABLE TypSilnika;

DROP TABLE Wlasciciel;

DROP TABLE Wypozyczalnia;

DROP TABLE Wypozyczanie;

-- End of file.

 */



