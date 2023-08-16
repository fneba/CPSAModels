(herald "SMIME")

(defprotocol SMIME basic
	(defrole init
		(vars (m text) (a b name) (k skey))
		(trace
			(send (cat (enc m k) a (enc (hash (enc m k)) (privk a)) (enc k (pubk b))))
		)
	)
	(
	defrole resp
		(vars (m text)(a b name) (k skey))
		(trace
			(recv (cat (enc m k) a (enc (hash (enc m k)) (privk a)) (enc k (pubk b))))
		)
	)
)


(defskeleton SMIME
  (vars (m text) (a b name) (k skey))
  (defstrand resp 1 (m m) (b b) (a a) (k k))
  (non-orig (privk a)(privk b))
  )
(defskeleton SMIME
  (vars (m text) (a b name) (k skey))
  (defstrand resp 1 (m m) (b b) (a a) (k k))
  (deflistener m)
  (non-orig (privk a)(privk b))
  )
