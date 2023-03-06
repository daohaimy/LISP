;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Klausur S3|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #t () #f)))
; Aufgabe 3.1
;( + (* 7 8) 112)
; Aufgabe 3.2
;(* (+ 7 (* 8076 96)) (+ 17 1605))
; Aufgabe 3.3
;(- (* 76 8) 1024)
; Aufgabe 3.4
;(abs (+ (* 19 16) (* (- 21 17) (- 288576 3519675))))
; Aufgabe 3.5
;(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7)))




;                       !!! VARIABLEN !!!
(define groesse 2)
;(* groesse groesse)
(define wohnort 'Hamburg)




;               !!! ZUSAMMENGESETZTE FUNKTIONEN !!!
;(define (<Funktionsname> <formale Parameter>)
;           (<Funktionsrumpf>))

;(define (quadriere x)
;     (* x x))

;(define laenge 100)
;(define breiter 50)
;(define hoehe 25)
;(define (volumenQuader laenge breiter hoehe)
;     (* laenge breiter hoehe))
;(define (oberflacheQuader laenge breite hoehe)
;     (* 2 (+ (* laenge breite)
;             (* laenge hoehe)
;             (* hoehe breite))))
;(volumenQuader 3 4 5)


; Aufgabe 5.1
(define (quadriere y)
  (* y y))
; Aufgabe 5.2
(define (hochDrei x)
  (* (quadriere x) x))
; Aufgabe 5.3
(define (hochVier x)
  (* (quadriere x) (quadriere x)))
; Aufgabe 5.4
(define (hochZwoelf z)
  (* (hochVier z) (hochVier z) (hochVier z)))

; Aufgabe 6
;x ∈ [-5;5]
;f(x) = 5·x^2 - 3·x - 25
(define (parabel a b c x)
  (- (* a (quadriere x)) (* b x) c))
;(parabel 5 3 25 -5)
;(parabel 5 3 25 5)

; Aufgabe 7
; Parallelschaltung: Rges = R1*R2 / (R1+R2)
(define (ersatzWiderstandParallelschaltung r1 r2)
  (/ (* r1 r2) (+ r1 r2)))
; Reihenschaltung:  Rges = R1 + R2
(define (ersatzWiderstandReihenschaltung r1 r2)
  (+ r1 r2))




;            !!! WAHRHEITSWERTE und PRAEDIKATE !!!
; "true" "false"

; boolesche Praedikate (akzeptieren mehr als 2 Argumente):
; Negation:    (not <praedikat>) 
; Konjunjtion: (and <praedikat 1> <praedikat 2>)
; Disjunjtion: (or <praedikat 1> <praedikat 2>)

; Gleiheit von Symbolen testen: eq? equal?
; > (eq? 'Meier 'meier)
;  false
; > (equal? 'Meier 'Meier)
;  true



;                    !!! DAS KONDITIONAL !!!
; (cond (<praedikat 1> <ausdruck 1>
;       (<praedikat 2> <ausdruck 2>
;       ...
;       (<praedikat n> <ausdruck n>))

; z.B:
;(define (betrag x)
;   (cond ((> x 0) x)
;         ((= x 0) 0)
;         ((< x 0) (- x))))
;                                                   = : Nummer
;                                              equal? : Buchstaben
; z.B 2:                                           
;(define (betrag x)
;   (cond ((< x 0) (- x))
;         (else x)))

; (if <praedikat> <nhánh đúng> <alternative>) {1 Frage, 2 Antworten)
; z.B 3:
;(define (betrag x)
;  (if (< x 0)
;      (- x)
;      x))

; z.B 4:
;(define (englisch wort)
;  (cond ((equal? wort 'Apfel) 'apple)
;        ((equal? wort 'Buch) 'book)
;        (else 'unbekanntesWort)))



; Aufgabe 9
(define (schaltjahr? n)
  (cond ((= (remainder n 400) 0) #true)
        ((= (remainder n 100) 0) #false)
        ((= (remainder n 4) 0) #true)
        (else #false)))

;ax^2 + bx - c
; Aufgabe 10
(define (anzahlNullstellen a b c)
  (cond ((and (= a 0)
              (= b 0))
              0)
        ((= a 0) 1)
        ((and (= b 0)
              (< c 0))
              2)
        ((and (= b 0)
              (> c 0))
              'keineLösung)
  (else 2)))

;         !!! REKURSIVE FUNKTIONEN !!!
;(define (fakultaet n)
; (cond ((= n 1) 1)
; (else (* n (fakultaet (- n 1))))))

; Aufgabe 11
(define (summe n)
  (cond ((= n 1) 1)
        (else (+ n (summe (sub1 n))))))

; Aufgabe 12
(define (addiere a b)
  (cond ((= a 0) b)
        ((= b 0) a)
        (else (add1 (addiere a (sub1 b))))))

(define (subtrahiere a b)
  (cond ((= a 0) (- b))
        ((= b 0) a)
        (else (sub1 (subtrahiere a (sub1 b))))))

; Aufgabe 13
(define (multipliziere a b)
  (cond ((= a 0) 0)
        ((= b 0) 0)
        (else (addiere b (multipliziere (sub1 a) b)))))

(define (dividiere a b)
  (cond ((= a 0) 0)
        ((= b 0) 'keineLösung)          ;???????????
        (else (add1 (dividiere (subtrahiere a b) b)))))

; Aufgabe 14
(define (potenz n x)
  (cond ((= x 0) 0)
        ((= x 1) 1)
        ((= n 0) 1)
        ((= n 1) x)
        (else (* x (potenz (sub1 n) x)))))

; Aufgabe 15
(define (ggT a b)
  (cond ((= a 0) b)
        ((= b 0) a)
        ((= (remainder a b) 0) b)
        ((= (remainder b a) 0) a)
        (else (remainder b a))))

; Aufgabe 16
(define (fib n)
  (cond ((< n 0) 'keineLoesung)
        ((= n 1) 0) 
        ((= n 2) 1)
        ((>= n 2) (+ (fib(- n 1)) (fib(- n 2))))))


;               !!! ATOME UND LISTE !!!
; '(das ist eine Liste)
; (list 1 2 3)
; (cons 1 '(2 3))
; '(Eine Lise aus 7 Symbolen und einer zahl)
; (cons 1 '(das ist ein Liste))

; leere Liste = Länge Null = nil

; car = erste Element der Liste
;      (car '(1 2 3))

; cdr = der Rest der Liste
;      (cdr '(1 2 3))

; zweite Element:
;      (car (cdr ‘(das ist eine Liste)))  --> 'ist
;      (cadr '(das ist eine Liste))

; ob die Liste leer ist:
;      (equal? <Liste> '())
;      (null? <Liste>)

; Aufgabe 17
; (car '(meier müller schmidt))
; (cdr '(meier müller schmidt))
; (car '(1))
; (cdr '(1))
; (car (cdr '((1 2 3) 10)))
; (cdr (car '((1 2 3) 10)))
; (cdr (car (car '(((a b c) (d e (f)) (g e))))))

; Aufgabe 18
; (car (cdr '(a 13 c)))
; (cdr (car (cdr '(11 (12 13) 14))))
; (cdr (car (cdr (cdr (car (cdr '(1 (2 3 (4 13) 2))))))))
; (car (car '((13))))    ;??????????

; Aufgabe 19
(define (ntesElement n list)
  (cond ((= n 0) 0)
        ((< n 0) 'keineLosung)
        ((= n 1) (car list))
        (else (ntesElement (sub1 n) (cdr list)))))

; Aufgabe 20       ????????????
;(define (abarbeiten procedur liste)
; (cond ((null? liste) '())
;       (else (cons (procedur (car liste))
;                   (abarbeiten procedur (cdr liste))))))
;(abarbeiten englisch '(der Apfel ist grün))

; Aufgabe 21
;(car (cons '(A (B C))'()))
;(cons 

; Aufgabe 22
;(define (laenge list)
;  (cond ((null? list) '())
;        (else (length list))))

(list 1 2 3 4 5 6)

(define (tgE liste)
  (cond ((null? liste) liste)
        ((> (cadr liste)(car liste))
        (cons (cadr liste)(cons (car liste)(cddr liste))))
        (else (tgE (cdr liste)))))

(define (maxi liste)
  (cond ((null? (cdr liste)) (car liste))
        ((> (car liste)(cadr liste) (car liste))
         (car liste))
        (else (maxi (cdr liste)))))

;(define (entferne element liste)
;  (cond ((null? liste) liste)
;        ((equal? element (car liste)) (cdr liste))
;        (else (cons (car liste)(entferne element (cdr liste))))))

(define (haenge_an element liste)
  (append liste (cons element '())))
(define liste '(a b c d e))

(define (fuege_ein element liste)
  (cond ((null? liste) (cons element liste))
        ((< element (car liste)) (cons element liste))
        (else (cons (car liste) (fuege_ein element (cdr liste))))))

(define (sortiere liste)
  (cond ((null? liste) liste)
        (else (fuege_ein (car liste)(sortiere (cdr liste))))))

(sortiere '(12 3 15 6 8 2))
(define l1
  '(2 3 4 5))
(define l2
  '(1 2 3 4))
(define l3
  '(1 2))
(tgE l1)
(tgE l2)
(tgE l3)


; Euklidischer Algorithmus
(define (Euklid a b)
  (cond ((= a b) a)
        ((> a b) (ggT (- a b) b))
        (else (ggT a (- b a)))))


; Wir schreiben eine boolesche Funktion, (in? element
; die prüft, ob das Element in der Liste enthalten ist
(define (in? element liste)
  (cond ((null? liste) #false)
        ((equal? element (car liste)) #true)
        (else (in? element (cdr liste)))))

(define (entferne element liste)
  (cond ((null? liste) liste)
        ((equal? element (car liste))(cdr liste))
        (else (cons (car liste)(entferne element (cdr liste))))))
; Menfelehre:
;(define (vereinige mengeA mengeB)
;  (cond (

; (define (schnittmenge mengeA mengeB)
; (istTeilmenge? mengeA mengeB)



(define mobile 5)
(define mobile0
  '(10 10))
(define mobile1
  '((10 10) ((5 5) 10)))
(define mobile2
  '((((5 5) 10) ((5 5) 10)) (((5 (2 3)) (5 (2 3))) ((5 5) 10))))
; Masse Mobile
(define (masse liste)
  (cond ((not (list? liste)) liste)
        (else (+ (masse (car liste))
                 (masse (cadr liste))))))

; Gewicht Mobile
(define (gleichgewicht?1 mobile)
  (cond ((not (list? mobile)) #true)
        (else (and (= (masse (car mobile))
                      (masse (car (cdr mobile))))
                   (gleichgewicht?1 (car mobile))
                   (gleichgewicht?1 (car (cdr mobile)))))))

;Liste von Fischen
(define fischeListe
'((15 10 30 5) 60 40 ((10 20 20 10) 20 40 10)))
;Aufgabe 1
;(define (gleichgewicht?2 fischeListe)