-- 1)creer une vue
CREATE VIEW Mon emploi 
AS SELECT DISTINCT T.jourCoursDate as JOURS,T.tranche AS HORAIRE, C.codeCours||C.credits||''||C.periodeAcademiqueIdTrim AS MATIERES,Cl.specialiteNomSpec as FILIERE  FROM Cours C
   JOIN Typehoraire T
    ON C.codeCours= T.crsCodeCours
    JOIN Jourcours J
    ON J.dateJourCours=T.jourCoursDate
    JOIN Coursdeclasse cls
    ON  T.crsCodeCours=cls.crsCodeCours
    JOIN Classe Cl
    ON cl.specialiteNomSpec=cls.classSpecialiteNomspec
   WHERE T.jourCoursDate
   IN ('lundi','mardi','mercredi','jeudi','vendredi','samedi') ORDER BY T.jourCoursDate ASC;

--  2)ENREGISTRER UN MOT DE PASSE
SELECT courCodeCours FROM Etudiantdeclasse WHERE etudiantMatricule =&matricule; : les matiere d’un etudiants
SELECT crsCodeCours FROM Coursdeclasse WHERE classNiveauidNiveau=001 AND classSpecialiteNomspec='TIRSI' : lrs matiere de TIRSI niveau 1;
-- 3)script html
SET MARKUP HTML ON SPOOL ON PREFORMAT OFF ENTMAP ON -
HEAD "<TITLE>Department Report</TITLE> -
<STYLE type='text/css'> -
<!-- BODY {background: #FFFFC6} --> -
</STYLE>" –
 BODY "TEXT='#FF00Ff'" –
 TABLE "WIDTH='90%' BORDER='5'"
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