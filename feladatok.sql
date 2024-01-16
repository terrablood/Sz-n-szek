Írja ki a Budapesten született színészek nevét és filmjeinek a számát!

SELECT nev, filmszam
FROM Sz
Where szulvaros = "Budapest"
;

Hány színész született az USA-ban?

SELECT Count(*)
FROM Sz
Where szulorszag = "USA"
;

Hány férfi színész született Magyarországon?

SELECT Count(*)
FROM Sz
Where szulorszag = "Magyarország" and nem
;

Hány férfi színész született Skóciában vagy Angliában?

SELECT Count(*)
FROM Sz
Where szulorszag = "Skócia" or szulorszag = "Anglia" 
;

Hány színész született 1970 és 1975 között angolszász nyelveterületen (USA, Anglia, Ausztrália)?

SELECT Count(*)
FROM Sz
Where szulorszag = "Ausztrália" or szulorszag = "Anglia" or szulorszag = "USA" and szulido between 1970 and 1975 
;

Írja ki a legfiatalabb színész(ek) nevét és születési évét!

SELECT Top 1 nev, szulido
FROM Sz
Order by szulido
;

Hány filmben játszott a legtöbb filmben szereplő színész?

SELECT Top 1 filmszam
FROM Sz
Order by filmszam desc
;

Hány filmben játszott a legtöbb filmben szereplő, Magyarországon született színész?

SELECT Top 1 filmszam
FROM Sz
Where szulorszag = "Magyarország"
Order by filmszam desc
;

Melyik évben született a legtöbb színész? Az évet és a színészek számát is írja ki!

SELECT top 1 year(szulido), count(*)
FROM Sz 
group by year(szulido)
order by count(*) desc
;

Melyek azok a napok, amikor több színész is ünnepli a születésnapját? (Vigyázat, két ember ünnepelheti ugyanaznap a születésnapját akkor is, ha nem egyidősek!)

SELECT t1.szulido
FROM Sz as t1, Sz as t2
Where t1.nev <> t2.nev and t1.szulido = t2.szulido
;


Van-e olyan nap, amikor 3 színész is ünnepli a születésnapját? Írja ki a színészek nevét és születési dátumait (6 mező)!

SELECT t1.szulido
FROM Sz as t1, Sz as t2, Sz as t3
Where t1.nev <> t2.nev and t1.szulido = t2.szulido and t3.szulido = t2.szulido and t3.nev <> t2.nev and t3.nev <> t1.nev
;