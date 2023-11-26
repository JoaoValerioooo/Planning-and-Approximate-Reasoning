;The state world of the problem representing a building including nine offices, between zero and eight boxes and one robot, 
;which is the task performer. 
;Particularly, each office is defined by two combinations of states (cleaned or dirty and empty or not empty). 
;The robot can move vertically or horizontally between adjacent offices. 
;Furthermore, it can move one box to an adjacent empty office.  

(define (problem Cleaning_4-2)
  (:domain Cleaning_domain_4)
  (:objects
    o1 o2 o3 o4 o5 o6 o7 o8 o9 
    empty;box_c box_d box_e box_f box_g box_h 
    robot dirt 
  )
  (:init
    ;Define the "type" of objects
    (is_robot robot)
    (is_dirt dirt)
    (is_empty empty)

    ;(is_box box_a)
    ;(is_box box_b)
    ;(is_box box_c)
    ;(is_box box_d)
    ;(is_box box_e)
    ;(is_box box_f)
    ;(is_box box_g)
    ;(is_box box_h)
    
    ;Define the position of the objects
    (at robot o2)

    ;(at box_a o7)
    ;(at box_b o6)
    ;(at box_c o3)
    ;(at box_d o4)
    ;(at box_e o5)
    ;(at box_f o6)
    ;(at box_g o7)
    ;(at box_h o8)

    (at dirt o1)
    ;(at dirt o2)
    (at dirt o3)
    ;(at dirt o4)
    ;(at dirt o5)
    ;(at dirt o6)
    (at dirt o7)
    ;(at dirt o8)
    ;(at dirt o9)

    (at empty o1)
    (at empty o2)
    (at empty o3)
    (at empty o4)
    (at empty o5)
    (at empty o6)
    (at empty o7)
    (at empty o8)
    (at empty o9)

    ;Define which offices that is adjacent.
    (Adjacent o1 o2)
    (Adjacent o2 o1)
    (Adjacent o1 o4)
    (Adjacent o4 o1)
    (Adjacent o2 o3)
    (Adjacent o3 o2)
    (Adjacent o2 o5)
    (Adjacent o5 o2)
    (Adjacent o4 o5)
    (Adjacent o5 o4)
    (Adjacent o5 o6)
    (Adjacent o6 o5)
    (Adjacent o3 o6)
    (Adjacent o6 o3)
    (Adjacent o4 o7)
    (Adjacent o7 o4)
    (Adjacent o5 o8)
    (Adjacent o8 o5)
    (Adjacent o7 o8)
    (Adjacent o8 o7)
    (Adjacent o6 o9)
    (Adjacent o9 o6)
    (Adjacent o8 o9)
    (Adjacent o9 o8)

  )
  (:goal
    (and (at robot o5) 
    (not (at dirt o1)) (not (at dirt o2)) (not (at dirt o3)) (not (at dirt o4)) 
    (not (at dirt o5)) (not (at dirt o6)) (not (at dirt o7)) (not (at dirt o8)) (not (at dirt o9))
    )
  )
)

