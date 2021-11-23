#lang racket
#|
(define (fibo n)
  
  (define (fibo-tail-rec n a b)
  (if (= 0 n)
  a
    (if(= 1 n)
    b
        (fibo-tail-rec (sub1 n) b (+ a b)))))
    (fibo-tail-rec n 0 1))
 
(define (fibo n)
    (define (fibo-tail-rec n a b)
          (cond
            [(= 0 n) a]
            [(= 1 n) b]
            [else (fibo-tail-rec (sub1 n) b (+a b))]))
    (fibo-tail-rec n 0 1))

(define (fibo n)
    (let fibo-tail-rec ((n n) (a 0) (b 1))
          (cond
            [(= 0 n) a]
            [(= 1 n) b]
            [else (fibo-tail-rec (sub1 n) b (+a b))])))

(let ((x 2021))
    x)
|#
(define (masodfoku a b c)
    (if (zero? a) 
        (if (zero? b)
            (if (zero? c)
                "azonosság"
                "ellentmondás")
            (- 0 (/ c b)))
        (let ((d (- (expt b 2 ) (* 4 a c))))
            (cond
                [(< d 0) "nincs valós gyök"]
                [(= d 1) (/ (- 0 b) (* 2 a))]
                [else (list 
                            (/ (+ (- 0 b) (sqrt d)) (* 2 a)) 
                            (/ (- (- 0 b) (sqrt d)) (* 2 a)))]
            )
        )
    )
)