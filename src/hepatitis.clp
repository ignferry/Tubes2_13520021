(defrule hbs-ag-input
	=>
	(printout t "HBsAG? ")
	(assert (hbs-ag (read))))

(defrule anti-hdv-input
	(hbs-ag positive)
	=>
	(printout t "anti-HDV? ")
	(assert (anti-hdv (read))))

(defrule anti-hbc-input1
	(hbs-ag positive)
	(anti-hdv negative)
	=>
	(printout t "anti-HBc? ")
	(assert (anti-hbc (read))))

(defrule anti-hbs-input1
	(hbs-ag positive)
	(anti-hdv negative)
	(anti-hbc positive)
	=>
	(printout t "anti-HBs? ")
	(assert (anti-hbs (read))))

(defrule igm-anti-hbc-input
	(hbs-ag positive)
	(anti-hdv negative)
	(anti-hbc positive)
	(anti-hbs negative)
	=>
	(printout t "IgM anti-HBc? ")
	(assert (igm-anti-hbc (read))))

(defrule anti-hbs-input2
	(hbs-ag negative)
	=>
	(printout t "anti-HBs? ")
	(assert (anti-hbs (read))))

(defrule anti-hbc-input2
	(hbs-ag negative)
	(anti-hbs positive | negative)
	=>
	(printout t "anti-HBc? ")
	(assert (anti-hbc (read))))


	
(defrule hepatitis_b_d_output
	(hbs-ag positive)
	(anti-hdv positive)
	=>
	(printout t "Hasil Prediksi = Hepatitis B+D " crlf))

(defrule uncertain_configuration_output
	(hbs-ag positive)
	(anti-hdv negative)
	(anti-hbc negative)
	=>
	(printout t "Hasil Prediksi = Uncertain Configuration " crlf))

(defrule uncertain_configuration_output2
	(hbs-ag positive)
	(anti-hdv negative)
	(anti-hbc positive)
	(anti-hbs positive)
	=>
	(printout t "Hasil Prediksi = Uncertain Configuration " crlf))

(defrule acute_infection_output
	(hbs-ag positive)
	(anti-hdv negative)
	(anti-hbc positive)
	(anti-hbs negative)
	(igm-anti-hbc positive)
	=>
	(printout t "Hasil Prediksi = Acute Infection " crlf))

(defrule chronic_infection_output
	(hbs-ag positive)
	(anti-hdv negative)
	(anti-hbc positive)
	(anti-hbs negative)
	(igm-anti-hbc negative)
	=>
	(printout t "Hasil Prediksi = Chronic Infection " crlf))

(defrule cured_output
	(hbs-ag negative)
	(anti-hbs positive)
	(anti-hbc positive)
	=>
	(printout t "Hasil Prediksi = Cured " crlf))

(defrule vaccinated_output
	(hbs-ag negative)
	(anti-hbs positive)
	(anti-hbc negative)
	=>
	(printout t "Hasil Prediksi = Vaccinated " crlf))

(defrule unclear_output
	(hbs-ag negative)
	(anti-hbs negative)
	(anti-hbc positive)
	=>
	(printout t "Hasil Prediksi = Unclear (possible resolved) " crlf))

(defrule healthy_not_vaccinated_output
	(hbs-ag negative)
	(anti-hbs negative)
	(anti-hbc negative)
	=>
	(printout t "Hasil Prediksi = Healthy not vaccinated or suspicious " crlf))