(deftemplate PR
	(slot zone (type INTEGER))
	(slot type (type INTEGER))
	(slot people (type INTEGER))
	(slot agressors (type INTEGER))
	(slot guns (type INTEGER))
)

(defrule fire_alert
    (declare (salience 1000))
    (PR (zone ?z) (type 3) (people ?p))
    =>
    (assert (Fire in sector ?z with ?p people injured))
)

(defrule injured_alert
    (PR (zone ?z) (type 2) (people ?p))
    =>
    (assert (Accident in sector ?z with ?p people injured))
)

(defrule heist_alert
    (PR (zone ?z) (type 1) (people ?p) (agressors ?a))
    =>
    (assert (Heist in sector ?z with ?p people in danger. There are ?a agressors))
)

(defrule there_are_guns
    (PR (guns 1)(type 1))
    =>
    (assert (Robbers armed be precautious))
)

(defrule send_troops_guns
    (PR (guns 1)(type 1)(agressors ?a)(people ?p))
    =>
    (assert (They have ?p hostages. Cops needed: (+ (* ?a 10) ?p)))
)

(defrule send_troops_withoutguns
    (PR (guns 0)(type 1)(agressors ?a)(people ?p))
    =>
    (assert (They have ?p hostages. Cops needed: (+ (* ?a 4) ?p)))
)

(defrule send_fire_fighters
    (PR (type 3)(people ?p))
    =>
    (assert (Fire trucks needed needed: (div ?p 4)))
)

(defrule injured_people
    (PR (type ?t) (people ?p))
    (test (> ?t 1))
    =>
    (assert (Ambulances needed: (+ 1 (div ?p 15))))
)

