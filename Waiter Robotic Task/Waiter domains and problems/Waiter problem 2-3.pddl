
;The state world of the problem representing a building including 7 areas in a restaurant. One of them are the BTA area which is the kitchen,
;The BTA area consosts of plates and unlimited food. the other areas can contain customers. 
;The robot needs to pick up a defined plate, fill it with food, and give it to a specified customer on a specified place. 

(define (problem Waiter_2-3
)
  (:domain Waiter_domain_2)
  (:objects
    BTA PUA AUA PMA AMA PLA ALA 
    P1 P2 ;P3 P4 P5 P6
    C1 C2 ;C3 C4 C5 C6
  )
  (:init
    (Robot_location BTA)

    (Empty_hands)
    (Food_location BTA)

    ;Define location of each plate
    (Plate_location P1 BTA)
    (Plate_location P2 BTA)
    ;(Plate_location P3 BTA)
    ;(Plate_location P4 BTA)
    ;(Plate_location P5 BTA)
    ;(Plate_location P6 BTA)
    
    ;Define location of each customer
    (Customer_location C1 PMA)
    (Customer_location C2 AMA)
    ;(Customer_location C3 AUA)
    ;(Customer_location C4 ALA)
    ;(Customer_location C5 PLA)
    ;(Customer_location C6 PUA)

    ;Define which room that is adjacent.
    (Adjacent BTA AUA)
    (Adjacent PUA AUA)
    (Adjacent PMA PUA)
    (Adjacent PLA PMA)
    (Adjacent AMA AUA)
    (Adjacent PLA ALA)
    (Adjacent ALA AMA)

  )
  (:goal
    (and (Robot_location BTA) 
     (Served C1) (Served C2) ;(Served C3) 
     ;(Served C4) (Served C5) (Served C6)
    )
  
)
)