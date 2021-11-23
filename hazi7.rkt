#lang racket

(define (my-member? v lst)
  (if (equal? v (car lst))
      lst
      (my-member? v (cdr lst))))

; Házi feladat: Készítse el az előző függvény három paraméteres változatát is!
(define (my-member3? v lst pred)
    (if (pred v (car lst))
      lst
      (my-member3? v (cdr lst) pred)))

(display "1\n")
(my-member? 2 '(8 5 1 2 9 10 7 4 6 3))
(member 2 '(8 5 1 2 9 10 7 4 6 3) equal?)
(my-member3? 2 '(8 5 1 2 9 10 7 4 6 3) equal?)

(display "2\n")
(member 2 '(8 5 1 2 9 10 7 4 6 3) <)
(my-member3? 2 '(8 5 1 2 9 10 7 4 6 3) <)

(display "3\n")
(member 2 '(8 5 1 2 9 10 7 4 6 3) >)
(my-member3? 2 '(8 5 1 2 9 10 7 4 6 3) >)

(display "4\n")
(member 2 '(8 5 1 2 9 10 7 4 6 3) (lambda (a b)
                                    (printf "~a ~a~n" a b)
                                    (> a b)
                                  ))
(my-member3? 2 '(8 5 1 2 9 10 7 4 6 3) (lambda (a b)
                                         (printf "~a ~a~n" a b)
                                         (> a b)
                                       ))

; Házi feladat: A list-update függvény felhasználásával oldja meg újra a "Make All Numbers Negative" feladatot!

(define (makeNegative x)
  (if (> x 0)
    (- 0 x)
    x))

(define (asd lst index)
  (if (= index (length lst))
      lst
      (asd (list-update lst index (lambda (x) (number->string (makeNegative (string->number x))))) (+ index 1))))

(define (main)
  (let ((a (read-line)))
    (unless (eof-object? a)
      (displayln (string-join (asd (string-split a) 0) " "))
      (main))))

; Házi feladat: Írjon függvényeket, amely szimulálja a take és a drop függvények működését azok felhasználás nélkül! A
; megoldáshoz elemi listakezelő függvényeket használjon! Törekedjen farokrekurzív megoldások elkészítésére!

; Take first 'pos' elems of list
(define (mytake lst pos [i 0] [res '()])
  (if (= i pos)
      res
      (mytake (cdr lst) pos (+ i 1) (append res (list (car lst))))))

(take '(8 5 1 2 9 10 7 4 6 3) 3)
(mytake '(8 5 1 2 9 10 7 4 6 3) 3)

(define (mydrop lst pos [i 0])
  (if (= i pos)
      lst
      (mydrop (cdr lst) pos (+ i 1))))

(drop '(8 5 1 2 9 10 7 4 6 3) 3)
(mydrop '(8 5 1 2 9 10 7 4 6 3) 3)

