;The state world of the problem representing a building including 7 areas in a restaurant. One of them are the BTA area which is the kitchen,
;The BTA area consosts of plates and unlimited food. the other areas can contain customers. 
;The robot needs to pick up a defined plate, fill it with food, and give it to a specified customer on a specified place. 

(define (domain Waiter_domain_3)
  (:requirements :adl :typing)
  (:predicates

    (at ?what ?where)
    (Served ?Customer)

    (Is_robot ?robot)
    (is_customer ?customer)
    (is_plate ?plate)
    (is_food ?food)
    (Adjacent ?a1 ?a2)

    (Empty_hands)
    
  )

  ;The robot r moves from area a1 to area a2.
  (:action move
    :parameters (?a1 ?a2 ?r)
    :precondition (and
      (at ?r ?a1) (or (Adjacent ?a1 ?a2) (Adjacent ?a2 ?a1)) (Is_robot ?r))
    :effect (and (not (at ?r ?a1)) 
      (at ?r ?a2) )
  )
  ;The robot r serves plate p with food f to customer c at area a
  (:action Present
    :parameters (?a ?r ?p ?c ?f)
    :precondition (and
      (at ?r ?a) (at ?c ?a) (at ?p ?r) (at ?f ?p) (Is_robot ?r) (is_customer ?c) (is_plate ?p) (is_food ?f))
    :effect (and (Served ?c) (at ?p ?a) (not (at ?p ?r)) (Empty_hands) )
      )
    ;The robot r picks plate p if it has not food f at are a.

    (:action Pick_up
    :parameters (?a ?p ?f ?r)
    :precondition (and
      (at ?r ?a) (at ?p ?a) (Empty_hands) (is_plate ?p) (is_food ?f) (Is_robot ?r))
    :effect (and (not(at ?p ?a)) (not (Empty_hands )) (at ?p ?r) (not(at ?f ?p)))
    )
    ;The robot r fills the plate p with food f at area a = BTA.
    (:action Fill
    :parameters (?a ?p ?f ?r)
    :precondition (and
      (at ?r ?a) (at ?f ?a) (at ?p ?r) (Is_robot ?r) (is_plate ?p) (is_food ?f)) 
    :effect (at ?f ?p)
      )
)