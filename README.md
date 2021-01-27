# timetable

SELECT DISTINCT T.jourCoursDate as jours ,
                  C.intituleCourt ||'('||C.codeCours||')' as cours ,
                    C.credits as credits_cours,
                    'trimestre'|| C.periodeAcademiqueIdTrim  as periode_trimestrielle,
                    ce.specialiteNomSpec || cd.classNiveauidNiveau as specialite,
                    T.tranche ||'heures' as tranche_horaire
FROM Cours C
JOIN Typehoraire T
ON C.codeCours= T.crsCodeCours
JOIN Jourcours j
ON J.dateJourCours=T.jourCoursDate
JOIN Coursdeclasse cd
ON  T.crsCodeCours=cd.crsCodeCours
JOIN Classe ce
ON ce.specialiteNomSpec=cd.classSpecialiteNomspec
INNER JOIN ClassePeriodeacademique ca
ON C.periodeAcademiqueIdTrim=ca.PERIODEACADEMIQUEIDTRIM
WHERE ce.specialiteNomSpec='TIPAM'
AND   cd.classNiveauidNiveau=002
ORDER BY T.jourCoursDate ASC

//QUESTION 3
CREATE VIEW emploisdetemps AS 
SELECT DISTINCT C.codeCours, T.jourCoursDate  FROM Cours C
JOIN Typehoraire T
ON C.codeCours= T.crsCodeCours
JOIN Jourcours J
ON J.dateJourCours=T.jourCoursDate
JOIN Coursdeclasse cls
ON  T.crsCodeCours=cls.crsCodeCours
JOIN Classe Cl
ON cl.specialiteNomSpec=cls.classSpecialiteNomspec
WHERE T.jourCoursDate 
IN ('lundi','mardi','mercredi','jeudi','vendredi','samedi')

//QUESTION 5
SET MARKUP HTML ON SPOOL ON PREFORMAT OFF ENTMAP ON -
HEAD "<TITLE>EMPLOI DE TEMPS</TITLE> -
<STYLE type='text/css'> -
<!-- BODY {background: #FFFFC6} --> -
</STYLE>" –
 BODY "TEXT='#FF00Ff'" –
 TABLE "WIDTH='100%' BORDER='9'"
SPOOL emploi.html
SELECT DISTINCT C.codeCours, T.jourCoursDate,T. TRANCHE,C.VOLUMEH FROM Cours C
JOIN Typehoraire T
ON C.codeCours= T.crsCodeCours
JOIN Jourcours J
ON J.dateJourCours=T.jourCoursDate
JOIN Coursdeclasse cls
ON T.crsCodeCours=cls.crsCodeCours
JOIN Classe Cl
ON cl.specialiteNomSpec=cls.classSpecialiteNomspec
 WHERE T.jourCoursDate
 IN ('lundi','mardi','mercredi','jeudi','vendredi','samedi') AND cls.classNiveauidNiveau=001 ;
SPOOL OFF
