(library (arcfide hpapl runtime)
   (export make-scalar-array 
	   array-iota
	   each
	   reduce
	   plus)
   (import (chezscheme))

(define (hpapl-version) '(1 0))
(define (hpapl-version-string)
  "HPAPL Runtime Version (1.0)\nCopyright (c) 2012 Aaron W. Hsu")

(define-record-type array (fields shape values))

(define (make-scalar-array x) 
  (if (fixnum? x)
      (make-array '#vfx() (fxvector x))
      (make-array '#vfx() (vector x))))

(define (make-vector-array v) 
  (cond
   [(vector? v) (make-array (fxvector (vector-length v)) v)]
   [(fxvector? v) (make-array (fxvector (fxvector-length v)) v)]
   [else (error 'make-vector-array "domain error" v)]))

(define (rank a) (fxvector-length (array-shape a)))

(define (empty-array? a) (fxvector-exists fxzero? (array-shape a)))
(define (scalar-array? a) (fxzero? (rank a)))
(define (vector-array? a) (fx= 1 (rank a))) 
(define (matrix-array? a) (fx= 2 (rank a)))

(define (scalar-value a)
  (let ([v (array-values a)])
    (cond
     [(fxvector? v) (fxvector-ref v 0)]
     [(vector? v) (vector-ref v 0)])))

(define (array-scalar-value a)
  (make-scalar-array (scalar-value a)))

(define empty-array (make-array '(0) '#()))

(define (fxvector-map-monadic f v)
  (let* ([vl (fxvector-length v)]
	 [nv (make-fxvector (fxvector-length v))])
    (let loop ([i 0])
      (if (fx= i vl)
	  nv
	  (begin
	   (fxvector-set! nv i (f (fxvector-ref v i)))
	   (loop (fx+ i 1)))))))

(define (fxvector-map-dyadic f a b)
  (let* ([vl (fxvector-length a)]
	 [nv (make-fxvector (fxvector-length a))])
    (let loop ([i 0])
      (if (fx= i vl)
	  nv
	  (begin
	   (fxvector-set! nv i (f (fxvector-ref a i) (fxvector-ref b i)))
	   (loop (fx+ i 1)))))))

(define fxvector-map
  (case-lambda
   [(f a) (fxvector-map-monadic f a)]
   [(f a b) (fxvector-map-dyadic f a b)]))

(define (fxvector->vector v)
  (let* ([len (fxvector-length v)]
	 [nv (make-vector len)])
    (let loop ([i 0])
      (unless (fx= i len)
	(vector-set! nv i (fxvector-ref v i))
	(loop (fx+ i 1))))
    nv))

(define (vector-forall pred? v)
  (let ([len (vector-length v)])
    (let loop ([i 0])
      (cond
       [(fx= i len) #t]
       [(pred? (vector-ref v i)) (loop (fx+ i 1))]
       [else #f]))))

(define (fxvector-exists pred? v)
  (let ([len (fxvector-length v)])
    (let loop ([i 0])
      (cond
       [(fx= i len) #f]
       [(pred? (fxvector-ref v i)) #t]
       [else (loop (fx+ i 1))]))))

(define (fxvector-subvector v s e)
  (let* ([len (- e s)]
	 [nv (make-fxvector len)])
    (let loop ([i 0])
      (unless (fx= i len)
	(fxvector-set! nv i (fxvector-ref v i))))
    nv))

(define values-map
  (case-lambda
   [(f a)
    (cond
     [(vector? a) (vector-map f a)]
     [(fxvector? a) (fxvector-map f a)]
     [else (error #f "unknown value type" a)])]
   [(f a b)
    (cond
     [(vector? a)
      (vector-map f a 
		  (cond 
		   [(vector? b) b]
		   [(fxvector? b) (fxvector->vector b)]
		   [else (error #f "unknown value type"  b)]))]
     [(fxvector? a)
      (cond
       [(fxvector? b) (fxvector-map f a b)]
       [(vector? b) (vector-map f (fxvector->vector a) b)]
       [else (error #f "unknown value type" b)])]
     [else (error #f "unknown value type" a)])]))

(define (plus a b)
  (cond
   [(equal? (array-shape a) (array-shape b))
    (make-array (array-shape a)
		(values-map + (array-values a) (array-values b)))]
   [(scalar-array? a)
    (make-array (array-shape b)
		(values-map (let ([x (array-scalar-value a)])
			      (lambda (y) (+ x y)))
			    (array-values b)))]
   [(scalar-array? b)
    (make-array (array-shape a)
		(values-map (let ([x (array-scalar-value b)])
			      (lambda (y) (+ y x)))
			    (array-values a)))]
   [else (error 'plus "Shape mismatch" a b)]))

(define (subtract a b)
  (cond
   [(equal? (array-shape a) (array-shape b))
    (make-array (array-shape a)
		(values-map - (array-values a) (array-values b)))]
   [(scalar-array? a)
    (make-array (array-shape b)
		(values-map (let ([x (array-scalar-value a)])
			      (lambda (y) (- x y)))
			    (array-values b)))]
   [(scalar-array? b)
    (make-array (array-shape a)
		(values-map (let ([x (array-scalar-value b)])
			      (lambda (y) (- y x)))
			    (array-values a)))]
   [else (error 'plus "Shape mismatch" a b)]))

(define (shape a)
  (make-array (fxvector (rank a)) (array-shape a)))

(define (reshape s a)
  (make-array (array-values s) (array-values a)))

(define (scalar-iota n)
  (let ([v (make-fxvector n)])
    (let loop ([i 0])
      (if (fx= i n)
	  v
	  (begin
	   (fxvector-set! v i i)
	   (loop (fx+ i 1)))))))

(define (vector-iota v)
  (error 'vector-iota "nonce error"))

(define (scalar-proc-monadic f)
  (lambda (s)
    (scalar-value (f (make-scalar-array s)))))

(define (scalar-proc-dyadic f)
  (lambda (a b)
    (scalar-value (f (make-scalar-array a) (make-scalar-array b)))))

(define (array-iota a)
  (cond
   [(scalar-array? a) (make-vector-array (scalar-iota (scalar-value a)))]
   [(vector-array? a) 
    #;(vector-iota (array-values a))
    (error 'array-iota "nonce error")]
   [else (error 'array-iota "domain error" a)]))

(define (each f)
  (case-lambda
   [(a) 
    (make-array (array-shape a) 
		(values-map (scalar-proc-monadic f) (array-values a)))]
   [(a b)
    (cond
     [(equal? (array-shape a) (array-shape b))
      (make-array (array-shape a)
		  (values-map (scalar-proc-dyadic f)
			      (array-values a) 
			      (array-values b)))]
     [(scalar-array? a)
      (make-array (array-shape b)
		  (values-map (let ([v (scalar-value a)]
				    [f (scalar-proc-dyadic f)])
				(lambda (x) (f v x)))
			      (array-values b)))]
     [(scalar-array? b)
      (make-array (array-shape a)
		  (values-map (let ([v (scalar-value b)]
				    [f (scalar-proc-dyadic f)])
				(lambda (x) (f x v)))
			      (array-values a)))]
     [else (error 'each "shape mismatch" a b)])]))

(define (reduce f)
  (define (last-axis a)
    (let ([v (array-shape a)])
      (fxvector-ref v (fx- (fxvector-length v) 1))))
  (define (drop-last-axis a)
    (let ([v (array-shape a)])
      (fxvector-subvector v 0 (fx- (fxvector-length v) 1))))
  (lambda (a)
    (cond
     [(scalar-array? a) a]
     [(empty-array? a) (make-scalar-array 0)]
     [(fx= 1 (last-axis a)) (make-array (drop-last-axis a) (array-values a))]
     [else
      (make-array (drop-last-axis a)
		  (values-reduce f (array-values a) (last-axis a)))])))

(define (values-reduce f v s)
  (define sf (scalar-proc-dyadic f))
  (define (reduce get set! len make)
    (let ([nv (make (div len s))])
      (define (vector-reduce s e)
	(set! nv s (get v (fx- e 1)))
	(let loop ([i (fx- e 2)])
	  (unless (fx= i s)
	    (set! nv s (sf (get v i) (get nv s)))
	    (loop (fx- i 1)))))
      (let loop ([i 0])
	(if (fx= i len)
	    nv
	    (begin (vector-reduce i (fx+ i s))
		   (loop (fx+ i s)))))))
  (cond
   [(vector? v) 
    (reduce vector-ref vector-set! (vector-length v) make-vector)]
   [(fxvector? v)
    (reduce fxvector-ref fxvector-set! (fxvector-length v) make-fxvector)]
   [else (error 'reduce "domain error")]))

)