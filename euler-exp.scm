(define (cont-frac n d k)
  (define (cont-frac-iter i sum)
	  (if (= i 0)
	      sum
	      (cont-frac-iter (- i 1) (/ (n i) (+ (d i) sum)) )))
  (cont-frac-iter k 0.0))


(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           2)

(define (euler k)
(+ (cont-frac (lambda (i) 1.0)
              (lambda (i)
		         (if (= (remainder i 3) 2)
		             (/ (+ i 1) 1.5)
		              1))
              k)
    2.0))


(euler 6)