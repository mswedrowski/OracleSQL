ALTER SESSION SET NLS_DATE_FORMAT='YYYY-MM-DD';

CREATE TABLE Bandy
    (nr_bandy NUMBER(2)CONSTRAINT bd_nr_pk PRIMARY KEY,
     nazwa VARCHAR2(20)CONSTRAINT bd_nz_nn NOT NULL,
     teren VARCHAR2(15)CONSTRAINT bd_trn_uq UNIQUE,
     szef_bandy VARCHAR(15) CONSTRAINT bd_sb_fk REFERENCES Kocury(pseudo));
     
    
CREATE TABLE Funkcje
    ( funkcja VARCHAR2(10)CONSTRAINT fc_fc_pk PRIMARY KEY,
     min_myszy NUMBER(3)CONSTRAINT fc_mimy_ck CHECK(min_myszy>5),
     max_myszy NUMBER(3)CONSTRAINT fc_mxmy_ck CHECK(200> max_myszy),
     CONSTRAINT f_maxmin CHECK (max_myszy >= min_myszy));
     
CREATE TABLE Wrogowie
    ( imie_wroga VARCHAR2(15) CONSTRAINT wg_im_pk PRIMARY KEY,
     stopien_wrogosci NUMBER(2) CONSTRAINT wg_sw_ck CHECK(stopien_wrogosci<10 AND stopien_wrogosci>0),
     gatunek VARCHAR2(15),
     lapowka VARCHAR2(20));
     
CREATE TABLE Kocury
    ( imie VARCHAR2(15) CONSTRAINT kc_im_nn NOT NULL,
     plec VARCHAR2(1) CONSTRAINT kc_pl_ck CHECK(plec IN('M','D')),
     pseudo VARCHAR2(15) CONSTRAINT kc_ps_pk PRIMARY KEY,
     funkcja VARCHAR(10) CONSTRAINT kc_fc_fk REFERENCES Funkcje(funkcja),
     szef VARCHAR2(15) CONSTRAINT kc_sz_fk REFERENCES Kocury(pseudo),
     w_stadku_od DATE DEFAULT SYSDATE,
     przydzial_myszy NUMBER(3),
     myszy_extra NUMBER(3),
     nr_bandy NUMBER(2) CONSTRAINT kc_nb_fk REFERENCES Bandy(nr_bandy));

ALTER TABLE Bandy ADD CONSTRAINT bd_szbd_fk FOREIGN KEY(szef_bandy) REFERENCES Kocury(pseudo);

CREATE TABLE Wrogowie_Kocurow
    (pseudo VARCHAR2(15) CONSTRAINT wk_ps_fk REFERENCES Kocury(pseudo),
     imie_wroga VARCHAR2(15) CONSTRAINT wk_iw_fk REFERENCES WROGOWIE (imie_wroga),
     data_incydentu DATE CONSTRAINT wk_di_nn NOT NULL,
     opis_incydentu VARCHAR(50),
     CONSTRAINT wg_pk PRIMARY KEY(pseudo,imie_wroga));

INSERT INTO Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy)
VALUES 
('JACEK','M','PLACEK','LOWCZY','LYSY','2008-12-01',67,NULL,2);




INSERT ALL
    INTO Funkcje(funkcja,min_myszy,max_myszy) VALUES('SZEFUNIO',90,110)
    INTO Funkcje(funkcja,min_myszy,max_myszy) VALUES('BANDZIOR',70,90)
    INTO Funkcje(funkcja,min_myszy,max_myszy) VALUES('LOWCZY',60,70)
    INTO Funkcje(funkcja,min_myszy,max_myszy) VALUES('LAPACZ',50,60)
    INTO Funkcje(funkcja,min_myszy,max_myszy) VALUES('KOT',40,50)
    INTO Funkcje(funkcja,min_myszy,max_myszy) VALUES('MILUSIA',20,30)
    INTO Funkcje(funkcja,min_myszy,max_myszy) VALUES('DZIELCZY',45,55)
    INTO Funkcje(funkcja,min_myszy,max_myszy) VALUES('HONOROWA',6,25)
SELECT * FROM DUAL;


INSERT ALL
    INTO Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('JACEK','M','PLACEK','LOWCZY','LYSY','2008-12-01',67,NULL,2)
    INTO Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('BARI','M','RURA','LAPACZ','LYSY','2009-09-01',56,NULL,2)
    INTO Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('MICKA','D','LOLA','MILUSIA','TYGRYS','2009-10-14',25,47,1)
    INTO Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('LUCEK','M','ZERO','KOT','KURKA','2010-03-01',43,NULL,3)
    INTO Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('SONIA','D','PUSZYSTA','MILUSIA','ZOMBI','2010-11-18',20,35,3)
    INTO Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('LATKA','D','UCHO','KOT','RAFA','2011-01-01',40,NULL,4)
    INTO Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('DUDEK','M','MALY','KOT','RAFA','2011-05-15',40,NULL,4)
    INTO Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('MRUCZEK','M','TYGRYS','SZEFUNIO',NULL,'2002-01-01',103,33,1)
    INTO Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('CHYTRY','M','BOLEK','DZIELCZY','TYGRYS','2002-05-05',50,NULL,1)
    INTO Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('KOREK','M','ZOMBI','BANDZIOR','TYGRYS','2004-03-16',75,13,3)
    INTO Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('BOLEK','M','LYSY','BANDZIOR','TYGRYS','2006-08-15',72,21,2)
    INTO Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('ZUZIA','D','SZYBKA','LOWCZY','LYSY','2006-07-21',65,NULL,2)
    INTO Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('RUDA','D','MALA','MILUSIA','TYGRYS','2006-09-17',22,42,1)
    INTO Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('PUCEK','M','RAFA','LOWCZY','TYGRYS','2006-10-15',65,NULL,4)
    INTO Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('PUNIA','D','KURKA','LOWCZY','ZOMBI','2008-01-01',61,NULL,3)
    INTO Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('BELA','D','LASKA','MILUSIA','LYSY','2008-02-01',24,28,2)
    INTO Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('KSAWERY','M','MAN','LAPACZ','RAFA','2008-07-12',51,NULL,4)
    INTO Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('MELA','D','DAMA','LAPACZ','RAFA','2008-11-01',51,NULL,4)
SELECT * FROM DUAL;

INSERT ALL
    INTO Bandy(nr_bandy,nazwa,teren,szef_bandy) VALUES (1,'SZEFOSTWO','CALOSC','TYGRYS')
    INTO Bandy(nr_bandy,nazwa,teren,szef_bandy) VALUES (2,'CZARNI RYCERZE','POLE','LYSY')
    INTO Bandy(nr_bandy,nazwa,teren,szef_bandy) VALUES (3,'BIALI LOWCY','SAD','ZOMBI')
    INTO Bandy(nr_bandy,nazwa,teren,szef_bandy) VALUES (4,'LACIACI MYSLIWI','GORKA','RAFA')
    INTO Bandy(nr_bandy,nazwa,teren,szef_bandy) VALUES (5,'ROCKERSI','ZAGRODA',NULL)
SELECT * FROM DUAL;

INSERT ALL
    INTO Wrogowie(imie_wroga,stopien_wrogosci,gatunek,lapowka) VALUES('KAZIO',10,'CZLOWIEK','FLASZKA')
    INTO Wrogowie(imie_wroga,stopien_wrogosci,gatunek,lapowka) VALUES('GLUPIA ZOSKA',1,'CZLOWIEK','KORALIK')
    INTO Wrogowie(imie_wroga,stopien_wrogosci,gatunek,lapowka) VALUES('SWAWOLNY DYZIO',7,'CZLOWIEK','GUMA DO ZUCIA')
    INTO Wrogowie(imie_wroga,stopien_wrogosci,gatunek,lapowka) VALUES('BUREK',4,'PIES','KOSC')
    INTO Wrogowie(imie_wroga,stopien_wrogosci,gatunek,lapowka) VALUES('DZIKI BILL',10,'PIES',NULL)
    INTO Wrogowie(imie_wroga,stopien_wrogosci,gatunek,lapowka) VALUES('REKSIO',2,'PIES','KOSC')
    INTO Wrogowie(imie_wroga,stopien_wrogosci,gatunek,lapowka) VALUES('BETHOVEN',1,'PIES','PEDIGRIPALL')
    INTO Wrogowie(imie_wroga,stopien_wrogosci,gatunek,lapowka) VALUES('CHYTRUSEK',5,'LIS','KURCZAK')
    INTO Wrogowie(imie_wroga,stopien_wrogosci,gatunek,lapowka) VALUES('SMUKLA',1,'SOSNA',NULL)
    INTO Wrogowie(imie_wroga,stopien_wrogosci,gatunek,lapowka) VALUES('BAZYLI',3,'KOGUT','KURA DO STADA')
SELECT * FROM DUAL;

INSERT ALL
    INTO Wrogowie_Kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES('TYGRYS','KAZIO','2004-10-13','USILOWAL NABIC NA WIDLY')
    INTO Wrogowie_Kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES('ZOMBI','SWAWOLNY DYZIO','2005-03-07','WYBIL OKO Z PROCY')
    INTO Wrogowie_Kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES('BOLEK','KAZIO','2005-03-29','POSZCZUL BURKIEM')
    INTO Wrogowie_Kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES('SZYBKA','GLUPIA ZOSKA','2006-09-12','UZYLA KOTA JAKO SCIERKI')
    INTO Wrogowie_Kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES('MALA','CHYTRUSEK','2007-03-07','ZALECAL SIE')
    INTO Wrogowie_Kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES('TYGRYS','DZIKI BILL','2007-06-12','USILOWAL POZBAWIC ZYCIA')
    INTO Wrogowie_Kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES('BOLEK','DZIKI BILL','2007-11-10','ODGRYZL UCHO')
    INTO Wrogowie_Kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES('LASKA','DZIKI BILL','2008-12-12','POGRYZL ZE LEDWO SIE WYLIZALA')
    INTO Wrogowie_Kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES('LASKA','KAZIO','2009-01-07','ZLAPAL ZA OGON I ZROBIL WIATRAK')
    INTO Wrogowie_Kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES('DAMA','KAZIO','2009-02-07','CHCIAL OBEDRZEC ZE SKORY')
    INTO Wrogowie_Kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES('MAN','REKSIO','2009-04-14','WYJATKOWO NIEGRZECZNIE OBSZCZEKAL')
    INTO Wrogowie_Kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES('LYSY','BETHOVEN','2009-05-11','NIE PODZIELIL SIE SWOJA KASZA')
    INTO Wrogowie_Kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES('RURA','DZIKI BILL','2009-09-03','ODGRYZL OGON')
    INTO Wrogowie_Kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES('PLACEK','BAZYLI','2010-07-12','DZIOBIAC UNIEMOZLIWIL PODEBRANIE KURCZAKA')
    INTO Wrogowie_Kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES('PUSZYSTA','SMUKLA','2010-11-19','OBRZUCILA SZYSZKAMI')
    INTO Wrogowie_Kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES('KURKA','BUREK','2010-12-14','POGONIL')
    INTO Wrogowie_Kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES('MALY','CHYTRUSEK','2011-07-13','PODEBRAL PODEBRANE JAJKA')
    INTO Wrogowie_Kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES('UCHO','SWAWOLNY DYZIO','2011-07-14','OBRZUCIL KAMIENIAMI')
SELECT * FROM DUAL;



-----1-----
SELECT imie_wroga "WROG",opis_incydentu "PRZEWINA" FROM WROGOWIE_KOCUROW WHERE DATA_INCYDENTU LIKE '2009%';

-----2-----
SELECT imie,funkcja,w_stadku_od "Z NAMI OD" FROM KOCURY WHERE plec = 'D' AND W_STADKU_OD BETWEEN '2005-09-01' AND '2007-07-31';

-----3-----
SELECT imie_wroga "WROG",gatunek,stopien_wrogosci "STOPIEN WROGOSCI" FROM Wrogowie WHERE lapowka IS NULL ORDER BY stopien_wrogosci;

-----4-----
SELECT imie || ' zwany ' || pseudo || ' (fun. ' || funkcja || ') lowi myszki w bandzie' || nr_bandy || ' od ' || w_stadku_od "WSZYSTKO O KOCURACH"
    FROM Kocury
        WHERE plec = 'M'
            ORDER BY w_stadku_od DESC, pseudo;

-----5-----
SELECT pseudo, regexp_replace(regexp_replace(pseudo, 'L', '%', 1, 1),'A', '#', 1, 1) "Po wymianie A na # oraz L na %"
    FROM Kocury
        WHERE pseudo LIKE '%L%' AND pseudo LIKE '%A%';
        
-----6-----
alter system set fixed_date = '2018-06-30';
SELECT imie,w_stadku_od "W stadku",ROUND((NVL(przydzial_myszy,0)*0.9)) "Zjadal",ADD_MONTHS(w_stadku_od,6) "Podwyzka",przydzial_myszy "Zjada"
    FROM Kocury
        WHERE(EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM w_stadku_od) >9 AND EXTRACT(MONTH FROM(w_stadku_od)) BETWEEN 3 AND 9)
        ORDER BY ROUND((NVL(przydzial_myszy,0)/1.1)) DESC;
-----7-----
SELECT imie,NVL(przydzial_myszy,0)*3 "Myszy kwartalnie",NVL(myszy_extra,0) *3 "Kwartalne dodatki"
    FROM Kocury
        WHERE(NVL(przydzial_myszy,0)>2*NVL(myszy_extra,0) AND NVL(przydzial_myszy,0)>55)
            ORDER BY NVL(przydzial_myszy,0) DESC;
-----8-----
SELECT imie,DECODE((NVL(przydzial_myszy, 0) + NVL(myszy_extra, 0)) * 12,TO_CHAR(660),'LIMIT',
            CASE
                WHEN (NVL(przydzial_myszy, 0) + NVL(myszy_extra, 0)) * 12 > THEN ((NVL(przydzial_myszy, 0) + NVL(myszy_extra, 0)) * 12)
                ELSE 'Ponizej 660' END 
                "Zjada rocznie"
    FROM Kocury
        ORDER BY imie;
--CZY TO NIE DZIALA PRZEZ TO ZE CASE NIE JEST FUNKCJA??????????--

        
SELECT imie,
  CASE
      WHEN (NVL(przydzial_myszy, 0) + NVL(myszy_extra, 0)) * 12 = 660
        THEN 'LIMIT'
      WHEN (NVL(przydzial_myszy, 0) + NVL(myszy_extra, 0)) * 12 >
        THEN
          TO_CHAR((NVL(przydzial_myszy, 0) + NVL(myszy_extra, 0)) * 12)
      ELSE 'Ponizej 660'
      END 
      "Zjada rocznie"
    FROM Kocury
        ORDER BY imie;
        
-----9-----

alter system set fixed_date = '2018-09-27';

SELECT SYSDATE,
   LAST_DAY(SYSDATE)-7 "Last -7",
   NEXT_DAY(LAST_DAY(SYSDATE),3) "next wen",
   NEXT_DAY(LAST_DAY(ADD_MONTHS(SYSDATE, 1))-7,3)
 --  NEXT_DAY(LAST_DAY(ADD_MONTHS(SYSDATE),1)-7,3) "ADD MONTH"
   FROM DUAL;


SELECT pseudo, (w_stadku_od) "W Stadku",(
    CASE
        WHEN EXTRACT(DAY FROM w_stadku_od)<=15
            THEN 
                CASE
                    WHEN NEXT_DAY(LAST_DAY(SYSDATE)-7,3) < SYSDATE
                        THEN NEXT_DAY(LAST_DAY(ADD_MONTHS(SYSDATE, 1))-7,3)
                    ELSE
                        NEXT_DAY(LAST_DAY(SYSDATE)-7,3)
                END
            ELSE
                NEXT_DAY(LAST_DAY(ADD_MONTHS(SYSDATE, 1))-7,3)
    END)
    "WYPLATA"
    FROM Kocury
    ORDER BY w_stadku_od;
    
    
-----10-----

    SELECT pseudo || ' - ' || DECODE(COUNT(*),1, 'Unikalny', 'Nieunikalny')  "Unikalnosc atr. PSEUDO"
     FROM Kocury
        GROUP BY pseudo;
    
    SELECT szef || ' - ' || DECODE(COUNT(*),1, 'Unikalny', 'Nieunikalny')  "Unikalnosc atr. PSEUDO"
     FROM Kocury
        WHERE szef IS NOT NULL
            GROUP BY szef;
    
-----11-----
    SELECT pseudo "Pseudonim",COUNT(*) "Liczba wrogow"
        FROM WROGOWIE_KOCUROW
            GROUP BY pseudo
                HAVING COUNT(*)>1;
    
-----12-----
    SELECT 'Liczba kotow =' || COUNT(*) || ' lowi jako ' || funkcja || ' i zjada max. ' || MAX(NVL(przydzial_myszy,0)+NVL(myszy_extra,0)) || ' myszy miesiecznie ' " "
        FROM Kocury
            WHERE funkcja <> 'SZEFUNIO' AND PLEC <> 'M'
                GROUP BY funkcja
                    HAVING AVG(NVL(przydzial_myszy, 0) + NVL(myszy_extra, 0)) > 50;
    
-----13-----
    SELECT nr_bandy,plec,MIN(NVL(przydzial_myszy,0)) "Minimalny przydzial"
     FROM Kocury
        GROUP BY nr_bandy, plec;

-----14-----
    SELECT level,pseudo "Pseudonim",funkcja,nr_bandy
        FROM Kocury
            WHERE plec='M'
            CONNECT BY PRIOR pseudo=szef
            START WITH funkcja='BANDZIOR'
                ORDER BY nr_bandy,level;
    
-----15-----
    SELECT
        LPAD(level-1,(level-1)*4 +1,'===>') || '     ' || imie "Hierarchia",
    CASE
        WHEN szef IS NULL THEN 'Sam sobie panem' 
        ELSE szef END "Pseudo szefa",
        funkcja
            FROM Kocury
                WHERE myszy_extra IS NOT NULL
                    CONNECT BY PRIOR pseudo=szef
                    START WITH szef IS NULL;
    
-----16-----
    alter system set fixed_date = '2018-06-20';
    SELECT
        LPAD(' ',4*(level-1)+1,' ') || pseudo "Droga sluzbowa"
            FROM Kocury
                CONNECT BY PRIOR szef=pseudo
                START WITH SZEF IS NOT NULL AND MONTHS_BETWEEN(SYSDATE, w_stadku_od)>108 AND plec='M' AND myszy_extra IS NULL;
    
    
-----LISTA 2 ------

-----17-----
SELECT K.imie "POLUJE W POLU",K.przydzial_myszy "PRZYDZIAL MYSZY", B.nazwa "BANDA"
FROM KOCURY K JOIN BANDY B ON K.NR_BANDY = B.NR_BANDY
WHERE (TEREN='CALOSC' OR TEREN='POLE') AND PRZYDZIAL_MYSZY>50
ORDER BY przydzial_myszy DESC;

-----18-----
SELECT K1.IMIE,K1.W_STADKU_OD "POLUJE OD"
FROM KOCURY K1, KOCURY K2
WHERE K2.IMIE='JACEK' AND K1.W_STADKU_OD<K2.W_STADKU_OD
ORDER BY K1.W_STADKU_OD DESC;

------19a----- 
SELECT K1.imie "IMIE",K1.funkcja,
                        CASE 
                        WHEN(K2.IMIE IS NOT NULL) 
                        THEN K2.IMIE
                        ELSE ' ' END "Szef 1",
                            CASE
                            WHEN(K3.IMIE IS NOT NULL) 
                            THEN K3.IMIE
                            ELSE ' ' END "Szef 2",
                                CASE
                                WHEN(K4.IMIE IS NOT NULL)
                                THEN K4.IMIE
                                ELSE ' ' END "Szef 3"
    FROM KOCURY K1 LEFT JOIN KOCURY K2 ON K1.szef = K2.pseudo
        LEFT JOIN KOCURY K3 ON K2.szef=K3.pseudo
            LEFT JOIN KOCURY K4 ON K3.szef=K4.pseudo
WHERE (K1.funkcja='MILUSIA' OR K1.funkcja='KOT');



-----20-----
SELECT imie "Imie kotki", nazwa "Nazwa bandy", imie_wroga,stopien_wrogosci,data_incydentu
    FROM Kocury NATURAL JOIN BANDY B NATURAL JOIN Wrogowie_Kocurow NATURAL JOIN WROGOWIE
    WHERE plec='D' AND data_incydentu>DATE '2007-01-01'
    ORDER BY imie;
    
-----21-----
SELECT nazwa, COUNT(DISTINCT pseudo)
    FROM Bandy NATURAL JOIN Kocury NATURAL JOIN Wrogowie_Kocurow
    GROUP BY nazwa;
    
-----22-----
SELECT K.FUNKCJA "FUNKCJA", K.PSEUDO "PSEUDONIM KOTA",COUNT(*) "LICZBA WROGOW"
    FROM Kocury K JOIN Wrogowie_Kocurow WK ON K.PSEUDO=WK.PSEUDO
    GROUP BY K.PSEUDO,K.FUNKCJA
    HAVING COUNT(*)>1;
    
    
SELECT *
FROM KOCURY K
  JOIN WROGOWIE_KOCUROW WK ON K.PSEUDO = WK.PSEUDO;
  
  
-----23-----
SELECT imie,(przydzial_myszy+NVL(myszy_extra,0))*12 "DAWKA ROCZNA", 'PONIZEJ 864' "DAWKA" 
    FROM KOCURY
    WHERE myszy_extra IS NOT NULL AND(przydzial_myszy+NVL(myszy_extra,0))*12<864
UNION
SELECT imie,(przydzial_myszy+NVL(myszy_extra,0))*12 "DAWKA ROCZNA", '864' "DAWKA" 
    FROM KOCURY
    WHERE myszy_extra IS NOT NULL AND (przydzial_myszy+NVL(myszy_extra,0))*12=864
UNION
SELECT imie,(przydzial_myszy+NVL(myszy_extra,0))*12 "DAWKA ROCZNA", 'POWYZEJ 864' "DAWKA" 
    FROM KOCURY
    WHERE myszy_extra IS NOT NULL AND (przydzial_myszy+NVL(myszy_extra,0))*12>864
ORDER BY "DAWKA ROCZNA" DESC;

-----24a-----
SELECT  B.nr_bandy,B.nazwa,B.teren
    FROM Bandy B LEFT JOIN KOCURY K ON B.nr_bandy=K.nr_bandy
        GROUP BY B.nazwa, B.nr_bandy, B.teren
            HAVING count(K.pseudo)<1;
---zapytac o count(*)--

-----24b-----
SELECT  B.nr_bandy,B.nazwa,B.teren
    FROM Bandy B
        WHERE NOT EXISTS (SELECT nr_bandy FROM Kocury WHERE nr_bandy=B.nr_bandy);


-----25-----
SELECT K.IMIE, K.FUNKCJA, K.PRZYDZIAL_MYSZY
    FROM Kocury K
    WHERE  K.przydzial_myszy >= 3*(SELECT PRZYDZIAL_MYSZY 
                                    FROM  
                                        (SELECT przydzial_myszy 
                                            FROM Kocury K2 NATURAL JOIN BANDY B 
                                                WHERE K2.FUNKCJA='MILUSIA' AND B.TEREN IN('SAD','CALOSC')
                                                    ORDER BY przydzial_myszy DESC)
                                    WHERE  rownum='1');







-----26-----

SELECT "Funkcja","Srednio najw. i najm. myszy"
    FROM 
        ( SELECT 
        K.FUNKCJA "Funkcja",
        
        ROUND(AVG(NVL(K.PRZYDZIAL_MYSZY,0) + NVL(K.MYSZY_EXTRA, 0))) "Srednio najw. i najm. myszy",
        
        RANK() OVER
            (ORDER BY AVG(NVL(K.PRZYDZIAL_MYSZY,0) + NVL(K.MYSZY_EXTRA, 0)) DESC) AS RANKING_DESC,
            
        RANK() OVER
            (ORDER BY AVG(NVL(K.PRZYDZIAL_MYSZY,0) + NVL(K.MYSZY_EXTRA, 0)) ASC) AS RANKING_ASC
        
        FROM KOCURY K
        GROUP BY K.FUNKCJA
        HAVING K.FUNKCJA !='SZEFUNIO'
        )
    WHERE RANKING_DESC=1 OR RANKING_ASC=1;
    
    
-----27-----

--A--

SELECT K.PSEUDO, NVL(K.PRZYDZIAL_MYSZY, 0) + NVL(K.MYSZY_EXTRA, 0) "ZJADA"
    FROM KOCURY K
    WHERE 6> 
            (SELECT COUNT(*)
                FROM KOCURY K2
                    WHERE NVL(K.PRZYDZIAL_MYSZY, 0) + NVL(K.MYSZY_EXTRA, 0) < NVL(K2.PRZYDZIAL_MYSZY, 0) + NVL(K2.MYSZY_EXTRA, 0))
    ORDER BY ZJADA DESC;
    
--B--

SELECT K2.PSEUDO, NVL(K2.PRZYDZIAL_MYSZY, 0) + NVL(K2.MYSZY_EXTRA, 0) "ZJADA"
    FROM KOCURY K2
    WHERE NVL(K2.PRZYDZIAL_MYSZY, 0) + NVL(K2.MYSZY_EXTRA, 0) IN
        (SELECT *
        FROM
            (
                SELECT NVL(K.PRZYDZIAL_MYSZY, 0) + NVL(K.MYSZY_EXTRA, 0) "ZJADA"
                FROM KOCURY K
                ORDER BY  (NVL(K.PRZYDZIAL_MYSZY, 0) + NVL(K.MYSZY_EXTRA, 0)) DESC)
        WHERE ROWNUM <= 6);
    

--C--

SELECT K1.pseudo, NVL(K1.PRZYDZIAL_MYSZY, 0) + NVL(K1.MYSZY_EXTRA, 0) "ZJADA"
    FROM KOCURY K1 LEFT JOIN KOCURY K2 ON  NVL(K2.PRZYDZIAL_MYSZY, 0) + NVL(K2.MYSZY_EXTRA, 0) > NVL(K1.PRZYDZIAL_MYSZY, 0) + NVL(K1.MYSZY_EXTRA, 0)
    GROUP BY K1.PSEUDO,NVL(K1.PRZYDZIAL_MYSZY,0) + NVL(K1.MYSZY_EXTRA, 0)
    HAVING COUNT(*)<=6
    ORDER BY ZJADA DESC;
    
--D--

SELECT PSEUDO,ZJADA
    FROM  
        (SELECT K1.pseudo "PSEUDO", NVL(K1.PRZYDZIAL_MYSZY, 0) + NVL(K1.MYSZY_EXTRA, 0) "ZJADA", 
                            DENSE_RANK()
                            OVER
                            (
                               ORDER BY NVL(K1.PRZYDZIAL_MYSZY,0) + NVL(K1.MYSZY_EXTRA, 0) DESC 
                            ) "RANK"
                            
        FROM KOCURY K1)
        WHERE RANK <= &n
        ;











SELECT Sum(Count(K2.PSEUDO))
                                                                FROM Kocury K2
                                                                    WHERE K2.funkcja!='SZEFUNIO'
                                                                        GROUP BY K2.przydzial_myszy;




SELECT* FROM(SELECT * 
                FROM
                    (SELECT *
                        FROM KOCURY K3
                                WHERE K3.funkcja!='SZEFUNIO'
                                ORDER BY K3.PRZYDZIAL_MYSZY)
                WHERE ROWNUM=1);

-----28-----

    SELECT CAST(EXTRACT(YEAR FROM W_STADKU_OD) AS VARCHAR2(50)) "ROK"  ,COUNT(*) "LICZBA WYSTAPIEN"
    FROM KOCURY
    GROUP BY EXTRACT(YEAR FROM W_STADKU_OD)
    HAVING COUNT(*) IN  
        (   
            (SELECT *
                FROM
                  (SELECT COUNT(*)
                   FROM KOCURY
                   GROUP BY EXTRACT(YEAR FROM W_STADKU_OD)
                   HAVING    COUNT(*) > 
                   (
                     SELECT AVG(COUNT(EXTRACT(YEAR FROM W_STADKU_OD)))
                     FROM KOCURY
                     GROUP BY EXTRACT(YEAR FROM W_STADKU_OD)
                   )
                   ORDER BY COUNT(*))
                   WHERE ROWNUM=1
            )
              ,
            (
              SELECT *
                FROM
                  (
                    SELECT COUNT(*)
                   FROM KOCURY
                   GROUP BY EXTRACT(YEAR FROM W_STADKU_OD)
                   HAVING COUNT(*) < 
                   (
                     SELECT AVG(COUNT(EXTRACT(YEAR FROM W_STADKU_OD)))
                     FROM KOCURY
                     GROUP BY EXTRACT(YEAR FROM W_STADKU_OD)
                   )
                   ORDER BY COUNT(*) DESC)
                   WHERE ROWNUM=1
            )
        )
        UNION
            SELECT 'SREDNIA',ROUND(AVG(COUNT(EXTRACT(YEAR FROM W_STADKU_OD))),5)
            FROM KOCURY
            GROUP BY EXTRACT(YEAR FROM W_STADKU_OD)
    ORDER BY 2;

-----29-----

--A--

SELECT K1.IMIE,K1.NR_BANDY "NR BANDY",(NVL(K1.PRZYDZIAL_MYSZY,0)+NVL(K1.MYSZY_EXTRA,0)) "ZJADA",AVG((NVL(K2.PRZYDZIAL_MYSZY,0)+NVL(K2.MYSZY_EXTRA,0))) "SREDNIA BANDY"
    FROM KOCURY K1 JOIN KOCURY K2 ON K1.NR_BANDY=K2.NR_BANDY
    WHERE K1.PLEC='M'
    GROUP BY K1.PSEUDO,K1.IMIE,K1.NR_BANDY,(NVL(K1.PRZYDZIAL_MYSZY,0)+NVL(K1.MYSZY_EXTRA,0))
    HAVING (NVL(K1.PRZYDZIAL_MYSZY,0)+NVL(K1.MYSZY_EXTRA,0)) < AVG((NVL(K2.PRZYDZIAL_MYSZY,0)+NVL(K2.MYSZY_EXTRA,0)))
    ORDER BY 2 DESC;
    
--B--

    SELECT K1.IMIE,K1.NR_BANDY "NR BANDY",(NVL(K1.PRZYDZIAL_MYSZY,0)+NVL(K1.MYSZY_EXTRA,0)) "ZJADA",K3."SREDNIA" "SREDNIA BANDY"
      FROM KOCURY K1 JOIN 
            ( SELECT K2.NR_BANDY,AVG((NVL(K2.PRZYDZIAL_MYSZY,0)+NVL(K2.MYSZY_EXTRA,0))) "SREDNIA"
                FROM KOCURY K2
                GROUP BY K2.NR_BANDY
            ) K3
                ON K1.NR_BANDY=K3.NR_BANDY
    WHERE K1.PLEC='M' AND (NVL(K1.PRZYDZIAL_MYSZY,0)+NVL(K1.MYSZY_EXTRA,0))< K3."SREDNIA";
    
--C--

SELECT K1.IMIE,K1.NR_BANDY, (NVL(K1.PRZYDZIAL_MYSZY,0)+NVL(K1.MYSZY_EXTRA,0))"ZJADA",
                                                                                
                                                                           (
                                                                            SELECT AVG((NVL(K3.PRZYDZIAL_MYSZY,0)+NVL(K3.MYSZY_EXTRA,0)))
                                                                                FROM KOCURY K3
                                                                                WHERE K1.NR_BANDY=K3.NR_BANDY
                                                                            ) " SREDNIA BANDY"
                                                                                    
    FROM KOCURY K1
    WHERE K1.PLEC='M' AND (NVL(K1.PRZYDZIAL_MYSZY,0)+NVL(K1.MYSZY_EXTRA,0)) < 
                                                                            (
                                                                            SELECT AVG((NVL(K2.PRZYDZIAL_MYSZY,0)+NVL(K2.MYSZY_EXTRA,0)))
                                                                                FROM KOCURY K2
                                                                                WHERE K1.NR_BANDY=K2.NR_BANDY
                                                                            ) ORDER BY 2 DESC;
-----30-----


SELECT K1.IMIE,K1.W_STADKU_OD || '<---- NAJMLODSZY STAZEM W BANDZIE ' || B.NAZWA  "WSTAPIL DO STADKA" 
    FROM KOCURY K1 JOIN BANDY B ON K1.NR_BANDY=B.NR_BANDY
    WHERE K1.W_STADKU_OD = 
                            (SELECT MAX(K2.W_STADKU_OD)
                                FROM KOCURY K2
                                WHERE K1.NR_BANDY=K2.NR_BANDY
                                GROUP BY K2.NR_BANDY)

UNION

SELECT K1.IMIE,K1.W_STADKU_OD || '<---- NAJSTARSZY STAZEM W BANDZIE ' || B.NAZWA  "WSTAPIL DO STADKA" 
    FROM KOCURY K1 JOIN BANDY B ON K1.NR_BANDY=B.NR_BANDY
    WHERE K1.W_STADKU_OD = 
                            (SELECT MIN(K2.W_STADKU_OD)
                                FROM KOCURY K2
                                WHERE K1.NR_BANDY=K2.NR_BANDY
                                GROUP BY K2.NR_BANDY)
                                
UNION

SELECT K1.IMIE,CAST(K1.W_STADKU_OD AS VARCHAR(50)) 
    FROM KOCURY K1 JOIN BANDY B ON K1.NR_BANDY=B.NR_BANDY
MINUS
(
SELECT K1.IMIE,CAST(K1.W_STADKU_OD AS VARCHAR(50)) 
    FROM KOCURY K1 JOIN BANDY B ON K1.NR_BANDY=B.NR_BANDY
    WHERE K1.W_STADKU_OD = 
                            (SELECT MAX(K2.W_STADKU_OD)
                                FROM KOCURY K2
                                WHERE K1.NR_BANDY=K2.NR_BANDY
                                GROUP BY K2.NR_BANDY)

UNION

SELECT K1.IMIE,CAST(K1.W_STADKU_OD AS VARCHAR(50)) 
    FROM KOCURY K1 JOIN BANDY B ON K1.NR_BANDY=B.NR_BANDY
    WHERE K1.W_STADKU_OD = 
                            (SELECT MIN(K2.W_STADKU_OD)
                                FROM KOCURY K2
                                WHERE K1.NR_BANDY=K2.NR_BANDY
                                GROUP BY K2.NR_BANDY));
                                
                                
-----31-----

    CREATE VIEW SPOZYCIE AS
    SELECT NAZWA,AVG(NVL(PRZYDZIAL_MYSZY, 0)) "SRE_SPOZ",MAX(NVL(PRZYDZIAL_MYSZY, 0)) "MAX_SPOZ",MIN(NVL(PRZYDZIAL_MYSZY, 0))"MIN_SPOZ",COUNT(*)"KOTY",COUNT(MYSZY_EXTRA)"KOTY_Z_DOD"
    FROM KOCURY NATURAL JOIN BANDY
    GROUP BY NAZWA;
    
    
    SELECT K1.PSEDUO "PSEUDONIM",K1.IMIE,K1.FUNKCJA,(NVL(K1.PRZYDZIAL_MYSZY, 0) + NVL(K1.MYSZY_EXTRA, 0))
    FROM KOCURY K1 NATURAL JOIN BANDY NATURAL JOIN SPOZYCIE;
    
    SELECT PSEUDO,IMIE,FUNKCJA,(NVL(PRZYDZIAL_MYSZY,0)+NVL(MYSZY_EXTRA,0)) "ZJADA",' OD ' ||MIN_SPOZ || ' DO ' || MAX_SPOZ "GRANICE SPOZYCIA",W_STADKU_OD "LOWI OD"
    FROM KOCURY NATURAL JOIN BANDY NATURAL JOIN SPOZYCIE
    WHERE PSEUDO='&PSEUDO';
    
    
-----32-----

CREATE VIEW PRZED AS
SELECT PSEUDO,PLEC,PRZYDZIAL_MYSZY,MYSZY_EXTRA
FROM
(
SELECT *
    FROM
       ( SELECT K1.PSEUDO,K1.PLEC,B.NAZWA,NVL(K1.PRZYDZIAL_MYSZY, 0)  "PRZYDZIAL_MYSZY", NVL(K1.MYSZY_EXTRA, 0)"MYSZY_EXTRA",
        RANK()
        OVER
            (ORDER BY K1.W_STADKU_OD)"RANK"
        FROM KOCURY K1 NATURAL JOIN BANDY B
        WHERE NAZWA IN ('CZARNI RYCERZE')
        )
    WHERE RANK<=3
UNION
SELECT *
    FROM
       ( SELECT K1.PSEUDO,K1.PLEC,B.NAZWA,NVL(K1.PRZYDZIAL_MYSZY, 0)  "PRZYDZIAL_MYSZY", NVL(K1.MYSZY_EXTRA, 0)"MYSZY_EXTRA",
        RANK()
        OVER
            (ORDER BY K1.W_STADKU_OD)"RANK"
        FROM KOCURY K1 NATURAL JOIN BANDY B
        WHERE NAZWA IN ('LACIACI MYSLIWI')
        )
    WHERE RANK<=3
);


SELECT * FROM PRZED; 
 
ROLLBACK;
    
UPDATE KOCURY K1
    SET K1.PRZYDZIAL_MYSZY= 
                        CASE
                            WHEN K1.PLEC='M'
                                THEN K1.PRZYDZIAL_MYSZY+10
                            ELSE
                                K1.PRZYDZIAL_MYSZY + 0.1*(
                                                    SELECT MIN(NVL(K2.PRZYDZIAL_MYSZY,0))
                                                    FROM KOCURY K2 
                                                    )
                            END,
        K1.MYSZY_EXTRA = NVL(K1.MYSZY_EXTRA,0) + (
                                            SELECT AVG(NVL(K2.MYSZY_EXTRA,0))
                                            FROM KOCURY K2
                                            WHERE K2.NR_BANDY=K1.NR_BANDY 
                                            ) * 0.15
WHERE K1.PSEUDO IN ( SELECT PSEUDO FROM PRZED);
--- ZAPYTAC O NVL MYSZY EXTRA - CZY CHODZI O NULL + LICZBA?


-----33-----

--A--

SELECT 
    CASE 
        WHEN PLEC='KOTKA' THEN ' '
        ELSE NAZWA
        END "NAZWA BANDY",
        "PLEC",
        "ILE",
        "SZEFUNIO",
        "BANDZIOR",
        "LOWCZY",
        "LAPACZ",
        "KOT",
        "MILUSIA",
        "DZIELCZY",
        "SUMA"
FROM
((SELECT 1 "UNION ORDER",    
    CAST(NAZWA AS VARCHAR(50)) "NAZWA",
    
    CASE
        WHEN PLEC='M' THEN 'KOCOR'
        ELSE 'KOTKA'
        END "PLEC",
        
    CAST(COUNT(*) AS VARCHAR(50)) "ILE",
    
    CAST(SUM(
        CASE 
            WHEN FUNKCJA='SZEFUNIO' THEN NVL(PRZYDZIAL_MYSZY, 0) + NVL(MYSZY_EXTRA, 0)
            ELSE 0
            END) AS VARCHAR(50))"SZEFUNIO",
    CAST(SUM(
        CASE 
            WHEN FUNKCJA='BANDZIOR' THEN NVL(PRZYDZIAL_MYSZY, 0) + NVL(MYSZY_EXTRA, 0)
            ELSE 0
            END)AS VARCHAR(50))"BANDZIOR",
    CAST(SUM(
        CASE 
            WHEN FUNKCJA='LOWCZY' THEN NVL(PRZYDZIAL_MYSZY, 0) + NVL(MYSZY_EXTRA, 0)
            ELSE 0
            END)AS VARCHAR(50))"LOWCZY",
    CAST(SUM(
        CASE 
            WHEN FUNKCJA='LAPACZ' THEN NVL(PRZYDZIAL_MYSZY, 0) + NVL(MYSZY_EXTRA, 0)
            ELSE 0
            END)AS VARCHAR(50))"LAPACZ",
    CAST(SUM(
        CASE 
            WHEN FUNKCJA='KOT' THEN NVL(PRZYDZIAL_MYSZY, 0) + NVL(MYSZY_EXTRA, 0)
            ELSE 0
            END)AS VARCHAR(50))"KOT",
    CAST(SUM(
        CASE 
            WHEN FUNKCJA='MILUSIA' THEN NVL(PRZYDZIAL_MYSZY, 0) + NVL(MYSZY_EXTRA, 0)
            ELSE 0
            END)AS VARCHAR(50))"MILUSIA",
    CAST(SUM(
        CASE 
            WHEN FUNKCJA='DZIELCZY' THEN NVL(PRZYDZIAL_MYSZY, 0) + NVL(MYSZY_EXTRA, 0)
            ELSE 0
            END)AS VARCHAR(50))"DZIELCZY",
    CAST(SUM(NVL(PRZYDZIAL_MYSZY, 0) + NVL(MYSZY_EXTRA, 0))AS VARCHAR(50)) "SUMA"
    
    
FROM KOCURY NATURAL JOIN BANDY
GROUP BY NAZWA,PLEC)
    
  UNION
  (SELECT
    2,
    '----------------',
    '------',
    '--------',
    '---------',
    '---------',
    '--------',
    '--------',
    '--------',
    '--------',
    '--------',
    '--------'
  FROM DUAL)
  
  UNION
  
  (SELECT
    3,
    'ZJADA RAZEM' "NAZWA",
    ' ' "PLEC",
    ' ' "ILE",
    CAST(SUM(
            CASE 
                WHEN FUNKCJA='SZEFUNIO' THEN NVL(PRZYDZIAL_MYSZY, 0) + NVL(MYSZY_EXTRA, 0)
                ELSE 0
                END)AS VARCHAR(50)) "SZEFUNIO",
   CAST(SUM(
            CASE 
                WHEN FUNKCJA='BANDZIOR' THEN NVL(PRZYDZIAL_MYSZY, 0) + NVL(MYSZY_EXTRA, 0)
                ELSE 0
                END)AS VARCHAR(50)) "BANDZIOR",
   CAST(SUM(
            CASE 
                WHEN FUNKCJA='LOWCZY' THEN NVL(PRZYDZIAL_MYSZY, 0) + NVL(MYSZY_EXTRA, 0)
                ELSE 0
                END)AS VARCHAR(50)) "LOWCZY",
   CAST(SUM(
            CASE 
                WHEN FUNKCJA='LAPACZ' THEN NVL(PRZYDZIAL_MYSZY, 0) + NVL(MYSZY_EXTRA, 0)
                ELSE 0
                END)AS VARCHAR(50)) "LAPACZ",
   CAST(SUM(
            CASE 
                WHEN FUNKCJA='KOT' THEN NVL(PRZYDZIAL_MYSZY, 0) + NVL(MYSZY_EXTRA, 0)
                ELSE 0
                END)AS VARCHAR(50)) "KOT",
   CAST(SUM(
            CASE 
                WHEN FUNKCJA='MILUSIA' THEN NVL(PRZYDZIAL_MYSZY, 0) + NVL(MYSZY_EXTRA, 0)
                ELSE 0
                END)AS VARCHAR(50)) "MILUSIA",
   CAST(SUM(
            CASE 
                WHEN FUNKCJA='DZIELCZY' THEN NVL(PRZYDZIAL_MYSZY, 0) + NVL(MYSZY_EXTRA, 0)
                ELSE 0
                END)AS VARCHAR(50)) "DZIELCZY",
       CAST(SUM(NVL(PRZYDZIAL_MYSZY, 0) + NVL(MYSZY_EXTRA, 0))AS VARCHAR(50)) "SUMA"                                 
    FROM KOCURY NATURAL JOIN BANDY)
    ORDER BY 1
  ) ;
  
  --B--
  
  
SELECT 
        CASE 
        WHEN PLEC='M' THEN ' '
        ELSE NAZWA
        END "NAZWA BANDY",
        
        CASE
        WHEN PLEC='M' THEN 'KOCOR'
        ELSE 'KOTKA'
        END "PLEC",
        ILE,
        SZEFUNIO,
        BANDZIOR,
        LOWCZY,
        LAPACZ,
        KOT,
        MILUSIA,
        DZIELCZY,
        SUMA
FROM
(
    SELECT *
    FROM
    (
        SELECT *
        FROM
        (
            SELECT *
            FROM
            (
                SELECT
                    NAZWA,
                    PLEC,
                    FUNKCJA,
                    NVL(PRZYDZIAL_MYSZY, 0) + NVL(MYSZY_EXTRA, 0) "SPOZYCIE"
                    FROM KOCURY NATURAL JOIN BANDY)
            
                    PIVOT
                    (
                        SUM(SPOZYCIE)
                            FOR FUNKCJA
                            IN ('SZEFUNIO' AS SZEFUNIO, 'BANDZIOR' AS BANDZIOR,'LOWCZY' AS LOWCZY,'LAPACZ' AS LAPACZ,'KOT' AS KOT,'MILUSIA' AS MILUSIA,'DZIELCZY' AS DZIELCZY)
                    )
                    ORDER BY 1,2
        )
    
    UNION
    
    
    SELECT 'ZJADA RAZEM    ' NAZWA ,'  ' PLEC, SZEFUNIO, BANDZIOR , LOWCZY,LAPACZ,KOT,MILUSIA,DZIELCZY
    FROM
    (
        SELECT FUNKCJA,NVL(PRZYDZIAL_MYSZY, 0) + NVL(MYSZY_EXTRA, 0) "SPOZYCIE"
        FROM KOCURY NATURAL JOIN BANDY)
        
        PIVOT
        (
            SUM(SPOZYCIE)
                FOR FUNKCJA
                IN ('SZEFUNIO' AS "SZEFUNIO", 'BANDZIOR' AS  BANDZIOR,'LOWCZY' AS "LOWCZY",'LAPACZ' AS "LAPACZ",'KOT' AS "KOT",'MILUSIA' AS "MILUSIA",'DZIELCZY' AS "DZIELCZY")
        )
    
    ) 
    
    NATURAL JOIN
    
    (
    SELECT
        NAZWA,PLEC,ILE,SUMA
    FROM(
        SELECT  NAZWA,PLEC,CAST(COUNT(*)AS VARCHAR(50) ) ILE,  SUM(NVL(PRZYDZIAL_MYSZY, 0) + NVL(MYSZY_EXTRA, 0)) "SUMA"
        FROM KOCURY NATURAL JOIN BANDY
        GROUP BY NAZWA,PLEC
        )
        UNION
        (
        SELECT 'ZJADA RAZEM    ' NAZWA ,'  ' PLEC,' 'ILE, SUM(NVL(PRZYDZIAL_MYSZY, 0) + NVL(MYSZY_EXTRA, 0)) "SUMA" 
        FROM KOCURY
        )
    )
)
;



-----34-----

SET SERVEROUTPUT ON;
DECLARE
    funkcja_input VARCHAR2(50);
BEGIN
    SELECT FUNKCJA
    INTO funkcja_input
        FROM FUNKCJE
        WHERE FUNKCJA='&podajFunkcje';
        DBMS_OUTPUT.PUT_LINE('Znaleziono');
EXCEPTION
    WHEN NO_DATA_FOUND
        THEN DBMS_OUTPUT.PUT_LINE('Nie znaleziono');
END;



-----35-----

SET SERVEROUTPUT ON;
DECLARE
    przydzial_roczny NUMBER;
    imie_kot VARCHAR2(50);
    data_wstapienia DATE;
    requirements_fail BOOLEAN := TRUE;
    
BEGIN
    SELECT (NVL(PRZYDZIAL_MYSZY,0)+ NVL(MYSZY_EXTRA,0))*12 , IMIE , W_STADKU_OD
    INTO przydzial_roczny, imie_kot, data_wstapienia
        FROM KOCURY
        WHERE PSEUDO='&podajPseudo';
    
    IF przydzial_roczny>700
        THEN DBMS_OUTPUT.PUT_LINE('calkowity roczny przydzial myszy >700');
        requirements_fail:=FALSE;
    END IF;
    
    IF REGEXP_LIKE(imie_kot,'*A*')
        THEN DBMS_OUTPUT.PUT_LINE('imi? zawiera litere A');
         requirements_fail:=FALSE;
    END IF;    
    
    IF EXTRACT(MONTH FROM data_wstapienia)=1
        THEN DBMS_OUTPUT.PUT_LINE('styczen jest miesiacem przystapienia do stada');
         requirements_fail:=FALSE;
    END IF;
    
    IF requirements_fail
        THEN DBMS_OUTPUT.PUT_LINE('nie odpowiada kryteriom');
    END IF;
    
EXCEPTION
    WHEN NO_DATA_FOUND
        THEN DBMS_OUTPUT.PUT_LINE('Nie znaleziono kota');
END;

----36-----
--- sprawdzic ocb z rowId error---
DECLARE
  CURSOR cursor_przydzial IS
    SELECT
      nvl(przydzial_myszy, 0) przydzial,
      max_myszy               max_przydzial
    FROM Kocury
      JOIN Funkcje USING (funkcja)
    ORDER BY przydzial_myszy ASC
    FOR UPDATE OF przydzial_myszy;
    
    row_iterator cursor_przydzial%ROWTYPE;
    sum_przydzial NUMBER(10) :=0;
    ilosc_zmian NUMBER(10) :=0;
    nowy_przydzial NUMBER(10) :=0;
    wiersze BOOLEAN := FALSE;
    no_data EXCEPTION;
BEGIN
    LOOP EXIT WHEN sum_przydzial > 1050;
        OPEN cursor_przydzial;
            LOOP EXIT WHEN cursor_przydzial%NOTFOUND;
                FETCH cursor_przydzial INTO row_iterator;
                IF NOT wiersze THEN wiersze := TRUE;    END IF;
                
               nowy_przydzial := row_iterator.przydzial + ROUND(row_iterator.przydzial * 0.1 );
               IF nowy_przydzial > row_iterator.max_przydzial
               THEN nowy_przydzial := row_iterator.max_przydzial;
               END IF;
               
               UPDATE KOCURY SET przydzial_myszy = nowy_przydzial WHERE CURRENT OF cursor_przydzial;
               ilosc_zmian:= ilosc_zmian +1;
               
               SELECT SUM(NVL(przydzial_myszy,0)) INTO sum_przydzial FROM KOCURY;
               
               IF sum_przydzial>1050 THEN EXIT;
               END IF;
               
            END LOOP;
            CLOSE cursor_przydzial;
    END LOOP;
    dbms_output.put_line('Calk. przydzial w stadku - ' || sum_przydzial || ' Zmian - ' || ilosc_zmian);
    IF NOT wiersze THEN RAISE no_data;
    END IF;
    
    EXCEPTION 
    WHEN no_data THEN dbms_output.put_line('Brak danych');
    WHEN OTHERS THEN dbms_output.put_line(SQLERRM);
END;

ROLLBACK;

-----37-----


DECLARE
  itr NUMBER := 0;
BEGIN
  DBMS_OUTPUT.put_line('Nr   Pseudonim   Zjada ');
  DBMS_OUTPUT.put_line('-----------------------');
  FOR element IN (SELECT
                 pseudo,
                 nvl(przydzial_myszy, 0) + nvl(myszy_extra, 0) zjada
               FROM Kocury
               ORDER BY 2 DESC)
  LOOP
    itr := itr + 1;
    DBMS_OUTPUT.put_line(itr || '    ' || rpad(element.pseudo, 9, ' ') || '   ' || element.zjada);
    EXIT WHEN itr = 5;
  END LOOP;
END;

-----38-----

DECLARE
    CURSOR koty_cur IS
        SELECT imie,szef
            FROM KOCURY
            WHERE funkcja IN ('KOT','MILUSIA');
    koty_row koty_cur%ROWTYPE;  
    curr_szef Kocury.szef%TYPE;
    curr_imie Kocury.imie%TYPE;
    max_glebokosc NUMBER(10);
    rzadana_glebokosc NUMBER(10) := &podajGlebkosc;
BEGIN
    SELECT max(level)
    INTO max_glebokosc
    FROM Kocury
    CONNECT BY PRIOR szef = pseudo
    START WITH funkcja IN('KOT','MILUSIA');
    
    IF rzadana_glebokosc> max_glebokosc THEN rzadana_glebokosc := max_glebokosc;
    END IF;
    
    dbms_output.put(rpad(' Imie', 10) || '|');
    
    FOR i IN 1..rzadana_glebokosc
    LOOP
    dbms_output.put(rpad(' Szef' || i, 10) || '|');
    END LOOP;
    
    dbms_output.new_line();
    
    FOR i IN 1..rzadana_glebokosc 
    LOOP
    dbms_output.put(rpad(' ', 11, '-'));
    END LOOP;
    
    dbms_output.new_line();
    
    
    OPEN koty_cur;
    
    LOOP
        FETCH koty_cur INTO koty_row;
        EXIT WHEN koty_cur%NOTFOUND;
        
        curr_imie:=koty_row.imie;
        curr_szef:=koty_row.szef;
        dbms_output.put(rpad(' ' || koty_row.imie, 10) || '|');
        
        FOR i IN 1..rzadana_glebokosc
            LOOP
                IF curr_szef IS NULL THEN EXIT;
                ELSE
                    SELECT imie,szef INTO curr_imie,curr_szef
                    FROM KOCURY
                    WHERE pseudo=curr_szef;
                    dbms_output.put(rpad(' ' || curr_imie, 10) || '|');
                END IF;
            END LOOP;
            dbms_output.new_line();
    END LOOP;
    
    CLOSE koty_cur;
    
    
END;
    
-----39-----
DECLARE
    nr_bd BANDY.NR_BANDY%TYPE := '&podajNrBandy';
    nazwa_bandy BANDY.NAZWA%TYPE := '&podajNazweBandy';
    teren_bandy BANDY.NAZWA%TYPE := '&podajTerenBandy';
    exist BOOLEAN := FALSE;
    ilosc_nr NUMBER(10);
    ilosc_nazwa NUMBER(10);
    ilosc_teren NUMBER(10);
    duplicated EXCEPTION;
    less_zero EXCEPTION;
    null_vals EXCEPTION;
BEGIN
    SELECT COUNT(*)
    INTO ilosc_nr
    FROM Bandy
    WHERE NR_BANDY = nr_bd;

    SELECT COUNT(*)
    INTO ilosc_nazwa
    FROM Bandy
    WHERE NAZWA = nazwa_bandy;

    SELECT COUNT(*)
    INTO ilosc_teren
    FROM Bandy
    WHERE TEREN = teren_bandy;
    
    IF ilosc_nr>0 THEN dbms_output.put(nr_bd || ', '); exist:=TRUE;
    END IF;
    
    IF ilosc_nazwa>0 THEN dbms_output.put(nazwa_bandy || ', '); exist:=TRUE;
    END IF;
    
    IF ilosc_teren>0 THEN dbms_output.put(teren_bandy || ', '); exist:=TRUE;
    END IF;
    
    IF exist THEN RAISE duplicated;
    END IF;

    IF nr_bd<0 THEN RAISE less_zero;
    END IF;
        
    IF nr_bd IS NULL OR nazwa_bandy IS NULL OR teren_bandy IS NULL
    THEN RAISE null_vals;
    END IF;
    
    INSERT INTO BANDY(NR_BANDY,NAZWA,TEREN) VALUES (nr_bd,nazwa_bandy,teren_bandy);
    dbms_output.put_line('Dodano');
    
    EXCEPTION
    WHEN duplicated THEN dbms_output.put_line(' :juz istnieje');
    WHEN less_zero THEN dbms_output.put_line('Numer bandy <=0');
    WHEN null_vals THEN dbms_output.put_line('Nie podano wartosci');
    WHEN OTHERS THEN RAISE;
    
END;

-----40-----

CREATE OR REPLACE PROCEDURE dodajBande(nr_bd BANDY.NR_BANDY%TYPE,nazwa_bandy BANDY.NAZWA%TYPE,teren_bandy BANDY.NAZWA%TYPE) AS
    exist BOOLEAN := FALSE;
    ilosc_nr NUMBER(10);
    ilosc_nazwa NUMBER(10);
    ilosc_teren NUMBER(10);
    duplicated EXCEPTION;
    less_zero EXCEPTION;
    null_vals EXCEPTION;
BEGIN
    SELECT COUNT(*)
    INTO ilosc_nr
    FROM Bandy
    WHERE NR_BANDY = nr_bd;

    SELECT COUNT(*)
    INTO ilosc_nazwa
    FROM Bandy
    WHERE NAZWA = nazwa_bandy;

    SELECT COUNT(*)
    INTO ilosc_teren
    FROM Bandy
    WHERE TEREN = teren_bandy;
    
    IF ilosc_nr>0 THEN dbms_output.put(nr_bd || ', '); exist:=TRUE;
    END IF;
    
    IF ilosc_nazwa>0 THEN dbms_output.put(nazwa_bandy || ', '); exist:=TRUE;
    END IF;
    
    IF ilosc_teren>0 THEN dbms_output.put(teren_bandy || ', '); exist:=TRUE;
    END IF;
    
    IF exist THEN RAISE duplicated;
    END IF;

    IF nr_bd<0 THEN RAISE less_zero;
    END IF;
        
    IF nr_bd IS NULL OR nazwa_bandy IS NULL OR teren_bandy IS NULL
    THEN RAISE null_vals;
    END IF;
    
    INSERT INTO BANDY(NR_BANDY,NAZWA,TEREN) VALUES (nr_bd,nazwa_bandy,teren_bandy);
    dbms_output.put_line('Dodano');
    
    EXCEPTION
    WHEN duplicated THEN dbms_output.put_line(' :juz istnieje');
    WHEN less_zero THEN dbms_output.put_line('Numer bandy <=0');
    WHEN null_vals THEN dbms_output.put_line('Nie podano wartosci');
    WHEN OTHERS THEN RAISE;
    
END;

ROLLBACK;

CALL dodajBande(9,'CZARNI RYCERZE','POLE');

CALL dodajBande(7,'TEST','TEST');

SELECT * FROM BANDY;


-----41-----

CREATE OR REPLACE TRIGGER zwieksz_nr_bandy
BEFORE INSERT ON BANDY
FOR EACH ROW
DECLARE
    max_nb NUMBER(10);
BEGIN
    SELECT MAX(NR_BANDY)INTO max_nb FROM BANDY;
    :NEW.NR_BANDY := max_nb +1;
END;

    

-----42-----
---a---

CREATE OR REPLACE PACKAGE wirus AS
    pseudo_target KOCURY.PSEUDO%TYPE;
    execute_trigger BOOLEAN := FALSE; --- PREVENT maximum number of recursive SQL levels (50) exceeded
    new_przydzial KOCURY.PRZYDZIAL_MYSZY%TYPE;
    old_przydzial KOCURY.PRZYDZIAL_MYSZY%TYPE;
    FUNCTION przydzial_tygrys RETURN KOCURY.PRZYDZIAL_MYSZY%TYPE;
END wirus;

CREATE OR REPLACE PACKAGE BODY wirus AS
FUNCTION przydzial_tygrys  RETURN KOCURY.PRZYDZIAL_MYSZY%TYPE IS result_przydzial KOCURY.PRZYDZIAL_MYSZY%TYPE;
BEGIN
    SELECT PRZYDZIAL_MYSZY INTO result_przydzial
    FROM KOCURY
    WHERE PSEUDO ='TYGRYS';
    RETURN result_przydzial;
    END przydzial_tygrys;
END wirus;


CREATE OR REPLACE TRIGGER checker
BEFORE UPDATE OF PRZYDZIAL_MYSZY ON KOCURY
FOR EACH ROW WHEN (NEW.FUNKCJA = 'MILUSIA')
    DECLARE
    BEGIN
        IF(NOT wirus.execute_trigger)
        THEN 
        wirus.pseudo_target:= :NEW.pseudo;
        IF :NEW.PRZYDZIAL_MYSZY < :OLD.PRZYDZIAL_MYSZY
        THEN 
            :NEW.PRZYDZIAL_MYSZY := :OLD.PRZYDZIAL_MYSZY;
        END IF;
            wirus.new_przydzial := :NEW.PRZYDZIAL_MYSZY;
            wirus.old_przydzial := :OLD.PRZYDZIAL_MYSZY;
        END IF;
    END;
        
CREATE OR REPLACE TRIGGER executor
AFTER UPDATE OF PRZYDZIAL_MYSZY ON KOCURY
DECLARE
    punish BOOLEAN :=TRUE;
BEGIN

    punish := (wirus.new_przydzial - wirus.old_przydzial) < wirus.przydzial_tygrys * 0.1;
    
    IF NOT wirus.execute_trigger
    THEN 
    wirus.execute_trigger:=TRUE;
    IF punish
    THEN 
        UPDATE KOCURY SET PRZYDZIAL_MYSZY = wirus.new_przydzial, MYSZY_EXTRA = MYSZY_EXTRA + 5
        WHERE PSEUDO = wirus.pseudo_target;
        
        UPDATE KOCURY SET PRZYDZIAL_MYSZY = PRZYDZIAL_MYSZY * 0.9
        WHERE PSEUDO = 'TYGRYS';
    ELSE
        UPDATE KOCURY SET MYSZY_EXTRA = MYSZY_EXTRA +5
        WHERE PSEUDO = 'TYGRYS';
        
        UPDATE KOCURY SET PRZYDZIAL_MYSZY = wirus.new_przydzial
        WHERE PSEUDO = wirus.pseudo_target;
    END IF;
    wirus.execute_trigger:=FALSE;
    END IF;
END;
    
    
SELECT
  pseudo,
  funkcja,
  przydzial_myszy,
  myszy_extra
FROM Kocury
WHERE funkcja = 'MILUSIA' OR pseudo = 'TYGRYS';

UPDATE Kocury
SET przydzial_myszy = przydzial_myszy + 10
WHERE pseudo = 'MALA';

ROLLBACK;

    

ROLLBACK

SELECT * FROM BANDY;


-----B-----

CREATE OR REPLACE TRIGGER compound_wirus
FOR UPDATE OF przydzial_myszy
  ON Kocury
WHEN (OLD.funkcja = 'MILUSIA')
COMPOUND TRIGGER
  pseudo_target Kocury.pseudo%TYPE;
  execute_trigger BOOLEAN := FALSE;
  new_przydzial Kocury.przydzial_myszy%TYPE;
  old_przydzial Kocury.przydzial_myszy%TYPE;
  przydzial_tygrys Kocury.przydzial_myszy%TYPE;
  BEFORE STATEMENT IS
  BEGIN
    SELECT przydzial_myszy
    INTO przydzial_tygrys
    FROM Kocury
    WHERE pseudo = 'TYGRYS';
  END BEFORE STATEMENT;

  BEFORE EACH ROW IS
  BEGIN
    IF (NOT wirus.execute_trigger)
    THEN
      wirus.pseudo_target := :NEW.pseudo;
      IF :NEW.przydzial_myszy < :OLD.przydzial_myszy
      THEN
        :NEW.przydzial_myszy := :OLD.przydzial_myszy;
      END IF;
      wirus.new_przydzial := :NEW.przydzial_myszy;
      wirus.old_przydzial := :OLD.przydzial_myszy;
    END IF;
  END BEFORE EACH ROW;

  AFTER STATEMENT IS
    punish BOOLEAN := TRUE;
  BEGIN
    punish := (wirus.new_przydzial - wirus.old_przydzial) < wirus.przydzial_tygrys * 0.1;
    IF (NOT wirus.execute_trigger)
    THEN
      wirus.execute_trigger := TRUE;
      IF (punish)
      THEN
        UPDATE Kocury
        SET przydzial_myszy = wirus.new_przydzial, myszy_extra = myszy_extra + 5
        WHERE pseudo = wirus.pseudo_target;

        UPDATE Kocury
        SET przydzial_myszy = przydzial_myszy * 0.9
        WHERE pseudo = 'TYGRYS';
      ELSE
        UPDATE Kocury
        SET myszy_extra = myszy_extra + 5
        WHERE pseudo = 'TYGRYS';

        UPDATE Kocury
        SET przydzial_myszy = wirus.new_przydzial
        WHERE pseudo = wirus.pseudo_target;
      END IF;
      wirus.execute_trigger := FALSE;
    END IF;
  END AFTER STATEMENT;
END compound_wirus;






CREATE OR REPLACE PACKAGE wirus AS
    pseudo_target KOCURY.PSEUDO%TYPE;
    execute_trigger BOOLEAN := FALSE; --- PREVENT maximum number of recursive SQL levels (50) exceeded
    new_przydzial KOCURY.PRZYDZIAL_MYSZY%TYPE; -- tych nie trzeba
    old_przydzial KOCURY.PRZYDZIAL_MYSZY%TYPE; -- tych nie trzeba
    FUNCTION przydzial_tygrys RETURN KOCURY.PRZYDZIAL_MYSZY%TYPE;
END wirus;





SELECT
  pseudo,
  funkcja,
  przydzial_myszy,
  myszy_extra
FROM Kocury
WHERE funkcja = 'MILUSIA' OR pseudo = 'TYGRYS';

UPDATE Kocury
SET przydzial_myszy = przydzial_myszy + 10
WHERE pseudo = 'MALA';

ROLLBACK;













-----43-----

DECLARE
  i          NUMBER := 1;
  holder       NUMBER;
  liczba_fun NUMBER := 0;
BEGIN
  dbms_output.put(rpad('Nazwa Bandy', 16));
  dbms_output.put(rpad('Plec', 7));
  dbms_output.put(rpad('Ile', 8));
  FOR fun IN (SELECT funkcja
              FROM Funkcje) LOOP
    dbms_output.put(rpad(fun.funkcja, 13));
    liczba_fun := liczba_fun + 1;
  END LOOP;
  dbms_output.put(rpad('SUMA', 13));
  dbms_output.new_line();
  dbms_output.put('-------------- ------- ------' || rpad(' ', 13, '-'));
  FOR i IN 1..liczba_fun LOOP
    dbms_output.put(rpad(' ', 13, '-'));
  END LOOP;
  dbms_output.new_line();
  FOR bandy IN (SELECT
                  nr_bandy,
                  nazwa,
                  plec
                FROM Kocury
                  JOIN Bandy USING (nr_bandy)
                GROUP BY nr_bandy, nazwa, plec
                ORDER BY 2, 3 ASC) LOOP
    IF mod(i, 2) != 0
    THEN
      dbms_output.put(rpad(bandy.nazwa, 16));
      dbms_output.put(rpad('Kotka', 7));
    ELSE
      dbms_output.put(lpad(' ', 16));
      dbms_output.put(rpad('Kocor', 7));
    END IF;

    SELECT COUNT(pseudo)
    INTO holder
    FROM Kocury Ko
    WHERE Ko.nr_bandy = bandy.nr_bandy AND Ko.plec = bandy.plec;
    dbms_output.put(rpad(holder, 8));

    FOR funkcje IN (SELECT funkcja
                    FROM Funkcje) LOOP
      SELECT sum(nvl(KC.przydzial_myszy, 0) + nvl(KC.myszy_extra, 0))
      INTO holder
      FROM Kocury KC
      WHERE KC.nr_bandy = bandy.nr_bandy AND KC.plec = bandy.plec AND KC.funkcja = funkcje.funkcja;
      dbms_output.put(rpad(nvl(holder, 0), 13));
    END LOOP;

    SELECT sum(nvl(przydzial_myszy, 0) + nvl(myszy_extra, 0))
    INTO holder
    FROM Kocury Ko
    WHERE Ko.nr_bandy = bandy.nr_bandy AND Ko.plec = bandy.plec;
    dbms_output.put_line(rpad(nvl(holder, 0), 13));
    i := i + 1;
  END LOOP;
  dbms_output.put('-------------- ------- ------' || rpad(' ', 13, '-'));
  FOR i IN 1..liczba_fun LOOP
    dbms_output.put(rpad(' ', 13, '-'));
  END LOOP;
  dbms_output.new_line();
  dbms_output.put(rpad('ZJADA RAZEM', 31));
  FOR funkcje IN (SELECT funkcja
                  FROM Funkcje) LOOP
    SELECT sum(nvl(przydzial_myszy, 0) + nvl(myszy_extra, 0))
    INTO holder
    FROM Kocury K
    WHERE K.funkcja = funkcje.funkcja;
    dbms_output.put(rpad(nvl(holder, 0), 13));
  END LOOP;
  SELECT sum(nvl(przydzial_myszy, 0) + nvl(myszy_extra, 0))
  INTO holder
  FROM Kocury;
  dbms_output.put_line(nvl(holder, 0));
END;


-----44-----
CREATE OR REPLACE PACKAGE podatek AS
    FUNCTION get_podatek(pseudo_podatnika KOCURY.PSEUDO%TYPE)
        RETURN NUMBER;
    PROCEDURE dodajBande(nr_bd BANDY.NR_BANDY%TYPE,nazwa_bandy BANDY.NAZWA%TYPE,teren_bandy BANDY.NAZWA%TYPE);
END podatek;

CREATE OR REPLACE PACKAGE BODY podatek AS

PROCEDURE dodajBande(nr_bd BANDY.NR_BANDY%TYPE,nazwa_bandy BANDY.NAZWA%TYPE,teren_bandy BANDY.NAZWA%TYPE) AS
    exist BOOLEAN := FALSE;
    ilosc_nr NUMBER(10);
    ilosc_nazwa NUMBER(10);
    ilosc_teren NUMBER(10);
    duplicated EXCEPTION;
    less_zero EXCEPTION;
    null_vals EXCEPTION;
BEGIN
    SELECT COUNT(*)
    INTO ilosc_nr
    FROM Bandy
    WHERE NR_BANDY = nr_bd;

    SELECT COUNT(*)
    INTO ilosc_nazwa
    FROM Bandy
    WHERE NAZWA = nazwa_bandy;

    SELECT COUNT(*)
    INTO ilosc_teren
    FROM Bandy
    WHERE TEREN = teren_bandy;
    
    IF ilosc_nr>0 THEN dbms_output.put(nr_bd || ', '); exist:=TRUE;
    END IF;
    
    IF ilosc_nazwa>0 THEN dbms_output.put(nazwa_bandy || ', '); exist:=TRUE;
    END IF;
    
    IF ilosc_teren>0 THEN dbms_output.put(teren_bandy || ', '); exist:=TRUE;
    END IF;
    
    IF exist THEN RAISE duplicated;
    END IF;

    IF nr_bd<0 THEN RAISE less_zero;
    END IF;
        
    IF nr_bd IS NULL OR nazwa_bandy IS NULL OR teren_bandy IS NULL
    THEN RAISE null_vals;
    END IF;
    
    INSERT INTO BANDY(NR_BANDY,NAZWA,TEREN) VALUES (nr_bd,nazwa_bandy,teren_bandy);
    dbms_output.put_line('Dodano');
    
    EXCEPTION
    WHEN duplicated THEN dbms_output.put_line(' :juz istnieje');
    WHEN less_zero THEN dbms_output.put_line('Numer bandy <=0');
    WHEN null_vals THEN dbms_output.put_line('Nie podano wartosci');
    WHEN OTHERS THEN RAISE;
    
END;






FUNCTION get_podatek(pseudo_podatnika KOCURY.PSEUDO%TYPE)
        RETURN NUMBER IS
        sumaPodatku NUMBER(10) := 0;
        holder NUMBER(10) :=0;
        BEGIN
            SELECT ROUND((NVL(PRZYDZIAL_MYSZY,0) + NVL(MYSZY_EXTRA,0)) * 0.05) INTO sumaPodatku
            FROM KOCURY WHERE pseudo=pseudo_podatnika;
            
            SELECT COUNT(pseudo)INTO holder
            FROM KOCURY WHERE szef=pseudo_podatnika;
            
            IF holder <= 0 THEN sumaPodatku := sumaPodatku +2;
            END IF;
            
            SELECT COUNT(pseudo) INTO holder
            FROM WROGOWIE_KOCUROW WHERE pseudo = pseudo_podatnika;
            
            IF holder <= 0 THEN sumaPodatku := sumaPodatku +1;
            END IF;
            
            holder := 0;
            
            SELECT ROUND((NVL(PRZYDZIAL_MYSZY,0) + NVL(MYSZY_EXTRA,0)) * nr_bandy/100) INTO holder 
            FROM KOCURY WHERE pseudo = pseudo_podatnika AND FUNKCJA != 'TYGRYS';
            
            IF holder > 0 THEN sumaPodatku := sumaPodatku + holder;
            END IF;
            
            RETURN sumaPodatku;
        END GET_PODATEK;
END;

BEGIN
  FOR kot IN (SELECT pseudo
              FROM Kocury) LOOP
    dbms_output.put(rpad(kot.pseudo, 10));
    dbms_output.put(rpad(PODATEK.GET_PODATEK(kot.pseudo), 10));
    dbms_output.new_line();
  END LOOP;
END;

-----45-----

ALTER SESSION SET NLS_DATE_FORMAT='YYYY-MM-DD';
CREATE TABLE Bandy
    (nr_bandy NUMBER(2)CONSTRAINT bd_nr_pk PRIMARY KEY,
     nazwa VARCHAR2(20)CONSTRAINT bd_nz_nn NOT NULL,
     teren VARCHAR2(15)CONSTRAINT bd_trn_uq UNIQUE,
     szef_bandy VARCHAR(15) CONSTRAINT bd_sb_fk REFERENCES Kocury(pseudo));
     
    
CREATE TABLE Funkcje
    ( funkcja VARCHAR2(10)CONSTRAINT fc_fc_pk PRIMARY KEY,
     min_myszy NUMBER(3)CONSTRAINT fc_mimy_ck CHECK(min_myszy>5),
     max_myszy NUMBER(3)CONSTRAINT fc_mxmy_ck CHECK(200> max_myszy),
     CONSTRAINT f_maxmin CHECK (max_myszy >= min_myszy));
     
CREATE TABLE Wrogowie
    ( imie_wroga VARCHAR2(15) CONSTRAINT wg_im_pk PRIMARY KEY,
     stopien_wrogosci NUMBER(2) CONSTRAINT wg_sw_ck CHECK(stopien_wrogosci<10 AND stopien_wrogosci>0),
     gatunek VARCHAR2(15),
     lapowka VARCHAR2(20));
     
alter table wrogowie drop constraint wg_sw_ck;
alter table wrogowie add constraint wg_sw_ck check(stopien_wrogosci BETWEEN 1 AND 10);
     
CREATE TABLE Kocury
    ( imie VARCHAR2(15) CONSTRAINT kc_im_nn NOT NULL,
     plec VARCHAR2(1) CONSTRAINT kc_pl_ck CHECK(plec IN('M','D')),
     pseudo VARCHAR2(15) CONSTRAINT kc_ps_pk PRIMARY KEY,
     funkcja VARCHAR(10) CONSTRAINT kc_fc_fk REFERENCES Funkcje(funkcja),
     szef VARCHAR2(15) CONSTRAINT kc_sz_fk REFERENCES Kocury(pseudo),
     w_stadku_od DATE DEFAULT SYSDATE,
     przydzial_myszy NUMBER(3),
     myszy_extra NUMBER(3),
     nr_bandy NUMBER(2) CONSTRAINT kc_nb_fk REFERENCES Bandy(nr_bandy));

ALTER TABLE Bandy ADD CONSTRAINT bd_szbd_fk FOREIGN KEY(szef_bandy) REFERENCES Kocury(pseudo);

ALTER TABLE Bandy DROP CONSTRAINT bd_szbd_fk;

ALTER TABLE Kocury ADD CONSTRAINT kc_sz_fk FOREIGN KEY(PSEUDO) REFERENCES Kocury(pseudo);

ALTER TABLE Kocury DROP CONSTRAINT kc_sz_fk;

CREATE TABLE Wrogowie_Kocurow
    (pseudo VARCHAR2(15) CONSTRAINT wk_ps_fk REFERENCES Kocury(pseudo),
     imie_wroga VARCHAR2(15) CONSTRAINT wk_iw_fk REFERENCES WROGOWIE (imie_wroga),
     data_incydentu DATE CONSTRAINT wk_di_nn NOT NULL,
     opis_incydentu VARCHAR(50),
     CONSTRAINT wg_pk PRIMARY KEY(pseudo,imie_wroga));







INSERT ALL
    INTO Funkcje(funkcja,min_myszy,max_myszy) VALUES('SZEFUNIO',90,110)
    INTO Funkcje(funkcja,min_myszy,max_myszy) VALUES('BANDZIOR',70,90)
    INTO Funkcje(funkcja,min_myszy,max_myszy) VALUES('LOWCZY',60,70)
    INTO Funkcje(funkcja,min_myszy,max_myszy) VALUES('LAPACZ',50,60)
    INTO Funkcje(funkcja,min_myszy,max_myszy) VALUES('KOT',40,50)
    INTO Funkcje(funkcja,min_myszy,max_myszy) VALUES('MILUSIA',20,30)
    INTO Funkcje(funkcja,min_myszy,max_myszy) VALUES('DZIELCZY',45,55)
    INTO Funkcje(funkcja,min_myszy,max_myszy) VALUES('HONOROWA',6,25)
SELECT * FROM DUAL;



INSERT ALL
    INTO Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('JACEK','M','PLACEK','LOWCZY','LYSY','2008-12-01',67,NULL,2)
    INTO Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('BARI','M','RURA','LAPACZ','LYSY','2009-09-01',56,NULL,2)
    INTO Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('MICKA','D','LOLA','MILUSIA','TYGRYS','2009-10-14',25,47,1)
    INTO Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('LUCEK','M','ZERO','KOT','KURKA','2010-03-01',43,NULL,3)
    INTO Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('SONIA','D','PUSZYSTA','MILUSIA','ZOMBI','2010-11-18',20,35,3)
    INTO Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('LATKA','D','UCHO','KOT','RAFA','2011-01-01',40,NULL,4)
    INTO Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('DUDEK','M','MALY','KOT','RAFA','2011-05-15',40,NULL,4)
    INTO Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('MRUCZEK','M','TYGRYS','SZEFUNIO',NULL,'2002-01-01',103,33,1)
    INTO Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('CHYTRY','M','BOLEK','DZIELCZY','TYGRYS','2002-05-05',50,NULL,1)
    INTO Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('KOREK','M','ZOMBI','BANDZIOR','TYGRYS','2004-03-16',75,13,3)
    INTO Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('BOLEK','M','LYSY','BANDZIOR','TYGRYS','2006-08-15',72,21,2)
    INTO Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('ZUZIA','D','SZYBKA','LOWCZY','LYSY','2006-07-21',65,NULL,2)
    INTO Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('RUDA','D','MALA','MILUSIA','TYGRYS','2006-09-17',22,42,1)
    INTO Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('PUCEK','M','RAFA','LOWCZY','TYGRYS','2006-10-15',65,NULL,4)
    INTO Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('PUNIA','D','KURKA','LOWCZY','ZOMBI','2008-01-01',61,NULL,3)
    INTO Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('BELA','D','LASKA','MILUSIA','LYSY','2008-02-01',24,28,2)
    INTO Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('KSAWERY','M','MAN','LAPACZ','RAFA','2008-07-12',51,NULL,4)
    INTO Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) VALUES ('MELA','D','DAMA','LAPACZ','RAFA','2008-11-01',51,NULL,4)
SELECT * FROM DUAL;



INSERT ALL
    INTO Bandy(nr_bandy,nazwa,teren,szef_bandy) VALUES (1,'SZEFOSTWO','CALOSC','TYGRYS')
    INTO Bandy(nr_bandy,nazwa,teren,szef_bandy) VALUES (2,'CZARNI RYCERZE','POLE','LYSY')
    INTO Bandy(nr_bandy,nazwa,teren,szef_bandy) VALUES (3,'BIALI LOWCY','SAD','ZOMBI')
    INTO Bandy(nr_bandy,nazwa,teren,szef_bandy) VALUES (4,'LACIACI MYSLIWI','GORKA','RAFA')
    INTO Bandy(nr_bandy,nazwa,teren,szef_bandy) VALUES (5,'ROCKERSI','ZAGRODA',NULL)
SELECT * FROM DUAL;

INSERT ALL
    INTO Wrogowie(imie_wroga,stopien_wrogosci,gatunek,lapowka) VALUES('KAZIO',10,'CZLOWIEK','FLASZKA')
    INTO Wrogowie(imie_wroga,stopien_wrogosci,gatunek,lapowka) VALUES('GLUPIA ZOSKA',1,'CZLOWIEK','KORALIK')
    INTO Wrogowie(imie_wroga,stopien_wrogosci,gatunek,lapowka) VALUES('SWAWOLNY DYZIO',7,'CZLOWIEK','GUMA DO ZUCIA')
    INTO Wrogowie(imie_wroga,stopien_wrogosci,gatunek,lapowka) VALUES('BUREK',4,'PIES','KOSC')
    INTO Wrogowie(imie_wroga,stopien_wrogosci,gatunek,lapowka) VALUES('DZIKI BILL',10,'PIES',NULL)
    INTO Wrogowie(imie_wroga,stopien_wrogosci,gatunek,lapowka) VALUES('REKSIO',2,'PIES','KOSC')
    INTO Wrogowie(imie_wroga,stopien_wrogosci,gatunek,lapowka) VALUES('BETHOVEN',1,'PIES','PEDIGRIPALL')
    INTO Wrogowie(imie_wroga,stopien_wrogosci,gatunek,lapowka) VALUES('CHYTRUSEK',5,'LIS','KURCZAK')
    INTO Wrogowie(imie_wroga,stopien_wrogosci,gatunek,lapowka) VALUES('SMUKLA',1,'SOSNA',NULL)
    INTO Wrogowie(imie_wroga,stopien_wrogosci,gatunek,lapowka) VALUES('BAZYLI',3,'KOGUT','KURA DO STADA')
SELECT * FROM DUAL;

INSERT ALL
    INTO Wrogowie_Kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES('TYGRYS','KAZIO','2004-10-13','USILOWAL NABIC NA WIDLY')
    INTO Wrogowie_Kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES('ZOMBI','SWAWOLNY DYZIO','2005-03-07','WYBIL OKO Z PROCY')
    INTO Wrogowie_Kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES('BOLEK','KAZIO','2005-03-29','POSZCZUL BURKIEM')
    INTO Wrogowie_Kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES('SZYBKA','GLUPIA ZOSKA','2006-09-12','UZYLA KOTA JAKO SCIERKI')
    INTO Wrogowie_Kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES('MALA','CHYTRUSEK','2007-03-07','ZALECAL SIE')
    INTO Wrogowie_Kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES('TYGRYS','DZIKI BILL','2007-06-12','USILOWAL POZBAWIC ZYCIA')
    INTO Wrogowie_Kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES('BOLEK','DZIKI BILL','2007-11-10','ODGRYZL UCHO')
    INTO Wrogowie_Kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES('LASKA','DZIKI BILL','2008-12-12','POGRYZL ZE LEDWO SIE WYLIZALA')
    INTO Wrogowie_Kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES('LASKA','KAZIO','2009-01-07','ZLAPAL ZA OGON I ZROBIL WIATRAK')
    INTO Wrogowie_Kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES('DAMA','KAZIO','2009-02-07','CHCIAL OBEDRZEC ZE SKORY')
    INTO Wrogowie_Kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES('MAN','REKSIO','2009-04-14','WYJATKOWO NIEGRZECZNIE OBSZCZEKAL')
    INTO Wrogowie_Kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES('LYSY','BETHOVEN','2009-05-11','NIE PODZIELIL SIE SWOJA KASZA')
    INTO Wrogowie_Kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES('RURA','DZIKI BILL','2009-09-03','ODGRYZL OGON')
    INTO Wrogowie_Kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES('PLACEK','BAZYLI','2010-07-12','DZIOBIAC UNIEMOZLIWIL PODEBRANIE KURCZAKA')
    INTO Wrogowie_Kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES('PUSZYSTA','SMUKLA','2010-11-19','OBRZUCILA SZYSZKAMI')
    INTO Wrogowie_Kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES('KURKA','BUREK','2010-12-14','POGONIL')
    INTO Wrogowie_Kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES('MALY','CHYTRUSEK','2011-07-13','PODEBRAL PODEBRANE JAJKA')
    INTO Wrogowie_Kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) VALUES('UCHO','SWAWOLNY DYZIO','2011-07-14','OBRZUCIL KAMIENIAMI')
SELECT * FROM DUAL;




DROP TABLE Dodatki_extra;

CREATE TABLE Dodatki_extra (
    id_dod NUMBER(3) GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    pseudo VARCHAR2(20) CONSTRAINT ref_kocury_pseudo REFERENCES Kocury(pseudo),
    dodatek NUMBER(3) NOT NULL
);

CREATE OR REPLACE TRIGGER kara_miluise
BEFORE UPDATE OF przydzial_myszy ON Kocury 
FOR EACH ROW WHEN (old.funkcja = 'MILUSIA')
DECLARE
PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
 IF LOGIN_USER != 'TYGRYS' AND :new.przydzial_myszy > :old.przydzial_myszy
 THEN
    EXECUTE IMMEDIATE 
    'DECLARE
          CURSOR milusie_curr IS SELECT pseudo FROM Kocury WHERE funkcja = ''MILUSIA'';
      BEGIN
        FOR kot IN milusie_curr 
        LOOP
          INSERT INTO dodatki_extra(pseudo, dodatek) VALUES (kot.pseudo, -10);
        END LOOP;
      END;';
      COMMIT;
 END IF;
END;


Update kocury set przydzial_myszy = 30 where funkcja = 'MILUSIA';
SELECT * FROM KOCURY where funkcja = 'MILUSIA';
SELECT * FROM DODATKI_EXTRA;
DELETE FROM DODATKI_EXTRA;
rollback;





-----46-----


CREATE OR REPLACE TRIGGER max_min_funkcje
BEFORE UPDATE OR INSERT ON Kocury
FOR EACH ROW 
DECLARE
 min_funk number(10):=0;
 max_funk number(10):=0;
 incorrect_inputs EXCEPTION;
 who Rejestr.kto%type;
 oper Rejestr.operacja%type;
 pseu Rejestr.pseudo_kota%type;
 PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN

SELECT min_myszy,max_myszy into min_funk, max_funk From Funkcje
where funkcja ='MILUSIA' ;

IF :new.przydzial_myszy < min_funk OR :new.przydzial_myszy > max_funk
    THEN 
        who:= LOGIN_USER;
        oper := SYSEVENT;
        pseu:= :old.pseudo;
        INSERT INTO Rejestr VALUES (who, SYSDATE, pseu, oper);
        COMMIT;
        :new.przydzial_myszy := :old.przydzial_myszy;
       RAISE_APPLICATION_ERROR(-20001,'ZLY INPUT!!!');
END IF;
END;


update kocury set przydzial_myszy = 1 where pseudo = 'TYGRYS';

SELECT * FROM KOCURY;
SELECT * FROM Rejestr;

delete from rejestr;


rollback;

CREATE TABLE Rejestr 
(
    kto VARCHAR2(20),
    kiedy DATE,
    pseudo_kota VARCHAR2(20),
    operacja VARCHAR2(15)
);
    
DROP TABLE Rejestr;






----Lista 4----

--47--

CREATE OR REPLACE TYPE KOCURY_O AS OBJECT
(
  imie VARCHAR2(15),
  plec VARCHAR2(1),
  pseudo VARCHAR2(15),
  funkcja VARCHAR2(10),
  szef REF KOCURY_O,
  w_stadku_od DATE,
  przydzial_myszy NUMBER(3),
  myszy_extra NUMBER(3),
  nr_bandy NUMBER(2),
  MAP MEMBER FUNCTION GetPseudo RETURN VARCHAR2,
  MEMBER FUNCTION MaSzefa RETURN BOOLEAN,
  MEMBER FUNCTION LataStazu RETURN VARCHAR2 
  
  
)

CREATE OR REPLACE TYPE BODY KOCURY_O IS

    MAP MEMBER FUNCTION GetPseudo RETURN VARCHAR2 IS
    BEGIN     
        RETURN pseudo;
    END;
    
    MEMBER FUNCTION MaSzefa RETURN BOOLEAN IS
    BEGIN
        RETURN szef IS NOT NULL;
    END;
    
    MEMBER FUNCTION LataStazu RETURN VARCHAR2 IS
    aktualnyRok NUMBER;
    BEGIN
        SELECT EXTRACT(YEAR FROM SYSDATE)INTO aktualnyRok FROM DUAL;
        RETURN aktualnyRok - EXTRACT(YEAR FROM w_stadku_od);
    END;
END;


CREATE OR REPLACE TYPE Plebs AS OBJECT (
  id_plebs NUMBER(5),
  kot REF Kocury_O,
  
  MAP MEMBER FUNCTION GetPseudoP RETURN VARCHAR2,
  MEMBER FUNCTION GetKot RETURN Kocury_O
);

CREATE OR REPLACE TYPE BODY Plebs IS
  MAP MEMBER FUNCTION GetPseudoP RETURN VARCHAR2 IS
    kocur Kocury_O;
  BEGIN
    SELECT DEREF(kot) INTO kocur FROM DUAL;
    RETURN kocur.pseudo;
  END;
  
  MEMBER FUNCTION GetKot RETURN Kocury_O IS
    kocur KOCURY_o;
  BEGIN
    SELECT DEREF(kot) INTO kocur FROM DUAL;
    RETURN kocur;
  END;
  

END;



CREATE OR REPLACE TYPE ELITA AS OBJECT
(
    id_elita NUMBER(5),
    kot REF KOCURY_O,
    tytul_szlachecki VARCHAR(20),
    sluga REF PLEBS,
    MAP MEMBER FUNCTION GetPseudo RETURN VARCHAR2,
    MEMBER FUNCTION GetSluga RETURN VARCHAR2
)

CREATE OR REPLACE TYPE BODY ELITA IS
   
    MAP MEMBER FUNCTION GetPseudo RETURN VARCHAR2 IS
        kot_elita KOCURY_O;
    BEGIN 
       SELECT DEREF(kot) INTO kot_elita FROM DUAL;
        RETURN kot_elita.pseudo;
    END;
    
    MEMBER FUNCTION GetSluga RETURN VARCHAR2 IS
    kot_plebs PLEBS;
    BEGIN
        SELECT DEREF(sluga) INTO kot_plebs FROM DUAL;
        RETURN kot_plebs.GetPseudoP();
    END;
END;



CREATE OR REPLACE TYPE KONTO AS OBJECT
(
    numer_konta NUMBER,
    wlasciciel REF ELITA,
    data_wprowadzenia DATE, 
    data_usuniecia DATE,
    MAP MEMBER FUNCTION GetID RETURN NUMBER,
    MEMBER FUNCTION CzasNaKoncie RETURN NUMBER
)

CREATE OR REPLACE TYPE BODY KONTO IS 
    
    MAP MEMBER FUNCTION GetID RETURN NUMBER IS
    BEGIN
    RETURN numer_konta;
    END;
    
    MEMBER FUNCTION CzasNaKoncie RETURN NUMBER IS
    BEGIN
    IF data_usuniecia IS NULL THEN
      RETURN SYSDATE - data_wprowadzenia;
    ELSE
      RETURN data_usuniecia - data_wprowadzenia;
    END IF;
    END;
END;

CREATE OR REPLACE TYPE INCYDENT AS OBJECT
(
    id_incydentu NUMBER,
    kot REF KOCURY_O,
    imie_wroga VARCHAR2(15),
    data_incydentu DATE,
	opis_incydentu VARCHAR2(50),
    MAP MEMBER FUNCTION GetID RETURN NUMBER,
    MEMBER FUNCTION dajSzczegoly RETURN VARCHAR2
)
CREATE OR REPLACE TYPE BODY INCYDENT IS
    MAP MEMBER FUNCTION GetID RETURN NUMBER IS
    BEGIN
        RETURN id_incydentu;
    END;
    
    MEMBER FUNCTION dajSzczegoly RETURN VARCHAR2 IS
    BEGIN
        RETURN imie_wroga || ' -  ' || opis_incydentu;
    END;
END;



CREATE TABLE KOCURY_W OF KOCURY_O
(
    CONSTRAINT kc_im_nn_4 CHECK(imie IS NOT NULL),
    CONSTRAINT kc_pl_ck_4 CHECK(plec IN ('M','D')),
    CONSTRAINT kc_ps_pk_4 PRIMARY KEY(pseudo),
    w_stadku_od DEFAULT(SYSDATE)
)
CREATE TABLE PLEBS_W OF PLEBS(
    CONSTRAINT pb_id_pk_4 PRIMARY KEY(id_plebs),
    CONSTRAINT pb_kt_sc_4 kot SCOPE IS KOCURY_W 
);


CREATE TABLE ELITA_W OF ELITA
(
  CONSTRAINT el_id_pk PRIMARY KEY (id_elita),
  CONSTRAINT el_kt_sc kot SCOPE IS KOCURY_W,
  CONSTRAINT el_tt_ck CHECK (tytul_szlachecki IN ('BARON','HRABIA')),
  CONSTRAINT el_sg_sc sluga SCOPE IS PLEBS_W
)

CREATE TABLE KONTO_W OF KONTO
(
  CONSTRAINT kt_nk_pk PRIMARY KEY (numer_konta),
  CONSTRAINT kt_wc_sc wlasciciel SCOPE IS ELITA_W,
  CONSTRAINT kt_dw_ck CHECK(data_wprowadzenia IS NOT NULL),
  CONSTRAINT kt_du_ck CHECK(data_wprowadzenia <= data_usuniecia)
);





INSERT INTO KOCURY_w VALUES ('MRUCZEK','M','TYGRYS','SZEFUNIO',NULL,'2002-01-01',103,33,1);


INSERT INTO KOCURY_w VALUES ('CHYTRY','M','BOLEK','DZIELCZY',(SELECT REF(O) FROM KOCURY_W O WHERE O.pseudo='TYGRYS'),'2002-05-05',50,NULL,1);
INSERT INTO KOCURY_w VALUES ('KOREK','M','ZOMBI','BANDZIOR',(SELECT REF(O) FROM KOCURY_W O WHERE O.pseudo='TYGRYS'),'2004-03-16',75,13,3);
INSERT INTO KOCURY_w VALUES ('BOLEK','M','LYSY','BANDZIOR',(SELECT REF(O) FROM KOCURY_W O WHERE O.pseudo='TYGRYS'),'2006-08-15',72,21,2);
INSERT INTO KOCURY_w VALUES ('RUDA','D','MALA','MILUSIA',(SELECT REF(O) FROM KOCURY_W O WHERE O.pseudo='TYGRYS'),'2006-09-17',22,42,1);
INSERT INTO KOCURY_w VALUES ('PUCEK','M','RAFA','LOWCZY',(SELECT REF(O) FROM KOCURY_W O WHERE O.pseudo='TYGRYS'),'2006-10-15',65,NULL,4);
INSERT INTO KOCURY_w VALUES ('MICKA','D','LOLA','MILUSIA',(SELECT REF(O) FROM KOCURY_W O WHERE O.pseudo='TYGRYS'),'2009-10-14',25,47,1);

INSERT INTO KOCURY_w VALUES ('JACEK','M','PLACEK','LOWCZY',(SELECT REF(O) FROM KOCURY_W O WHERE O.pseudo='LYSY'),'2008-12-01',67,NULL,2);
INSERT INTO KOCURY_w VALUES ('BARI','M','RURA','LAPACZ',(SELECT REF(O) FROM KOCURY_W O WHERE O.pseudo='LYSY'),'2009-09-01',56,NULL,2);
INSERT INTO KOCURY_w VALUES ('LUCEK','M','ZERO','KOT',(SELECT REF(O) FROM KOCURY_W O WHERE O.pseudo='KURKA'),'2010-03-01',43,NULL,3);
INSERT INTO KOCURY_w VALUES ('SONIA','D','PUSZYSTA','MILUSIA',(SELECT REF(O) FROM KOCURY_W O WHERE O.pseudo='ZOMBI'),'2010-11-18',20,35,3);
INSERT INTO KOCURY_w VALUES ('LATKA','D','UCHO','KOT',(SELECT REF(O) FROM KOCURY_W O WHERE O.pseudo='RAFA'),'2011-01-01',40,NULL,4);
INSERT INTO KOCURY_w VALUES ('DUDEK','M','MALY','KOT',(SELECT REF(O) FROM KOCURY_W O WHERE O.pseudo='RAFA'),'2011-05-15',40,NULL,4);
INSERT INTO KOCURY_w VALUES ('ZUZIA','D','SZYBKA','LOWCZY',(SELECT REF(O) FROM KOCURY_W O WHERE O.pseudo='LYSY'),'2006-07-21',65,NULL,2);
INSERT INTO KOCURY_w VALUES ('PUNIA','D','KURKA','LOWCZY',(SELECT REF(O) FROM KOCURY_W O WHERE O.pseudo='ZOMBI'),'2008-01-01',61,NULL,3);
INSERT INTO KOCURY_w VALUES ('BELA','D','LASKA','MILUSIA',(SELECT REF(O) FROM KOCURY_W O WHERE O.pseudo='LYSY'),'2008-02-01',24,28,2);
INSERT INTO KOCURY_w VALUES ('KSAWERY','M','MAN','LAPACZ',(SELECT REF(O) FROM KOCURY_W O WHERE O.pseudo='RAFA'),'2008-07-12',51,NULL,4);
INSERT INTO KOCURY_w VALUES ('MELA','D','DAMA','LAPACZ',(SELECT REF(O) FROM KOCURY_W O WHERE O.pseudo='RAFA'),'2008-11-01',51,NULL,4);


INSERT INTO PLEBS_W VALUES (Plebs(12, (SELECT REF(O) FROM KOCURY_W O WHERE O.pseudo='MALA')));
INSERT INTO PLEBS_W VALUES (Plebs(3, (SELECT REF(O) FROM KOCURY_W O WHERE O.pseudo='LASKA'))); 
INSERT INTO PLEBS_W VALUES (Plebs(4, (SELECT REF(O) FROM KOCURY_W O WHERE O.pseudo='MAN')));  
INSERT INTO PLEBS_W VALUES (Plebs(6, (SELECT REF(O) FROM KOCURY_W O WHERE O.pseudo='PLACEK'))); 
INSERT INTO PLEBS_W VALUES (Plebs(1, (SELECT REF(O) FROM KOCURY_W O WHERE O.pseudo='SZYBKA'))); 
INSERT INTO PLEBS_W VALUES (Plebs(2, (SELECT REF(O) FROM KOCURY_W O WHERE O.pseudo='BOLEK'))); 
INSERT INTO PLEBS_W VALUES (Plebs(7, (SELECT REF(O) FROM KOCURY_W O WHERE O.pseudo='RURA')));
INSERT INTO PLEBS_W VALUES (Plebs(11, (SELECT REF(O) FROM KOCURY_W O WHERE O.pseudo='MALY')));
INSERT INTO PLEBS_W VALUES (Plebs(8, (SELECT REF(O) FROM KOCURY_W O WHERE O.pseudo='ZERO'))); 
INSERT INTO PLEBS_W VALUES (Plebs(9, (SELECT REF(O) FROM KOCURY_W O WHERE O.pseudo='PUSZYSTA'))); 
INSERT INTO PLEBS_W VALUES (Plebs(10, (SELECT REF(O) FROM KOCURY_W O WHERE O.pseudo='UCHO'))); 


INSERT INTO ELITA_W VALUES (Elita(1, (SELECT REF(O) FROM KOCURY_W O WHERE O.pseudo='TYGRYS'),'HRABIA', (SELECT REF(sluga) FROM PLEBS_W sluga WHERE sluga.id_plebs=1)));
INSERT INTO ELITA_W VALUES (Elita(2, (SELECT REF(O) FROM KOCURY_W O WHERE O.pseudo='LOLA'),'BARON', (SELECT REF(sluga) FROM PLEBS_W sluga WHERE sluga.id_plebs=2)));
INSERT INTO ELITA_W VALUES (Elita(3, (SELECT REF(O) FROM KOCURY_W O WHERE O.pseudo='ZOMBI'),'HRABIA' ,(SELECT REF(sluga) FROM PLEBS_W sluga WHERE sluga.id_plebs=3)));
INSERT INTO ELITA_W VALUES (Elita(4, (SELECT REF(O) FROM KOCURY_W O WHERE O.pseudo='LYSY'),'BARON', (SELECT REF(sluga) FROM PLEBS_W sluga WHERE sluga.id_plebs=4)));
INSERT INTO ELITA_W VALUES (Elita(5, (SELECT REF(O) FROM KOCURY_W O WHERE O.pseudo='KURKA'),'BARON', (SELECT REF(sluga) FROM PLEBS_W sluga WHERE sluga.id_plebs=5)));
INSERT INTO ELITA_W VALUES (Elita(6, (SELECT REF(O) FROM KOCURY_W O WHERE O.pseudo='RAFA'),'BARON', (SELECT REF(sluga) FROM PLEBS_W sluga WHERE sluga.id_plebs=6)));
INSERT INTO ELITA_W VALUES (Elita(7, (SELECT REF(O) FROM KOCURY_W O WHERE O.pseudo='DAMA'),'BARON', (SELECT REF(sluga) FROM PLEBS_W sluga WHERE sluga.id_plebs=7)));



INSERT INTO KONTO_W VALUES (1,(SELECT REF(O) FROM ELITA_W O WHERE O.id_elita=1), SYSDATE, NULL); 
INSERT INTO KONTO_W VALUES (2,(SELECT REF(O) FROM ELITA_W O WHERE O.id_elita=2), SYSDATE, NULL); 
INSERT INTO KONTO_W VALUES (3,(SELECT REF(O) FROM ELITA_W O WHERE O.id_elita=3), SYSDATE, NULL); 
INSERT INTO KONTO_W VALUES (4,(SELECT REF(O) FROM ELITA_W O WHERE O.id_elita=4), SYSDATE, NULL); 
INSERT INTO KONTO_W VALUES (5,(SELECT REF(O) FROM ELITA_W O WHERE O.id_elita=5), SYSDATE, NULL); 
INSERT INTO KONTO_W VALUES (6,(SELECT REF(O) FROM ELITA_W O WHERE O.id_elita=6), SYSDATE, NULL); 
INSERT INTO KONTO_W VALUES (7,(SELECT REF(O) FROM ELITA_W O WHERE O.id_elita=7), SYSDATE, NULL);
INSERT INTO KONTO_W VALUES (8,(SELECT REF(O) FROM ELITA_W O WHERE O.id_elita=7), SYSDATE, NULL); 
INSERT INTO KONTO_W VALUES (9,(SELECT REF(O) FROM ELITA_W O WHERE O.id_elita=6), SYSDATE, NULL); 
INSERT INTO KONTO_W VALUES (10,(SELECT REF(O) FROM ELITA_W O WHERE O.id_elita=5), SYSDATE, NULL); 
INSERT INTO KONTO_W VALUES (11,(SELECT REF(O) FROM ELITA_W O WHERE O.id_elita=3), SYSDATE, NULL);
INSERT INTO KONTO_W VALUES (12,(SELECT REF(O) FROM ELITA_W O WHERE O.id_elita=2), SYSDATE, NULL); 
INSERT INTO KONTO_W VALUES (13,(SELECT REF(O) FROM ELITA_W O WHERE O.id_elita=1), SYSDATE, NULL);




---- 19a dla werjsi z typami i widokami
--------przyklady--------- --- dodatkowo wyswietlic liczbe myszy elity ,plci meskiej

SELECT el.GetPseudo()"SZLACHCIC",el.GetSluga() " MA SLUGE" FROM ELITA_W el WHERE ID_ELITA=1;

SELECT el.GetPseudo()"SZLACHCIC",DEREF(el.sluga).GetPseudoP() " MA SLUGE" FROM ELITA_W el WHERE ID_ELITA=1;


SELECT DEREF(el.KOT).pseudo
    FROM  ELITA_W el
    WHERE el.ID_ELITA IN (SELECT x.ID_ELITA FROM ELITA_W x WHERE x.TYTUL_SZLACHECKI='BARON');
    
SELECT DEREF(k.wlasciciel).kot.GetPseudo() "WLASICICEL",COUNT(*) "ILOSC KONT"
    FROM  KONTO_W k
    GROUP BY DEREF(k.WLASCICIEL).kot.GetPseudo();


----ZAD 17 ---

SELECT K.PSEUDO "POLUJE W POLU",K.przydzial_myszy "PRZYDZIAL MYSZY", (SELECT B.NAZWA FROM BANDY B WHERE K.NR_BANDY=B.NR_BANDY) "BANDA"
FROM KOCURY_W K 
WHERE K.NR_BANDY IN (SELECT NR_BANDY FROM BANDY WHERE (TEREN='CALOSC' OR TEREN='POLE')) AND K.PRZYDZIAL_MYSZY>50
ORDER BY K.PRZYDZIAL_MYSZY DESC;

----ZAD 22 ----
SELECT K.FUNKCJA "FUNKCJA", K.PSEUDO "PSEUDONIM KOTA",COUNT(*) "LICZBA WROGOW"
    FROM Kocury_W K JOIN Wrogowie_Kocurow WK ON K.PSEUDO=WK.PSEUDO
    GROUP BY K.PSEUDO,K.FUNKCJA
    HAVING COUNT(*)>1;
    
    
-----ZAD 34-----

SET SERVEROUTPUT ON;
DECLARE
    funkcja_input VARCHAR2(50) ;
    ilosc NUMBER(10);
BEGIN
    funkcja_input := '&PODAJFUNKCJE';
    SELECT COUNT(*) INTO ilosc FROM KOCURY_W KW WHERE KW.FUNKCJA=funkcja_input;    
    IF(ilosc>0)
    THEN DBMS_OUTPUT.PUT_LINE('Znaleziono');
    ELSE DBMS_OUTPUT.PUT_LINE('Nie znaleziono');
    END IF;
END;

    
-----ZAD 37 -----

DECLARE
  itr NUMBER := 0;
BEGIN
  DBMS_OUTPUT.put_line('Nr   Pseudonim   Zjada ');
  DBMS_OUTPUT.put_line('-----------------------');
  FOR element IN (SELECT
                 x.GetPseudo() ps,
                 nvl(x.przydzial_myszy, 0) + nvl(x.myszy_extra, 0) zjada
               FROM Kocury_w x
               ORDER BY 2 DESC)
  LOOP
    itr := itr + 1;
    DBMS_OUTPUT.put_line(itr || '    ' || rpad(element.ps, 9, ' ') || '   ' || element.zjada);
    EXIT WHEN itr = 5;
  END LOOP;
END;


-----48-----


DROP TABLE KONTO_R;
DROP TABLE ELITA_R;
DROP TABLE PLEBS_R;

CREATE TABLE PLEBS_R (
  id_plebs NUMBER CONSTRAINT pr_id_pk PRIMARY KEY,
  kot VARCHAR2(15) CONSTRAINT pr_kt_ref REFERENCES Kocury(pseudo)
);
  
CREATE TABLE ELITA_R (
  id_elita NUMBER CONSTRAINT er_id_pk PRIMARY KEY,
  kot VARCHAR(15) CONSTRAINT er_kt_ref REFERENCES Kocury(pseudo),
  tytul_szlachecki VARCHAR(50) CONSTRAINT er_ts_ck CHECK(tytul_szlachecki IN ('HRABIA','BARON')),
  sluga NUMBER CONSTRAINT er_sg_ref REFERENCES PLEBS_R(id_plebs)
);

CREATE TABLE KONTO_R (
  nr_konta NUMBER CONSTRAINT kr_nk_pk PRIMARY KEY, 
  wlasciciel NUMBER CONSTRAINT const_pk_catch_kot REFERENCES ELITA_R(id_elita), 
  data_wprowadzenia DATE, 
  data_usuniecia DATE,
  CONSTRAINT dw_du CHECK(data_wprowadzenia <= data_usuniecia),
  CONSTRAINT dw_nn CHECK(data_wprowadzenia IS NOT NULL)
);


INSERT INTO PLEBS_R VALUES (12, 'MALA');
INSERT INTO PLEBS_R VALUES (3, 'LASKA'); 
INSERT INTO PLEBS_R VALUES (4, 'MAN');  
INSERT INTO PLEBS_R VALUES (6, 'PLACEK'); 
INSERT INTO PLEBS_R VALUES (1, 'SZYBKA'); 
INSERT INTO PLEBS_R VALUES (2, 'BOLEK'); 
INSERT INTO PLEBS_R VALUES (7, 'RURA');
INSERT INTO PLEBS_R VALUES (11, 'MALY');
INSERT INTO PLEBS_R VALUES (8, 'ZERO'); 
INSERT INTO PLEBS_R VALUES (9, 'PUSZYSTA'); 
INSERT INTO PLEBS_R VALUES (10, 'UCHO'); 


INSERT INTO ELITA_R VALUES (1, 'TYGRYS','HRABIA',1);
INSERT INTO ELITA_R VALUES (2, 'LOLA','BARON', 2);
INSERT INTO ELITA_R VALUES (3, 'ZOMBI','HRABIA' ,3);
INSERT INTO ELITA_R VALUES (4, 'LYSY','BARON', 4);
INSERT INTO ELITA_R VALUES (5, 'KURKA','BARON',8);
INSERT INTO ELITA_R VALUES (6,'RAFA','BARON', 6);
INSERT INTO ELITA_R VALUES (7, 'DAMA','BARON', 7);



INSERT INTO KONTO_R VALUES (1,1, SYSDATE, NULL); 
INSERT INTO KONTO_R VALUES (2,2, SYSDATE, NULL); 
INSERT INTO KONTO_R VALUES (3,3, SYSDATE, NULL); 
INSERT INTO KONTO_R VALUES (4,4, SYSDATE, NULL); 
INSERT INTO KONTO_R VALUES (5,5, SYSDATE, NULL); 
INSERT INTO KONTO_R VALUES (6,6, SYSDATE, NULL); 
INSERT INTO KONTO_R VALUES (7,7, SYSDATE, NULL);
INSERT INTO KONTO_R VALUES (8,7, SYSDATE, NULL); 
INSERT INTO KONTO_R VALUES (9,6, SYSDATE, NULL); 
INSERT INTO KONTO_R VALUES (10,5, SYSDATE, NULL); 
INSERT INTO KONTO_R VALUES (11,3, SYSDATE, NULL);
INSERT INTO KONTO_R VALUES (12,2, SYSDATE, NULL); 
INSERT INTO KONTO_R VALUES (13,1, SYSDATE, NULL);





CREATE OR REPLACE TYPE KOCURY_V2 AS OBJECT
(
  imie VARCHAR2(15),
  plec VARCHAR2(1),
  pseudo VARCHAR2(15),
  funkcja VARCHAR2(10),
  szef VARCHAR2(20),
  w_stadku_od DATE,
  przydzial_myszy NUMBER(3),
  myszy_extra NUMBER(3),
  nr_bandy NUMBER(2),
  MAP MEMBER FUNCTION GetPseudo RETURN VARCHAR2,
  MEMBER FUNCTION MaSzefa RETURN BOOLEAN,
  MEMBER FUNCTION LataStazu RETURN VARCHAR2 
  
  
)

CREATE OR REPLACE TYPE BODY KOCURY_V2 IS

    MAP MEMBER FUNCTION GetPseudo RETURN VARCHAR2 IS
    BEGIN     
        RETURN pseudo;
    END;
    
    MEMBER FUNCTION MaSzefa RETURN BOOLEAN IS
    BEGIN
        RETURN szef IS NOT NULL;
    END;
    
    MEMBER FUNCTION LataStazu RETURN VARCHAR2 IS
    aktualnyRok NUMBER;
    BEGIN
        SELECT EXTRACT(YEAR FROM SYSDATE)INTO aktualnyRok FROM DUAL;
        RETURN aktualnyRok - EXTRACT(YEAR FROM w_stadku_od);
    END;
END;



CREATE OR REPLACE TYPE Plebs_V2 AS OBJECT (
  id_plebs NUMBER(5),
  kot REF Kocury_V2,
  
  MAP MEMBER FUNCTION GetPseudoP RETURN VARCHAR2,
  MEMBER FUNCTION GetKot RETURN Kocury_V2
);

CREATE OR REPLACE TYPE BODY Plebs_V2 IS
  MAP MEMBER FUNCTION GetPseudoP RETURN VARCHAR2 IS
    kocur Kocury_V2;
  BEGIN
    SELECT DEREF(kot) INTO kocur FROM DUAL;
    RETURN kocur.pseudo;
  END;
    MEMBER FUNCTION GetKot RETURN Kocury_V2 IS
    kocur KOCURY_V2;
  BEGIN
    SELECT DEREF(kot) INTO kocur FROM DUAL;
    RETURN kocur;
  END;
  

END;











CREATE OR REPLACE TYPE ELITA_V2 AS OBJECT
(
    id_elita NUMBER(5),
    kot REF KOCURY_V2,
    tytul_szlachecki VARCHAR(20),
    sluga REF PLEBS_V2,
    MAP MEMBER FUNCTION GetPseudo RETURN VARCHAR2,
    MEMBER FUNCTION GetSluga RETURN VARCHAR2
)

CREATE OR REPLACE TYPE BODY ELITA_V2 IS
   
    MAP MEMBER FUNCTION GetPseudo RETURN VARCHAR2 IS
        kot_elita KOCURY_V2;
    BEGIN 
       SELECT DEREF(kot) INTO kot_elita FROM DUAL;
        RETURN kot_elita.pseudo;
    END;
    
    MEMBER FUNCTION GetSluga RETURN VARCHAR2 IS
    kot_plebs PLEBS_V2;
    BEGIN
        SELECT DEREF(sluga) INTO kot_plebs FROM DUAL;
        RETURN kot_plebs.GetPseudoP();
    END;
END;


CREATE OR REPLACE TYPE KONTO_V2 AS OBJECT
(
    numer_konta NUMBER,
    wlasciciel REF ELITA_V2,
    data_wprowadzenia DATE, 
    data_usuniecia DATE,
    MAP MEMBER FUNCTION GetID RETURN NUMBER,
    MEMBER FUNCTION CzasNaKoncie RETURN NUMBER
)

CREATE OR REPLACE TYPE BODY KONTO_V2 IS 
    
    MAP MEMBER FUNCTION GetID RETURN NUMBER IS
    BEGIN
    RETURN numer_konta;
    END;
    
    MEMBER FUNCTION CzasNaKoncie RETURN NUMBER IS
    BEGIN
    IF data_usuniecia IS NULL THEN
      RETURN SYSDATE - data_wprowadzenia;
    ELSE
      RETURN data_usuniecia - data_wprowadzenia;
    END IF;
    END;
END;


---FORCE

FORCE CREATE OR REPLACE VIEW Kocury_NOWY Of Kocury_o WITH OBJECT OID (pseudo) AS 
SELECT
  imie,
  plec,
  pseudo,
  funkcja,
  szef,
  w_stadku_od,
  przydzial_myszy,
  myszy_extra,
  nr_bandy
FROM Kocury;


CREATE OR REPLACE VIEW Plebs_V OF Plebs_V2 
WITH OBJECT IDENTIFIER (id_plebs) AS 
SELECT
  id_plebs, 
  MAKE_REF(Kocury_V, kot) kot 
FROM Plebs_R;


CREATE OR REPLACE VIEW Elita_V OF Elita_V2
WITH OBJECT IDENTIFIER (id_elita) AS 
SELECT
  id_elita, 
  MAKE_REF(Kocury_V,kot) kot,
  tytul_szlachecki,
  MAKE_REF(Plebs_V,sluga) sluga 
FROM ELITA_R;


CREATE OR REPLACE VIEW Konto_V OF Konto_V2
WITH OBJECT IDENTIFIER (numer_konta)AS 
SELECT
  nr_konta,
  MAKE_REF(Elita_V, wlasciciel) wlasciciel,
  data_wprowadzenia,
  data_usuniecia
FROM KONTO_R;





--------przyklady---------

SELECT el.GetPseudo()"SZLACHCIC",el.GetSluga() " MA SLUGE" FROM ELITA_V el WHERE ID_ELITA=1;

SELECT el.GetPseudo()"SZLACHCIC",DEREF(el.sluga).GetPseudoP() " MA SLUGE" FROM ELITA_V el WHERE ID_ELITA=1;


SELECT DEREF(el.KOT).pseudo
    FROM  ELITA_W el
    WHERE el.ID_ELITA IN (SELECT x.ID_ELITA FROM ELITA_V x WHERE x.TYTUL_SZLACHECKI='BARON');
    
SELECT DEREF(k.wlasciciel).kot.GetPseudo() "WLASICICEL",COUNT(*) "ILOSC KONT"
    FROM  KONTO_V k
    GROUP BY DEREF(k.WLASCICIEL).kot.GetPseudo();


----ZAD 17 ---

SELECT K.PSEUDO "POLUJE W POLU",K.przydzial_myszy "PRZYDZIAL MYSZY", (SELECT B.NAZWA FROM BANDY B WHERE K.NR_BANDY=B.NR_BANDY) "BANDA"
FROM KOCURY_V K 
WHERE K.NR_BANDY IN (SELECT NR_BANDY FROM BANDY WHERE (TEREN='CALOSC' OR TEREN='POLE')) AND K.PRZYDZIAL_MYSZY>50
ORDER BY K.PRZYDZIAL_MYSZY DESC;

----ZAD 22 ----
SELECT K.FUNKCJA "FUNKCJA", K.PSEUDO "PSEUDONIM KOTA",COUNT(*) "LICZBA WROGOW"
    FROM Kocury_V K JOIN Wrogowie_Kocurow WK ON K.PSEUDO=WK.PSEUDO
    GROUP BY K.PSEUDO,K.FUNKCJA
    HAVING COUNT(*)>1;
    
    
-----ZAD 34-----

SET SERVEROUTPUT ON;
DECLARE
    funkcja_input VARCHAR2(50) ;
    ilosc NUMBER(10);
BEGIN
    funkcja_input := '&PODAJFUNKCJE';
    SELECT COUNT(*) INTO ilosc FROM KOCURY_V KW WHERE KW.FUNKCJA=funkcja_input;    
    IF(ilosc>0)
    THEN DBMS_OUTPUT.PUT_LINE('Znaleziono');
    ELSE DBMS_OUTPUT.PUT_LINE('Nie znaleziono');
    END IF;
END;

    
-----ZAD 37 -----

DECLARE
  itr NUMBER := 0;
BEGIN
  DBMS_OUTPUT.put_line('Nr   Pseudonim   Zjada ');
  DBMS_OUTPUT.put_line('-----------------------');
  FOR element IN (SELECT
                 x.GetPseudo() ps,
                 nvl(x.przydzial_myszy, 0) + nvl(x.myszy_extra, 0) zjada
               FROM Kocury_V x
               ORDER BY 2 DESC)
  LOOP
    itr := itr + 1;
    DBMS_OUTPUT.put_line(itr || '    ' || rpad(element.ps, 9, ' ') || '   ' || element.zjada);
    EXIT WHEN itr = 5;
  END LOOP;
END;




-----49-----

------------- pamietac ze na wersji 11 nie dziala 

set serveroutput on;
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

DECLARE
KWER VARCHAR2(2000) := 'CREATE TABLE MYSZY(
 nr_myszy NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY CONSTRAINT my_id_pk PRIMARY KEY,
 lowca VARCHAR2(15) CONSTRAINT my_lw_ref REFERENCES KOCURY(pseudo),
 zjadacz VARCHAR2(15) CONSTRAINT my_zj_ref REFERENCES KOCURY(pseudo),
 waga_myszy NUMBER(3) CONSTRAINT my_wg_ck CHECK (waga_myszy BETWEEN 8 AND 15),
 data_zlowienia DATE CONSTRAINT my_dz_nn NOT NULL,
 data_wydania DATE,
 CONSTRAINT my_dzdw_ck CHECK (data_zlowienia <= data_wydania))';
BEGIN
 execute immediate KWER;
EXCEPTION
 when others then
 DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;





set serveroutput on;
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

DECLARE

 TYPE KocuryRec IS RECORD (PSEUDO KOCURY.PSEUDO%TYPE, MYSZY NUMBER);
 TYPE PseudoMyszy IS TABLE OF KocuryRec INDEX BY BINARY_INTEGER;
 KotyPsMy PseudoMyszy;
 
 TYPE MyszyT IS TABLE OF MYSZY%ROWTYPE INDEX BY BINARY_INTEGER;
 MYSZY_C MyszyT;
 
 TYPE KotyWydanie IS RECORD (PSEUDO KOCURY.PSEUDO%TYPE);
 TYPE KotyWydTab IS TABLE OF KotyWydanie INDEX BY BINARY_INTEGER;
 KotyWyd KotyWydTab;
  
 data_zlow MYSZY.DATA_ZLOWIENIA%TYPE;
 
 OSTSRODAMIES DATE := (NEXT_DAY(LAST_DAY(TO_DATE('2004-01-01'))-7, 'Wednesday'));
 PIERWSZYDZIEN DATE := TO_DATE('2004-01-01');
 DATA_EWIDENCJI DATE := TO_DATE('2019-01-03');
 
 counter NUMBER:= 0;
 
 pseudo_lowcy Myszy.lowca%type;
 waga_myszy Myszy.waga_myszy%type;
 pseudo_zjadacz Myszy.zjadacz%type;
 pointer_first NUMBER;
 pointer_last NUMBER;
 
BEGIN

 WHILE PIERWSZYDZIEN <= DATA_EWIDENCJI
 LOOP
 
  
 
    SELECT pseudo, przydzial_myszy+nvl(myszy_extra,0) myszy BULK COLLECT INTO KotyPsMy FROM KOCURY WHERE W_STADKU_OD < PIERWSZYDZIEN order by 2 desc;  
  
    SELECT SUM(NVL(przydzial_myszy,0) + NVL(myszy_extra,0)) INTO counter FROM KOCURY WHERE W_STADKU_OD < PIERWSZYDZIEN; 
    
    SELECT COUNT(*) INTO pointer_first FROM MYSZY;
    
    pointer_last:= pointer_first + counter;

    FOR I IN 1..counter
    LOOP
     data_zlow := PIERWSZYDZIEN + ROUND(DBMS_RANDOM.VALUE(1,27));
     
     IF data_zlow > DATA_EWIDENCJI THEN
        data_zlow:= DATA_EWIDENCJI;
        END IF;
        
    pseudo_lowcy:=KotyPsMy(ROUND(DBMS_RANDOM.VALUE(1, KotyPsMy.COUNT))).pseudo;
    waga_myszy := ROUND(DBMS_RANDOM.VALUE(8, 15));
    
     INSERT INTO Myszy(lowca, zjadacz, waga_myszy, data_zlowienia, data_wydania)
      VALUES (
        pseudo_lowcy,
        NULL,
        waga_myszy,
        data_zlow,
        NULL
      ); 
      
     END LOOP;
   
     counter:= 0;
     FOR I in 1..KotyPsMy.COUNT
     LOOP
        FOR J in 1..KotyPsMy(I).myszy
        LOOP
        KotyWyd(counter).PSEUDO:= KotyPsMy(I).pseudo;
        counter:=counter+1;
        END LOOP;
     END LOOP;
      
             
    
    IF OSTSRODAMIES <= DATA_EWIDENCJI THEN 
    SELECT * BULK COLLECT INTO MYSZY_C FROM Myszy WHERE DATA_ZLOWIENIA < OSTSRODAMIES and ZJADACZ IS NULL; 
    FOR I IN pointer_first+1..pointer_last
    LOOP
        pseudo_zjadacz:=KotyWyd((I - pointer_first) -1).PSEUDO;		
        update myszy set zjadacz=pseudo_zjadacz, data_wydania=OSTSRODAMIES where nr_myszy=I;
    END LOOP;
    END IF;

    PIERWSZYDZIEN := OSTSRODAMIES + 1; 
    OSTSRODAMIES := (NEXT_DAY(LAST_DAY(ADD_MONTHS(OSTSRODAMIES,1))-7, 'Wednesday'));
    
 END LOOP;

EXCEPTION
 WHEN OTHERS THEN
 DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;




select lowca, count(lowca) from myszy group by lowca;

select * from myszy where waga_myszy = 10;

truncate table myszy;










DECLARE
 KWER_ALL VARCHAR2(2000);
BEGIN
 FOR kot IN (select pseudo from kocury)
 LOOP
 KWER_ALL:='CREATE TABLE MYSZY' || kot.pseudo ||'(
 nr_myszy NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY CONSTRAINT k_n_pk' || kot.pseudo || ' PRIMARY KEY,
 waga_myszy NUMBER(3) CONSTRAINT k_w_ck' || kot.pseudo ||' CHECK (waga_myszy BETWEEN 8 AND 15),
 data_zlowienia DATE CONSTRAINT k_dz_nn' || kot.pseudo ||' NOT NULL)';
 EXECUTE IMMEDIATE KWER_ALL;
 END LOOP;
EXCEPTION
 WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE(sqlerrm);
END;




DECLARE
 KWER_ALL varchar2(2000);
BEGIN
 FOR kot IN (select pseudo from kocury)
 LOOP
 KWER_ALL:='DROP TABLE MYSZY' || kot.pseudo;
 EXECUTE IMMEDIATE KWER_ALL;
 END LOOP;
EXCEPTION
 WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE(sqlerrm);
END;








ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

CREATE OR REPLACE PROCEDURE WPROWADZ_MYSZ(pseudo_k KOCURY.PSEUDO%TYPE, data_lowow date) AS

  KOTY_COUNTER NUMBER;
  KWER VARCHAR2(2000);
  
  TYPE MYSZY_TAB IS TABLE OF MYSZY%ROWTYPE INDEX BY BINARY_INTEGER;
  TABMYSZY MYSZY_TAB;
  
  TYPE MYSZ_REC IS RECORD (NR_MYSZY MYSZY.NR_MYSZY%TYPE, WAGA_MYSZY MYSZY.WAGA_MYSZY%TYPE, DATA_ZLOWIENIA MYSZY.DATA_ZLOWIENIA%TYPE);
  TYPE MYSZYKOTA IS TABLE OF MYSZ_REC INDEX BY BINARY_INTEGER;
  MYSZYLOWCY MYSZYKOTA;
  
  KOCUR_NULL EXCEPTION;
  
BEGIN

  SELECT COUNT(*) INTO KOTY_COUNTER FROM KOCURY WHERE PSEUDO = pseudo_k;
  
  IF KOTY_COUNTER = 0 THEN
    RAISE KOCUR_NULL;
  END IF;
  
  KWER:='SELECT * FROM MYSZY'||pseudo_k||' WHERE data_zlowienia = ''' || data_lowow || '''';
  
  EXECUTE IMMEDIATE KWER BULK COLLECT INTO MYSZYLOWCY;
  DBMS_OUTPUT.PUT_LINE(MYSZYLOWCY.COUNT);
  
    FOR i IN 1..MYSZYLOWCY.count
    LOOP
    
    TABMYSZY(i).WAGA_MYSZY := MYSZYLOWCY(i).WAGA_MYSZY;
    TABMYSZY(i).DATA_ZLOWIENIA := MYSZYLOWCY(i).DATA_ZLOWIENIA;
    
    INSERT INTO MYSZY(LOWCA, ZJADACZ, WAGA_MYSZY, DATA_ZLOWIENIA, DATA_WYDANIA)
    VALUES(pseudo_k, null, TABMYSZY(i).WAGA_MYSZY, TABMYSZY(i).DATA_ZLOWIENIA, null);
    
   END LOOP;
    
    
    KWER:='DELETE FROM MYSZY'||pseudo_k||' WHERE data_zlowienia = ''' || data_lowow || '''';
    EXECUTE IMMEDIATE KWER;
     
  EXCEPTION
    WHEN KOCUR_NULL THEN DBMS_OUTPUT.PUT_LINE('Kot o podanym pseudo nie istnieje');
    WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE(SQLERRM); 
END WPROWADZ_MYSZ;







CREATE OR REPLACE PROCEDURE WYPLATA AS

  kot_num NUMBER;
  mysz_num NUMBER;
  suma_myszy NUMBER;
  
  sroda_ost DATE := (next_day(last_day(sysdate)-7, 'Wednesday'));
  
  TYPE TAB_MYSZY IS TABLE OF myszy%rowtype INDEX BY BINARY_INTEGER;
  TabMyszy TAB_MYSZY;
  
  TYPE KotPs_Rec IS RECORD (pseudo kocury.pseudo%TYPE, myszy NUMBER(3));
  TYPE TAB_KOT IS TABLE OF KotPs_Rec INDEX BY BINARY_INTEGER;
  TabKoty TAB_KOT;
  
BEGIN

  SELECT * BULK COLLECT INTO TabMyszy
  FROM MYSZY
  WHERE zjadacz IS NULL;
  
  SELECT pseudo, przydzial_myszy + nvl(myszy_extra, 0) BULK COLLECT INTO TabKoty
  FROM kocury
  WHERE w_stadku_od <= (next_day(last_day(add_months( sysdate, -1))-7, 'Wednesday'))
  START WITH szef IS NULL
  CONNECT BY PRIOR pseudo=szef
  ORDER BY LEVEL ASC;
  
  kot_num := 1;
  mysz_num := 1;
  suma_myszy:=0;
  
  FOR I IN  1..TabKoty.COUNT
  LOOP
    suma_myszy := suma_myszy + TabKoty(I).MYSZY;
  END LOOP;
  
  WHILE mysz_num<=TabMyszy.COUNT AND suma_myszy>0
    LOOP
    
        IF TabKoty(kot_num).MYSZY > 0 THEN
          TabMyszy(mysz_num).zjadacz := TabKoty(kot_num).pseudo;
          TabMyszy(mysz_num).data_wydania := sroda_ost;
 
            UPDATE MYSZY
            SET data_wydania = TabMyszy(mysz_num).data_wydania, zjadacz = TabMyszy(mysz_num).zjadacz
            WHERE nr_myszy = TabMyszy(mysz_num).nr_myszy;
            
          TabKoty(kot_num).MYSZY := TabKoty(kot_num).MYSZY - 1;
          suma_myszy:=suma_myszy-1;
          mysz_num := mysz_num + 1;
        END IF;
        
      
        kot_num := kot_num + 1;
        IF kot_num > TabKoty.COUNT THEN
        kot_num:=1;
        END IF;
    
  END LOOP;
  
    
  EXCEPTION
    WHEN OTHERS THEN dbms_output.put_line(sqlerrm);
END WYPLATA;


SELECT * FROM MYSZY;

SELECT * from myszytygrys;

SELECT * FROM MYSZYTYGRYS;

truncate table myszy;


INSERT INTO myszytygrys(nr_myszy,waga_myszy,data_zlowienia)
VALUES 
(null,
 9,
SYSDATE);

INSERT INTO myszytygrys(nr_myszy,waga_myszy,data_zlowienia)
VALUES 
(null,
 13,
SysDate);


BEGIN
WPROWADZ_MYSZ2('TYGRYS',SYSDATE);
END;

BEGIN
WYPLATA;
END;

set serveroutput on;

