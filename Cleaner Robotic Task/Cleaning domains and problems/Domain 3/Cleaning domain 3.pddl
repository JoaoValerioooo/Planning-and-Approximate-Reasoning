;; The sliding-tile puzzle (i.e. the eight/fifteen/twentyfour puzzle).
;; Tile positions are encoded by the predicate (at <tile> <x> <y>), i.e.
;; using one object for horizontal position and one for vertical (there's
;; a separate predicate for the position of the blank). The predicates
;; "inc" and "dec" encode addition/subtraction of positions.


(define (domain Cleaning_domain_3)
  (:requirements :strips :adl)
  (:predicates
    (Robot_location ?o)
    (Box_location ?b ?o)
    (Dirty ?o)
    (Empty ?o)
    (Adjacent ?o1 ?o2)
  )

  (:action move
    :parameters (?o1 ?o2)
    :precondition (and
      (Robot_location ?o1)  (Adjacent ?o1 ?o2) )
    :effect (and (not (Robot_location ?o1)) 
      (robot_location ?o2) )
  )

  (:action Clean-office
    :parameters (?o)
    :precondition (and
      (Robot_location ?o) (Empty ?o) )
    :effect (not (Dirty ?o))
    )
  

  (:action Push
    :parameters (?b ?o1 ?o2)
    :precondition (and
      (Robot_location ?o1) (Box_location ?b ?o1) (Empty ?o2) 
      (Adjacent ?o1 ?o2) )
    :effect (and (not (Robot_location ?o1)) (not (Box_location ?b ?o1)) (not (Empty ?o2))
      (Robot_location ?o2) (Box_location ?b ?o2) (Empty ?o1))
  )
)