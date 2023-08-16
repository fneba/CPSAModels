(herald "SEFix")

(defprotocol SEFix basic
	(defrole init
		(vars (m text) (a b name) (k skey))
		(trace
			(send (cat  (enc (enc m a (enc (hash b m) (privk a)) k) (pubk b)) (enc k (pubk b))))
		)
	
	)
	(defrole resp
		(vars (m text)(a b name) (k skey))
		(trace
			(recv (cat  (enc (enc m a (enc (hash b m) (privk a)) k) (pubk b)) (enc k (pubk b))))
		)
	)
)


(defskeleton SEFix
  (vars (m text) (a b name) (k skey))
  (defstrand resp 1 (m m) (b b) (a a) (k k))
  (non-orig (privk a)(privk b))
  )
(defskeleton SEFix
  (vars (m text) (a b name) (k skey))
  (defstrand resp 1 (m m) (b b) (a a) (k k))
  (deflistener m)
  (non-orig (privk a)(privk b))
  )