;; The sliding-tile puzzle (i.e. the eight/fifteen/twentyfour puzzle).
;; Tile positions are encoded by the predicate (at <tile> <x> <y>), i.e.
;; using one object for horizontal position and one for vertical (there's
;; a separate predicate for the position of the blank). The predicates
;; "inc" and "dec" encode addition/subtraction of positions.


(define (domain Cleaning_domain_4)
  (:requirements :strips :adl )
  (:predicates

    (Adjacent ?o1 ?o2)
    (at ?what ?office)
    (is_robot ?what)    
    (is_dirt ?what)
    (is_box ?what)
    (is_empty ?what)
    )
  

  (:action move
    :parameters (?what ?from ?to)
    :precondition (and
       (Adjacent ?to ?from) (at ?what ?from) (is_robot ?what)
      )
    :effect (and (not (at ?what ?from)) 
      (at ?what ?to)) )
  

  (:action Clean-office
    :parameters (?where ?dirt ?robot ?empty)
    :precondition (and
       (is_dirt ?dirt) (at ?robot ?where) (is_robot ?robot) (at ?empty ?where) (is_empty ?empty)) 
    :effect  (not (at ?dirt ?where))
    )
  

  (:action Push
    :parameters (?robot ?box ?from ?to ?empty)
    :precondition (and
       (is_box ?box) (is_robot ?robot) (at ?robot ?from) (at ?box ?from) (at ?empty ?to) (is_empty ?empty)
       (Adjacent ?from ?to))
    :effect (and (not (at ?robot ?from)) (not (at ?box ?from)) (at ?empty ?from) (not(at ?empty ?to)) 
      (at ?robot ?to) (at ?box ?to) ) 
  )
)
