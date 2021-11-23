#lang racket
;-----------------------------------------------------------------
(define (_bucket a l [l1 '()] [l2 '()])
  (if (null? l)
      (list l1 l2)
      (if (< (car l) a)
          (_bucket a (cdr l) (cons (car l) l1) l2)
          (_bucket a (cdr l) l1 (cons (car l) l2)))))

(define (bucket a l)
  (let ((res (_bucket a l)))
    (list (reverse (first res)) (reverse (second res)))))

(bucket 3 '(1 2 4 5))

;-----------------------------------------------------------------
(define (rend_beszur a l)
  (if (null? l)
      (list a)
      (let ((res (bucket a l)))
        (append (first res) (cons a (second res))))))

(rend_beszur 3 '(1 2 4 5))

;----------------------------------------------------------------
(define (rendez l [lr '()])
  (if (null? l)
      lr
      (rendez (cdr l) (rend_beszur (car l) lr))))

(rendez '(5 4 3 2 1))

(define (randl x) (build-list x (lambda (n) (random (- x) x))))
(let ((r (randl 20)))
  (displayln r)
  (displayln (rendez r))
)