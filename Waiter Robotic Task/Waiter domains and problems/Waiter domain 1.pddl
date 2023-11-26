
;The state world of the problem representing a building including 7 areas in a restaurant. One of them are the BTA area which is the kitchen,
;The BTA area consosts of unlimited plates and food. the other areas can contain up to one customer each. 
;The robot needs to pick up a plate, fill it with food, and give it to a customer on a specified place. 

(define (domain Waiter_domain_1)
  (:requirements :strips :adl)
  (:predicates
    (Robot_location ?a)
    (location_has_customer ?a)
    (Served ?a)
    (robot_at_BTA)
    (robot_holding_empty_plate)
    (robot_holding_filled_plate)
    (Adjacent ?a1 ?a2)
    (Adjacent_BTA ?a)
  )

  ;The robot moves from area a1 to area a2.
  (:action move_area
    :parameters (?a1 ?a2)
    :precondition (or
      (and (Robot_location ?a1) (or (Adjacent ?a1 ?a2) (Adjacent ?a2 ?a1))) 
      (and (Adjacent_BTA ?a2) (robot_at_BTA)) )
    :effect (and (not (Robot_location ?a1)) 
      (and (robot_location ?a2) (not (robot_at_BTA))))
  )
  ;the robot moves from area a to BTA
  (:action move_BTA
    :parameters (?a)
    :precondition (and
      (Robot_location ?a) (Adjacent_BTA ?a))
    :effect (and (not (Robot_location ?a)) 
      (robot_at_BTA) )
  )
  ;The robot serves food to the customer at area a
  (:action Present
    :parameters (?a)
    :precondition (and
      (Robot_location ?a) (location_has_customer ?a) (robot_holding_filled_plate) )
    :effect (and (Served ?a) (not (robot_holding_filled_plate)) (not (robot_at_BTA)))
    )
      
  ; the robot picks up an empty plate, as long as it is in the BTA area. 
  ;This  presupposes that there are always enough plates.
    (:action Pick_up
    :parameters ()
    :precondition (robot_at_BTA )
    :effect (robot_holding_empty_plate)
    )
    ;the robot serves the plate with food as long as it is in the BTA area.
    (:action Fill
    :parameters ()
    :precondition (and
      (robot_at_BTA) (robot_holding_empty_plate))
    :effect (and (robot_holding_filled_plate) (not(robot_holding_empty_plate)))
      )
)