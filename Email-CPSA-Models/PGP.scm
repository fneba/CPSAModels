(herald "PGP")

(defprotocol PGP basic
	(defrole init
		(vars (m text) (a b name) (k skey))
		(trace
			(send (cat  (enc m a (enc (hash m) (privk a)) k) (enc k (pubk b))))
		)
	
	)
	(defrole resp
		(vars (m text)(a b name) (k skey))
		(trace
			(recv (cat  (enc m a (enc (hash m) (privk a)) k) (enc k (pubk b))))
		)
	)
)


(defskeleton PGP
  (vars (m text) (a b name) (k skey))
  (defstrand resp 1 (m m) (b b) (a a) (k k))
  (non-orig (privk a)(privk b))
  )
(defskeleton PGP
  (vars (m text) (a b name) (k skey))
  (defstrand resp 1 (m m) (b b) (a a) (k k))
  (deflistener m)
  (non-orig (privk a)(privk b))
  )
