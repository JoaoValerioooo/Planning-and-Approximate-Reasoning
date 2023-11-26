
;The state world of the problem representing a building including 7 areas in a restaurant. One of them are the BTA area which is the kitchen,
;The BTA area consosts of plates and unlimited food. the other areas can contain customers. 
;The robot needs to pick up a defined plate, fill it with food, and give it to a specified customer on a specified place. 

(define (problem Waiter_3-4)
  (:domain Waiter_domain_3)
  (:objects
    BTA PUA AUA PMA AMA PLA ALA 
    P1 P2 P3; P4 P5 P6
    C1 C2 C3; C4 C5 C6
    Robot
    Food
  )
  (:init
    (at Robot BTA)

    (Empty_hands)
    (at Food BTA)

    ;Define location of each plate
    (at P1 BTA)
    (at P2 BTA)
    (at P3 BTA)
    ;(at P4 BTA)
    ;(at P5 BTA)
    ;(at P6 BTA)

    
    ;Define location of each customer
    (at C1 PMA)
    (at C2 AMA)
    (at C3 ALA)
    ;(at C4 PLA)
    ;(at C5 AUA)
    ;(at C6 PUA)

    ;Define which room that is adjacent.
    (Adjacent BTA AUA)
    (Adjacent PUA AUA)
    (Adjacent PMA PUA)
    (Adjacent PLA PMA)
    (Adjacent AMA AUA)
    (Adjacent PLA ALA)
    (Adjacent ALA AMA)

    ;Is stuff
    (is_customer C1)
    (is_customer C2)
    (is_customer C3)
    ;(is_customer C4)
    ;(is_customer C5)
    ;(is_customer C6)
    (is_plate P1)
    (is_plate P2)
    (is_plate P3)
    ;(is_plate P4)
    ;(is_plate P5)
    ;(is_plate P6)
    (Is_robot Robot)
    (Is_food Food)
    

  )
  (:goal
    (and (at Robot BTA) 
     (Served C1) (Served C2) (Served C3) 
     ;(Served C4) (Served C5) (Served C6)
    )
  )
)