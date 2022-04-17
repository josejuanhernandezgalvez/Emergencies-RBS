(deftemplate problem
	(slot zone (type INTEGER))
	(slot type (type STRING))
	(slot people (type INTEGER))
	(slot state (type STRING))
	(slot danger (type STRING))
)

(defrule create_problem
    (not (esists problem))
    (problem (type ?t) (zone ?z))
    =>
    (assert (esits problem ?t))
)


(defrule send_troops
    (esists problem)
    (problem (type ?t) (zone ?z))
    =>
    (assert (send troops to zone ?z the problem is ?t))
)


(defrule send_troops
    (esists problem)
    (problem (type ?t) (zone ?z))
    =>
    (assert (send troops to zone ?z the problem is ?t))
)

