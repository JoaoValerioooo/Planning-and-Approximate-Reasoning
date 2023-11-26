;The state world of the problem representing a building including nine offices, between zero and eight boxes and one robot, 
;which is the task performer. 
;Particularly, each office is defined by two combinations of states (cleaned or dirty and empty or not empty). 
;The robot can move vertically or horizontally between adjacent offices. 
;Furthermore, it can move one box to an adjacent empty office.  

(define (problem Cleaning_2-2)
  (:domain Cleaning_domain_2)
  (:objects
    o1 o2 o3 o4 o5 o6 o7 o8 o9 ;ba bb bc bd be bf bg bh
  )
  (:init
    (Robot_location o2)

    ;Define location of each box
    ;(Box_location ba o7)
    ;(Box_location bb o6)
    ;(Box_location bc o3)
    ;(Box_location bd o4)
    ;(Box_location be o5)
    ;(Box_location bf o6)
    ;(Box_location bg o7)
    ;(Box_location bh o8)

    ;Define dirty offices
    (Dirty o1)
    ;(Dirty o2)
    (Dirty o3)
    ;(Dirty o4)
    ;(Dirty o5)
    ;(Dirty o6)
    (Dirty o7)
    ;(Dirty o8)
    ;(Dirty o9)

    ;Define offices without any box
    (Empty o1)
    (Empty o2)
    (Empty o3)
    (Empty o4)
    (Empty o5)
    (Empty o6)
    (Empty o7)
    (Empty o8)
    (Empty o9)

    ;Define which offices that is adjacent.
    (Adjacent o1 o2)
    (Adjacent o1 o4)
    (Adjacent o2 o3)
    (Adjacent o2 o5)
    (Adjacent o4 o5)
    (Adjacent o5 o6)
    (Adjacent o3 o6)
    (Adjacent o4 o7)
    (Adjacent o5 o8)
    (Adjacent o7 o8)
    (Adjacent o6 o9)
    (Adjacent o8 o9)

  )
  (:goal
    (and (Robot_location o5)  
      (not(Dirty o1)) (not(Dirty o2)) (not(Dirty o3)) (not(Dirty o4)) (not(Dirty o5)) (not(Dirty o6)) (not(Dirty o7)) (not(Dirty o8)) (not(Dirty o9))
    )
  )
)