
;The state world of the problem representing a building including 7 areas in a restaurant. One of them are the BTA area which is the kitchen,
;The BTA area consosts of plates and unlimited food. the other areas can contain customers. 
;The robot needs to pick up a defined plate, fill it with food, and give it to a specified customer on a specified place. 

(define (domain Waiter_domain_2)
  (:requirements :strips :adl)
  (:predicates
    (Robot_location ?a)
    (Customer_location ?c ?a)
    (Served ?Customer)
    (Plate_location ?p ?a)
    (Have_food ?plate)
    (Adjacent ?a1 ?a2)
    (Holding ?p)
    (Empty_hands)
    (Food_location ?a)
  )
  ;The robot moves from area a1 to area a2.
  (:action move
    :parameters (?a1 ?a2)
    :precondition (and
      (Robot_location ?a1) (or (Adjacent ?a1 ?a2) (Adjacent ?a2 ?a1) ))
    :effect (and (not (Robot_location ?a1)) 
      (robot_location ?a2) )
  )
  ;The robot serves the plate p of food to the customer c at position a.
  (:action Present
    :parameters (?a ?c ?p)
    :precondition (and
      (Robot_location ?a) (Customer_location ?c ?a) (have_food ?p) (holding ?p) )
    :effect (and (Served ?c) (Plate_location ?p ?a ) (Empty_hands) (not (holding ?p)))
  )
    ;The robot picks up the plate p at area a. To make sure that the robot is not picking up served plates, and giving it to another customer it will not pick up plates with food.

    (:action Pick_up
    :parameters (?a ?p)
    :precondition (and
      (Robot_location ?a) (Plate_location ?p ?a ) (Empty_hands))
    :effect (and (not(plate_location ?a ?p)) (not (Empty_hands )) (Holding ?p) (not(have_food ?p)))
    )
      ;The robot fills the plate p with food at area BTA.
    (:action Fill
    :parameters (?a ?p)
    :precondition (and
      (Robot_location ?a) (Food_location ?a) (holding ?p))
    :effect (Have_food ?p)
      )
)