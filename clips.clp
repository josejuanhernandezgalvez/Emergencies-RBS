(deftemplate PR
	(slot zone (type INTEGER))
	(slot type (type INTEGER))
	(slot people (type INTEGER))
	(slot guns (type INTEGER))
)

(defrule fire_alert
    (declare (salience 1000))
    (PR (zone ?z) (type 3) (people ?p))
    =>
    (assert (Alpha Danger in sector ?z with ?p people injured))
)

(defrule injured_alert
    (PR (zone ?z) (type 2) (people ?p))
    =>
    (assert (Accident Danger in sector ?z with ?p people injured))
)

(defrule heist_alert
    (PR (zone ?z) (type 1) (people ?p))
    =>
    (assert (Heist Danger in sector ?z with ?p people in danger))
)

(defrule there_are_guns
    (PR (guns 1)(type 1)(zone ?z))
    =>
    (assert (Robbers armed be precautious))
)

(defrule injured_people
    (PR (type ?t) (people ?p))
    (test (> ?t 1))
    =>
    (assert (Ambulances needed: (+ 1 (div ?p 10))))
)
