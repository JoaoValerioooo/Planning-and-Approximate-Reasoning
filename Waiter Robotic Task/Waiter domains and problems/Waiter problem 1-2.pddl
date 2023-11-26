
;The state world of the problem representing a building including 7 areas in a restaurant. One of them are the BTA area which is the kitchen,
;The BTA area consosts of unlimited plates and food. the other areas can contain up to one customer each. 
;The robot needs to pick up a plate, fill it with food, and give it to a customer on a specified place. 


(define (problem Waiter_1-2)
  (:domain Waiter_domain_1)
  (:objects
    BTA PUA AUA PMA AMA PLA ALA 
  )
  (:init
    ;(Robot_location AMA)
    (robot_at_BTA)
    ;Define location of each customer
    (location_has_customer PMA)
    ;(location_has_customer AUA)
    ;(location_has_customer AMA)
    ;(location_has_customer ALA)
    ;(location_has_customer PLA)
    ;(location_has_customer PUA)

    ;Define which room that is adjacent.
    (Adjacent PUA AUA)
    (Adjacent PMA PUA)
    (Adjacent PLA PMA)
    (Adjacent AMA AUA)
    (Adjacent PLA ALA)
    (Adjacent ALA AMA)
    (Adjacent_BTA AUA)

  )
  (:goal
    (and (robot_at_BTA)
     (Served PMA) ;(Served AUA) ;(Served PUA) 
     ;(Served PLA) (Served ALA) (Served AMA)
    )
  )
)