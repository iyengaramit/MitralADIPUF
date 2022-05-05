**Mitral STS ADI PUF**
//IMPORT MERGED FILE

set excelxlsxlargefile on

duplicates report surgOrder
duplicates report RCRDNUM 

encode(age), gen(AGE)
drop age
gen age=AGE
sum age if age<18
drop if age<18
tab datav
drop if datav<2.7 

tab procid 
tab vsmvpr 
tab procid vsmvpr
tab vsmvpr mitralintent

encode(vsmvpr), gen(VSMVPR)
drop vsmvpr
gen vsmvpr = VSMVPR
tab vsmvpr

gen proc_id = vsmvpr-1
label define procedure 0 "repair" 1 "replace"
label values proc_id procedure
tab proc_id

tab qtr_of_year, m
tab surgyear qtr_of_year, m
drop if surgyear==2011|surgyear==2019
tab surgyear qtr_of_year, col chi2

tab sts_region
replace sts_region="" if sts_region=="NULL"
tab sts_region, m

codebook sts_siteid sts_hospid sts_surgid 
tab datavrsn
tab surgyear datavrsn

sum distance_m
gen distance = real(distance_m)
replace distance=distance/1609.3
codebook distance

gen fake=1

bysort sts_siteid: egen site_id_2011=sum(fake) if surgyear==2011
bysort sts_siteid: egen site_id_2012=sum(fake) if surgyear==2012
bysort sts_siteid: egen site_id_2013=sum(fake) if surgyear==2013
bysort sts_siteid: egen site_id_2014=sum(fake) if surgyear==2014
bysort sts_siteid: egen site_id_2015=sum(fake) if surgyear==2015
bysort sts_siteid: egen site_id_2016=sum(fake) if surgyear==2016
bysort sts_siteid: egen site_id_2017=sum(fake) if surgyear==2017
bysort sts_siteid: egen site_id_2018=sum(fake) if surgyear==2018
bysort sts_siteid: egen site_id_2019=sum(fake) if surgyear==2019

gen annualsitevol=.

replace annualsitevol = site_id_2011 if site_id_2011!=.
replace annualsitevol = site_id_2012 if site_id_2012!=.
replace annualsitevol = site_id_2013 if site_id_2013!=.
replace annualsitevol = site_id_2014 if site_id_2014!=.
replace annualsitevol = site_id_2015 if site_id_2015!=.
replace annualsitevol = site_id_2016 if site_id_2016!=.
replace annualsitevol = site_id_2017 if site_id_2017!=.
replace annualsitevol = site_id_2018 if site_id_2018!=.
replace annualsitevol = site_id_2019 if site_id_2019!=.

tab annualsitevol

bysort sts_hospid: egen hosp_id_2011=sum(fake) if surgyear==2011
bysort sts_hospid: egen hosp_id_2012=sum(fake) if surgyear==2012
bysort sts_hospid: egen hosp_id_2013=sum(fake) if surgyear==2013
bysort sts_hospid: egen hosp_id_2014=sum(fake) if surgyear==2014
bysort sts_hospid: egen hosp_id_2015=sum(fake) if surgyear==2015
bysort sts_hospid: egen hosp_id_2016=sum(fake) if surgyear==2016
bysort sts_hospid: egen hosp_id_2017=sum(fake) if surgyear==2017
bysort sts_hospid: egen hosp_id_2018=sum(fake) if surgyear==2018
bysort sts_hospid: egen hosp_id_2019=sum(fake) if surgyear==2019

gen annualhospvol=.

replace annualhospvol = hosp_id_2011 if hosp_id_2011!=.
replace annualhospvol = hosp_id_2012 if hosp_id_2012!=.
replace annualhospvol = hosp_id_2013 if hosp_id_2013!=.
replace annualhospvol = hosp_id_2014 if hosp_id_2014!=.
replace annualhospvol = hosp_id_2015 if hosp_id_2015!=.
replace annualhospvol = hosp_id_2016 if hosp_id_2016!=.
replace annualhospvol = hosp_id_2017 if hosp_id_2017!=.
replace annualhospvol = hosp_id_2018 if hosp_id_2018!=.
replace annualhospvol = hosp_id_2019 if hosp_id_2019!=.

tab annualhospvol

bysort sts_surgid: egen surg_id_2011=sum(fake) if surgyear==2011
bysort sts_surgid: egen surg_id_2012=sum(fake) if surgyear==2012
bysort sts_surgid: egen surg_id_2013=sum(fake) if surgyear==2013
bysort sts_surgid: egen surg_id_2014=sum(fake) if surgyear==2014
bysort sts_surgid: egen surg_id_2015=sum(fake) if surgyear==2015
bysort sts_surgid: egen surg_id_2016=sum(fake) if surgyear==2016
bysort sts_surgid: egen surg_id_2017=sum(fake) if surgyear==2017
bysort sts_surgid: egen surg_id_2018=sum(fake) if surgyear==2018
bysort sts_surgid: egen surg_id_2019=sum(fake) if surgyear==2019

gen annualsurgvol=.

replace annualsurgvol = surg_id_2011 if surg_id_2011!=.
replace annualsurgvol = surg_id_2012 if surg_id_2012!=.
replace annualsurgvol = surg_id_2013 if surg_id_2013!=.
replace annualsurgvol = surg_id_2014 if surg_id_2014!=.
replace annualsurgvol = surg_id_2015 if surg_id_2015!=.
replace annualsurgvol = surg_id_2016 if surg_id_2016!=.
replace annualsurgvol = surg_id_2017 if surg_id_2017!=.
replace annualsurgvol = surg_id_2018 if surg_id_2018!=.
replace annualsurgvol = surg_id_2019 if surg_id_2019!=.

tab annualsurgvol


tab ADI_NATRANK_2015
tab ADI_NATRANK_2018 

gen tester=1 if ADI_NATRANK_2015==ADI_NATRANK_2018
tab tester
drop tester

gen adi2015=real(ADI_NATRANK_2015)
gen adi2018=real(ADI_NATRANK_2018) 

gen tester=1 if adi2015==adi2018 
tab tester, m
drop tester

gen tester=0 if ((abs(adi2018-adi2015)<20) & adi2018!=. & adi2015!=.)
replace tester=1 if ((abs(adi2018-adi2015)>=20)& adi2018!=. & adi2015!=.)
tab tester
drop tester

gen adidif= adi2018-adi2015 if adi2018!=. & adi2015!=. 
tab adidif if abs(adidif)>=20
hist adidif, freq normal

**************************************************
//Demographics/Comorbidities

gen BSA = real(bsa)
drop bsa
gen bsa = BSA
drop BSA
codebook bsa

tab payorgov

gen PAYORGOV=real(payorgov)
drop payorgov
gen payorgov=PAYORGOV
drop PAYORGOV
replace payorgov=0 if payorgov==2
tab payorgov, m

tab payorprim
gen PAYORPRIM=real(payorprim)
drop payorprim
gen payorprim=PAYORPRIM
drop PAYORPRIM
tab payorprim datav
replace payorgov=0 if payorprim>=1 & payorprim<=12
replace payorgov=1 if payorprim>1 & payorprim<9

tab payorgovmcare
gen tester = real(payorgovmcare)
drop payorgovmcare
gen payorgovmcare=tester
drop tester
replace payorgovmcare=0 if payorgovmcare==2
replace payorgovmcare=0 if payorgov==0 & payorgovmcare!=1
replace payorgovmcare=0 if payorprim>=1 & payorprim<=12
replace payorgovmcare=1 if payorprim==2
tab payorgovmcare

tab payorcom
gen tester = real(payorcom)
drop payorcom
gen payorcom=tester
drop tester
replace payorcom=0 if payorcom==2
replace payorcom=0 if payorprim>=1 & payorprim<=12
replace payorcom=1 if payorprim==9
tab payorcom
tab payorcom, m

tab payorhmo
gen tester = real(payorhmo)
drop payorhmo
gen payorhmo=tester
drop tester
replace payorhmo=0 if payorhmo==2
replace payorhmo=0 if payorprim>=1 & payorprim<=12
replace payorhmo=1 if payorprim==10
tab payorhmo, m

tab payornonus
gen tester = real(payornonus)
drop payornonus
gen payornonus=tester
drop tester
replace payornonus=0 if payornonus==2
replace payornonus=0 if payorprim>=1 & payorprim<=12
replace payornonus=1 if payorprim==11
tab payornonus, m

tab payorns
gen tester = real(payorns)
drop payorns
gen payorns=tester
drop tester
replace payorns=0 if payorns==2
replace payorns=0 if payorprim>=1 & payorprim<=12
replace payorns=1 if payorprim==1
tab payorns, m

gen tester = payorgov+payorcom+payorhmo+payornonus+payorns
tab tester
drop tester

tab admitsrc
gen tester = real(admitsrc)
drop admitsrc
gen admitsrc=tester
drop tester
label define adt 1 "elective" 2 "ED" 3 "tx" 4 "other"
label values admitsrc adt
tab admitsrc
tab sameday
drop sameday

sum age, detail

tab gender
gen female=.
replace female=0 if gender=="1"
replace female=1 if gender=="2"
tab female, m

tab racecaucasian
tab raceblack

gen race_comb=.
replace race_comb=1 if racecaucasian=="1"
replace race_comb=2 if raceblack=="1"
replace race_comb=3 if raceasian=="1"
replace race_comb=4 if racenativeam=="1"|raceother=="1"
label define mrace 1 "white" 2 "black" 3 "asian" 4 "other"
label values race_comb mrace
tab race_comb

tab ethnicity
gen tester = real(ethnicity)
drop ethnicity
gen ethnicity=tester
drop tester
replace ethnicity=. if ethnicity==3
replace ethnicity=0 if ethnicity==2
tab ethnicity
drop race

sum heightcm
gen tester = real(heightcm)
drop heightcm
gen heightcm=tester
drop tester

sum weightkg
gen tester = real(weightkg)
drop weightkg
gen weightkg=tester
drop tester
sum weightkg

tab smoker
tab smokcurr
drop smoker
drop smokcurr
tab cigsmoker
gen tester = real(cigsmoker)
drop cigsmoker
gen cigsmoker=tester
drop tester
tab cigsmokercurr
replace cigsmoker=3 if cigsmokercurr=="1"
replace cigsmoker=3 if tobaccouse=="2"|tobaccouse=="3"|tobaccouse=="4"
replace cigsmoker=2 if tobaccouse=="1"
replace cigsmoker=1 if tobaccouse=="5"
tab cigsmoker
replace cigsmoker=0 if cigsmoker==2
replace cigsmoker=2 if cigsmoker==3
label define ciggs 0 "never" 1 "former" 2 "curr"
label values cigsmoker ciggs
tab cigsmoker
tab cigsmoker surgyear, col chi2 

tab diabetes
gen tester = real(diabetes)
drop diabetes
gen diabetes=tester
drop tester
replace diabetes=. if diabetes==3
replace diabetes=0 if diabetes==2
tab diabetes

tab diabctrl
gen tester = real(diabctrl)
drop diabctrl
gen diabctrl=tester
drop tester
label define dm 1 "none" 2 "diet" 3 "oral" 4 "insul" 5 "subq" 6 "oth" 7 "unk"
label values diabctrl dm
tab diabctrl
tab diabctrl datav

tab hypertn
gen tester = real(hypertn)
drop hypertn
gen hypertn=tester
drop tester
replace hypertn=. if hypertn==3
replace hypertn=0 if hypertn==2
tab hypertn

tab dyslip
gen tester = real(dyslip)
drop dyslip
gen dyslip=tester
drop tester
replace dyslip=. if dyslip==3
replace dyslip=0 if dyslip==2
tab dyslip

tab hyprchol 
tab renfail
drop hyprchol
drop renfail

tab dialysis
gen tester = real(dialysis)
drop dialysis
gen dialysis=tester
drop tester
replace dialysis=. if dialysis==3
replace dialysis=0 if dialysis==2
tab dialysis

tab infendo
gen tester = real(infendo)
drop infendo
gen infendo=tester
drop tester
replace infendo=0 if infendo==2
tab infendo 
tab infendo surgyear, col chi2
graph bar (count), over(infendo) over(surgyear) title("Endocarditis over Time")

tab infendty
gen tester = real(infendty)
drop infendty
gen infendty=tester
drop tester
label define infec 1 "treated" 2 "active"
label values infendty infec
tab infendty
tab infendo infendty

tab chrlungd
gen tester = real(chrlungd)
drop chrlungd
gen chrlungd=tester
drop tester

replace chrlungd=. if chrlungd==6
label define lung 1 "no" 2 "mild" 3 "mod" 4 "sev" 5 "sev unk"
label values chrlungd lung
tab chrlungd

tab depression datavrsn
drop depression

tab alcohol datavrsn
gen tester = real(alcohol)
drop alcohol
gen alcohol=tester
drop tester
replace alcohol=1 if alcohol==4
replace alcohol=. if alcohol==5
label define etoh 1 "<1" 2 "2-7" 3 ">=8"
label values alcohol etoh
tab alcohol surgyear, col chi2 

tab liverdis datavrsn 
gen tester = real(liverdis)
drop liverdis
gen liverdis=tester
drop tester
replace liverdis=. if liverdis==3
replace liverdis=0 if liverdis==2
tab liverdis

tab immsupp
gen tester = real(immsupp)
drop immsupp
gen immsupp=tester
drop tester
replace immsupp=. if immsupp==3
replace immsupp=0 if immsupp==2
tab immsupp

tab pvd
gen tester = real(pvd)
drop pvd
gen pvd=tester
drop tester
replace pvd=. if pvd==3
replace pvd=0 if pvd==2
tab pvd

tab cvdtype
drop cvdtype
tab cvd
gen tester = real(cvd)
drop cvd
gen cvd=tester
drop tester
replace cvd=. if cvd==3
replace cvd=0 if cvd==2
tab cvd

tab cva
gen tester = real(cva)
drop cva
gen cva=tester
drop tester
replace cva=. if cva==3
replace cva=0 if cva==2
replace cva=0 if cvd==0
tab cva

tab cvdtia
gen tester = real(cvdtia)
drop cvdtia
gen cvdtia=tester
drop tester
replace cvdtia=. if cvdtia==3
replace cvdtia=0 if cvdtia==2
replace cvdtia=0 if cvd==0
tab cvdtia

codebook hct
gen tester = real(hct)
drop hct
gen hct=tester
drop tester
sum hct if hct<10
sum hct if hct>70

codebook platelets
gen tester = real(platelets)
drop platelets
gen platelets=tester
drop tester
codebook platelets

sum creatlst, detail
gen tester = real(creatlst)
drop creatlst
gen creatlst=tester
drop tester
codebook creatlst

sum totalbumin, detail 
gen tester = real(totalbumin)
drop totalbumin
gen totalbumin=tester
drop tester
codebook totalbumin 

sum totblrbn, detail
gen tester = real(totblrbn)
drop totblrbn
gen totblrbn=tester
drop tester
codebook totblrbn

sum a1clvl, detail
gen tester = real(a1clvl)
drop a1clvl
gen a1clvl=tester
drop tester
codebook a1clvl

sum inr, detail
gen tester = real(inr)
drop inr
gen inr=tester
drop tester
codebook inr

sum meldscr, detail
gen tester = real(meldscr)
drop meldscr
gen meldscr=tester
drop tester
codebook meldscr

tab prevmi
gen tester = real(prevmi)
drop prevmi
gen prevmi=tester
drop tester
replace prevmi=. if prevmi==3
replace prevmi=0 if prevmi==2
tab prevmi

tab miwhen
gen tester = real(miwhen)
drop miwhen
gen miwhen=tester
drop tester
label define timing 1 "<=6" 2 "6-24" 3 "1-7d" 4 "8-21" 5 ">21"
label value miwhen timing
tab miwhen
tab prevmi miwhen

tab chf 
gen tester = real(chf)
drop chf
gen chf=tester
drop tester
tab chf datav
tab heartfail datav
replace chf=. if chf==3
replace chf=0 if chf==2
replace chf=1 if heartfail=="1"
replace chf=0 if heartfail=="2"
tab chf datav, col chi2

tab classnyh
gen tester = real(classnyh)
drop classnyh
gen classnyh=tester
drop tester
replace classnyh=. if classnyh==5
tab classnyh
tab classnyh chf, m

tab priorhf
tab priorhf datav
drop priorhf

tab arrhythmia datav
gen tester = real(arrhythmia)
drop arrhythmia
gen arrhythmia=tester
drop tester
tab arrhythwhen datav
replace arrhythmia=1 if arrhythwhen=="2"|arrhythwhen=="3"
replace arrhythmia=2 if arrhythwhen=="1"
replace arrhythmia=. if arrhythmia==3
replace arrhythmia=0 if arrhythmia==2
tab arrhythmia datav, col chi2

tab arrhyafib datavrsn, col
tab arrhythafib datavrsn, col
tab arrhythaflutter datavrsn, col
tab arrhythatrfib datavrsn, col

gen afib =.
replace afib=0 if arrhythmia==0
replace afib=1 if arrhyafib=="1"
replace afib=1 if arrhythafib=="2"|arrhythafib=="3"
replace afib=1 if arrhythafib=="4"|arrhythafib=="5"|arrhythafib=="6"
replace afib=1 if arrhythatrfib=="2"|arrhythatrfib=="3"
replace afib=1 if arrhythaflutter=="2"|arrhythaflutter=="3"
tab afib datav, col chi2
tab afib arrhythmia

tab medinotr
gen tester = real(medinotr)
drop medinotr
gen medinotr=tester
drop tester
replace medinotr=. if medinotr==3
replace medinotr=0 if medinotr==2
tab medinotr 

**************************************************************************
//Previous Cardiac Interventions

tab prcvint 
gen tester = real(prcvint)
drop prcvint
gen prcvint=tester
drop tester
replace prcvint=. if prcvint==3
replace prcvint=0 if prcvint==2
tab prcvint 

tab prcab 
tab prvalve
tab prcab
tab prvalve
drop if prcab=="1" 
drop if prvalve=="1" 
drop prcab 
drop prvalve
drop prvalveproc1 prvalveproc2 prvalveproc3 prvalveproc4 prvalveproc5
drop prvalvemonths
drop prevprocavreplace prevprocavrepair prevprocmvreplace prevprocmvrepair prevproctvreplace
drop prevproctvrepair prevprocpv prevprocavball prevprocmvball
drop prevproctcvrep prevprocpercvrepai indreop 

tab poc

tab pocint1 datav
gen tester = real(pocint1)
drop pocint1
gen pocint1=tester
drop tester
tab pocint1 datav

drop if pocint1>=5 & pocint1<=12
drop if pocint1==14 | pocint1==15 |pocint1==17
drop if pocint1==19 
drop if pocint1==23 
drop if pocint1>=26 & pocint1<=38

tab poc

tab pocint2 datav
gen tester = real(pocint2)
drop pocint2
gen pocint2=tester
drop tester
tab pocint2 datav

drop if pocint2>=5 & pocint2<=12
drop if pocint2==14 | pocint2==15 |pocint2==17 
drop if pocint2==19 
drop if pocint2==23 
drop if pocint2>=26 & pocint2<=38

tab poc

tab pocint3 datav
gen tester = real(pocint3)
drop pocint3
gen pocint3=tester
drop tester
tab pocint3 datav

drop if pocint3>=5 & pocint3<=12 
drop if pocint3==14 | pocint3==15 |pocint3==17 
drop if pocint3==19 
drop if pocint3==23 
drop if pocint3>=26 & pocint3<=38 

tab pocint4 datav
gen tester = real(pocint4)
drop pocint4
gen pocint4=tester
drop tester
tab pocint4 datav

drop if pocint4>=5 & pocint4<=12 
drop if pocint4==14 | pocint4==15 |pocint4==17 
drop if pocint4==19 
drop if pocint4==23 
drop if pocint4>=26 & pocint4<=38 

tab pocint5 datav
gen tester = real(pocint5)
drop pocint5
gen pocint5=tester
drop tester
tab pocint5 datav

drop if pocint5>=5 & pocint5<=12 
drop if pocint5==14 | pocint5==15 |pocint5==17 
drop if pocint5==19 
drop if pocint5==23 
drop if pocint5>=26 & pocint5<=38 

tab pocint6 datav
gen tester = real(pocint6)
drop pocint6
gen pocint6=tester
drop tester
tab pocint6 datav

drop if pocint6>=5 & pocint6<=12 
drop if pocint6==14 | pocint6==15 |pocint6==17 
drop if pocint6==19 
drop if pocint6==23 
drop if pocint6>=26 & pocint6<=38 

tab pocint7 datav
gen tester = real(pocint7)
drop pocint7
gen pocint7=tester
drop tester
tab pocint7 datav

drop if pocint7>=5 & pocint7<=12 
drop if pocint7==14 | pocint7==15 |pocint7==17 
drop if pocint7==19 
drop if pocint7==23 
drop if pocint7>=26 & pocint7<=38 

tab poc 
drop poc
drop pocint1 pocint2 pocint3 pocint4 pocint5 pocint6 pocint7
tab prcvint datav, col 

tab pocpci
gen tester = real(pocpci)
drop pocpci
gen pocpci=tester
drop tester
replace pocpci=0 if pocpci==2
replace pocpci=0 if prcvint==0
tab pocpci datav, col chi2
tab prcvint pocpci

tab pocpcist datav
gen tester = real(pocpcist)
drop pocpcist
gen pocpcist=tester
drop tester
replace pocpcist=0 if pocpcist==2
replace pocpcist=0 if prcvint==0
tab pocpcist

tab pocpciin
gen tester = real(pocpciin)
drop pocpciin
gen pocpciin=tester
drop tester
label define stenttime 1 "<=6" 2 ">6"
label values pocpciin stenttime
tab pocpciin

tab prothcar datavrsn 
tab prothcar procaicd

drop if prothcar=="1"
drop prothcar
tab poarr
drop poarr
tab prothcongen
drop if prothcongen=="1" 

tab procaicd
gen tester = real(procaicd)
drop procaicd
gen procaicd=tester
drop tester
replace procaicd=0 if procaicd==2
tab procaicd datav
tab procpace 
tab poco datav 

*******************************************************************

tab carcathper datav
gen tester = real(carcathper)
drop carcathper
gen carcathper=tester
drop tester
replace carcathper=0 if carcathper==2
tab carcathper datav

tab numdisv
gen tester = real(numdisv)
drop numdisv
gen numdisv=tester
drop tester
replace numdisv=numdisv-1
tab numdisv datav, col

tab syntaxscrknown
gen tester = real(syntaxscrknown)
drop syntaxscrknown
gen syntaxscrknown=tester
drop tester
replace syntaxscrknown = 0 if syntaxscrknown==2
tab syntaxscrknown datav

tab hdefd
gen tester = real(hdefd)
drop hdefd
gen hdefd=tester
drop tester
replace hdefd=0 if hdefd==2
tab hdefd 

sum hdef
gen tester = real(hdef)
drop hdef
gen hdef=tester
drop tester
codebook hdef
sum hdef if hdef<10
sum hdef if hdef>90

sum lvsd, detail
gen tester = real(lvsd)
drop lvsd
gen lvsd=tester
drop tester
sum lvsd, detail

sum lvedd, detail
gen tester = real(lvedd)
drop lvedd
gen lvedd=tester
drop tester
sum lvedd, detail

sum pasys, detail
gen tester = real(pasys)
drop pasys
gen pasys=tester
drop tester
sum pasys, detail

tab vdinsufa
gen tester = real(vdinsufa)
drop vdinsufa
gen vdinsufa=tester
drop tester
replace vdinsufa=. if vdinsufa==5
label define mit 0 "none" 1 "trace" 2 "mild" 3 "mod" 4 "sev"
label values vdinsufa mit
tab vdinsufa datav, m

tab vdaort
gen tester = real(vdaort)
drop vdaort
gen vdaort=tester
drop tester
replace vdaort=0 if vdaort==2
tab vdaort 
tab vdaort vdinsufa
tab vdaort vdinsufa if datav<2.8 
replace vdinsufa=0 if datav<2.8 & vdaort==0
tab vdinsufa datav, col chi2

tab vdstena datavrsn
gen tester = real(vdstena)
drop vdstena
gen vdstena=tester
drop tester
replace vdstena=. if vdstena==3
replace vdstena=0 if vdstena==2
tab vdstena datavrsn
tab vdstena vdaort
replace vdstena=0 if vdaort==0
tab vdstena datavrsn, col chi2

tab vdinsufm datav
gen tester = real(vdinsufm)
drop vdinsufm
gen vdinsufm=tester
drop tester
replace vdinsufm=. if vdinsufm==5
label define mit 0 "none" 1 "trace" 2 "mild" 3 "mod" 4 "sev"
label values vdinsufm mit
tab vdinsufm 

tab vdmit 

tab vdstenm
gen tester = real(vdstenm)
drop vdstenm
gen vdstenm=tester
drop tester
replace vdstenm=. if vdstenm==3
replace vdstenm=0 if vdstenm==2
tab vdstenm
tab vdstenm vdmit, m
replace vdstenm = 0 if vdmit=="2"
tab vdstenm

drop vdmit

sum vdmva, detail
sum vdgradm, detail
sum vdgradm if vdstenm==0, detail
sum vdgradm if vdstenm==1, detail

tab vdmitet datavrsn
tab vdmiet1 datavrsn
tab vdmiet2 datavrsn
tab vdmiet3 datavrsn
tab vdmiprimet datavrsn
drop if vdmiprimet == "16" 
drop if vdmiet1== "17" 
drop if vdmiet2== "17" 
drop if vdmiet3== "17" 

gen tester = real(vdmitet)
drop vdmitet
gen vdmitet=tester
drop tester

label define etiology 1 "degen" 2 "endocard" 3 "rheumatic" 4 "ischemic" 5 "congenital" 6 "HOCM" 7 "tumor" 8 "trauma" 9 "NICMY" 10 "other"
label values vdmitet etiology
tab vdmitet datavrsn

gen mitral_etiology=.
label values mitral_etiology etiology
replace mitral_etiology=vdmitet
replace mitral_etiology=1 if (vdmiprimet == "1") | (vdmiprimet == "15")
replace mitral_etiology=2 if vdmiprimet == "6"
replace mitral_etiology=3 if vdmiprimet == "2"
replace mitral_etiology=4 if (vdmiprimet == "3") | (vdmiprimet == "4")
replace mitral_etiology=5 if vdmiprimet == "14"
replace mitral_etiology=6 if vdmiprimet == "7"
replace mitral_etiology=7 if (vdmiprimet == "8") | (vdmiprimet == "9") | (vdmiprimet == "10") | (vdmiprimet == "11")
replace mitral_etiology=8 if vdmiprimet == "13" 
replace mitral_etiology=9 if vdmiprimet == "5"
replace mitral_etiology=10 if (vdmiprimet == "12") | (vdmiprimet == "16") | (vdmiprimet == "17") | (vdmiprimet == "18")
tab mitral_etiology datavrsn, col

replace mitral_etiology=1 if vdmiet1 == "3"
replace mitral_etiology=2 if vdmiet1 == "8"
replace mitral_etiology=3 if vdmiet1 == "4"
replace mitral_etiology=4 if (vdmiet1 == "5") | (vdmiet1 == "6")
replace mitral_etiology=5 if vdmiet1== "16"
replace mitral_etiology=6 if vdmiet1 == "9"
replace mitral_etiology=7 if (vdmiet1 == "10") | (vdmiet1 == "11") | (vdmiet1 == "12") | (vdmiet1 == "13")
replace mitral_etiology=8 if  vdmiet1== "15"
replace mitral_etiology=9 if vdmiet1 == "7"
replace mitral_etiology=10 if (vdmiet1 == "1") | (vdmiet1 == "17") | (vdmiet1 == "18") | (vdmiet1 == "14")
tab mitral_etiology datavrsn, col

tab vdmiet2 

tab vdmiet2 datavrsn if vdmiet1== "1"
tab vdmiet2 datavrsn if vdmiet1== "18"
replace mitral_etiology=1 if (vdmiet1== "18") & (vdmiet2== "3")
replace mitral_etiology=2 if vdmiet2 == "8"
tab mitral_etiology datavrsn, col 
tab vdmiet3

tab mihemodatavail
drop mihemodatavail

********************************************************************************

******************************************************************************

tab vdtr
gen tester = real(vdtr)
drop vdtr
gen vdtr=tester
drop tester
replace vdtr=0 if vdtr==2
tab vdtr  

tab vdinsuft datav
gen tester = real(vdinsuft)
drop vdinsuft
gen vdinsuft=tester
drop tester
replace vdinsuft=. if vdinsuft==5
label values vdinsuft mit
tab vdinsuft datav
tab vdtr vdinsuft if datav<2.8, m
replace vdinsuft=0 if vdtr==0 & datav<2.8
tab vdinsuft datav, col 

tab vdstent datav
gen tester = real(vdstent)
drop vdstent
gen vdstent=tester
drop tester
replace vdstent=. if vdstent==3
replace vdstent=0 if vdstent==2
tab vdstent datav
tab vdstent vdtr, m
replace vdstent=0 if vdtr==0
tab vdstent datav

tab vdtrannm datav
drop vdtrannm vdtranns 

tab vdtret datav
gen tester = real(vdtret)
drop vdtret
gen vdtret=tester
drop tester
label define tricus 1 "fxn" 2 "endo" 3 "congen" 4 "tumor" 5 "trauma" 6 "oth"
gen tricus_etiol=vdtret
label values tricus_etiol tricus
tab tricus_etiol datav 
tab vdtrprimet datav

replace tricus_etiol=1 if vdtrprimet=="1"
replace tricus_etiol=2 if vdtrprimet=="2"
replace tricus_etiol=4 if vdtrprimet=="3"
replace tricus_etiol=3 if vdtrprimet=="4"
replace tricus_etiol=1 if vdtrprimet=="5"
replace tricus_etiol=5 if vdtrprimet=="6"
replace tricus_etiol=6 if vdtrprimet=="7"
replace tricus_etiol=4 if vdtrprimet=="8"
replace tricus_etiol=5 if vdtrprimet=="9"
replace tricus_etiol=6 if vdtrprimet=="11"|vdtrprimet=="12"

tab vdtret1 datav

replace tricus_etiol=6 if vdtret1=="1"
replace tricus_etiol=1 if vdtret1=="3"
replace tricus_etiol=2 if vdtret1=="4"
replace tricus_etiol=4 if vdtret1=="5"
replace tricus_etiol=3 if vdtret1=="6"
replace tricus_etiol=1 if vdtret1=="7"
replace tricus_etiol=5 if vdtret1=="8"
replace tricus_etiol=6 if vdtret1=="9"
replace tricus_etiol=4 if vdtret1=="10"
replace tricus_etiol=5 if vdtret1=="11"
replace tricus_etiol=6 if vdtret1=="12"|vdtret1=="13"

tab vdtret2 if vdtret1=="13"
tab tricus_etiol datav

***************OPERATIVE**********************************

tab incidenc datav, m 
keep if incidenc == "1" 
tab incidenc
drop incidenc

tab status datav
gen tester = real(status)
drop status
gen status=tester
drop tester

label define sta 1 "elective" 2 "urgent" 3 "emergent" 4 "salvage"
label values status sta
tab status 

tab urgemergrsn datav

tab pcanccase datav
replace pcanccase=0 if pcanccase==2
tab pcanccase 

tab opapp datav
gen tester = real(opapp)
drop opapp
gen opapp=tester
drop tester
tab opapp datav
gen approach=1 if opapp==1
replace approach=2 if (opapp>1) & opapp<19
label define appppp 1 "stern" 2 "other"
label values approach appppp
tab approach

tab approachcon datav 
drop approachcon

tab robotic datav
gen tester = real(robotic)
drop robotic
gen robotic=tester
drop tester
replace robotic=0 if robotic==2
tab robotic
tab robotic approach

tab opcab datav
gen tester = real(opcab)
drop opcab
gen opcab=tester
drop tester
drop if opcab==1 
drop if opcab==3 
replace opcab=1 if opcab==4|opcab==5
replace opcab=0 if opcab==2
tab opcab 

tab opvalve
drop opvalve

tab vadproc datav 
gen tester = real(vadproc)
drop vadproc
gen vadproc=tester
drop tester
replace vadproc=2 if vadproc==5
replace vadproc=vadproc-1
tab vadproc datav 
tab vadind datav 
tab vadproc vadind
gen tester = real(vadind)
drop vadind
gen vadind=tester
drop tester
replace vadproc=1 if vadind >= 1 & vadind <= 7 & datav > 2.85
replace vadproc=0 if vadind==. & datav > 2.85
tab vadproc datav
replace vadproc=1 if vadproc==2 | vadproc==3
tab vadproc datav
tab opcab vadproc, m

tab opocard datav
gen tester = real(opocard)
drop opocard
gen opocard=tester
drop tester
replace opocard=1 if opocard==3|opocard==4|opocard==5
replace opocard=0 if opocard==2
tab opocard datav

tab oponcard
gen tester = real(oponcard)
drop oponcard
gen oponcard=tester
drop tester
replace oponcard=0 if oponcard==2
tab oponcard datav 

tab aortproc datav 
gen tester = real(aortproc)
drop aortproc
gen aortproc=tester
drop tester

tab afibproc datav 
gen tester = real(afibproc)
drop afibproc
gen afibproc=tester
drop tester

tab ocarafibsur datav
gen tester = real(ocarafibsur)
drop ocarafibsur
gen ocarafibsur=tester
drop tester
replace afibproc=ocarafibsur if datavrsn<2.8
tab afibproc datav
replace afibproc=0 if afibproc==2
tab afibproc datav
replace afibproc=0 if opocard==0 & datav <2.8
tab afibproc datav
drop ocarafibsur

tab cpbutil datav
gen tester = real(cpbutil)
drop cpbutil
gen cpbutil=tester
drop tester
replace cpbutil=cpbutil-1
replace cpbutil=1 if cpbutil==2
tab cpbutil datav
tab cpbcmb datav
drop cpbcmb

codebook perfustm
gen tester = real(perfustm)
drop perfustm
gen perfustm=tester
drop tester
sum perfustm if perfustm<10
sum perfustm if perfustm>300
sum perfustm if perfustm>800

tab circarr
gen tester = real(circarr)
drop circarr
gen circarr=tester
drop tester
replace circarr=0 if circarr==2
tab circarr datav

sum dhcatm
gen tester = real(dhcatm)
drop dhcatm
gen dhcatm=tester
drop tester
sum dhcatm
sum dhcatm if circarr==1
sum dhcatm if dhcatm==0
replace dhcatm = 0 if circarr==0
sum dhcatm, detail

tab cperfutil datav
gen tester = real(cperfutil)
drop cperfutil
gen cperfutil=tester
drop tester
replace cperfutil=0 if cperfutil==2
replace cperfutil=0 if circarr==0
tab cperfutil datav
sum cperftime
gen tester = real(cperftime)
drop cperftime
gen cperftime=tester
drop tester

tab aortoccl datav
gen tester = real(aortoccl)
drop aortoccl
gen aortoccl=tester
drop tester
replace aortoccl=aortoccl-1
replace aortoccl=aortoccl-1 if aortoccl>2
label define xcl 1 "xclamp" 2 "balloon" 3 "beating" 4 "fib"
label values aortoccl xcl
tab aortoccl datav

sum xclamptm, detail
gen tester = real(xclamptm)
drop xclamptm
gen xclamptm=tester
drop tester
sum xclamptm if aortoccl==1
sum xclamptm if aortoccl==2
sum xclamptm if aortoccl==3
sum xclamptm if aortoccl==4
replace xclamptm=0 if aortoccl==3 | aortoccl==4
sum xclamptm, detail

tab ibldprod datav
gen tester = real(ibldprod)
drop ibldprod
gen ibldprod=tester
drop tester
replace ibldprod=0 if ibldprod==2
tab ibldprod

tab prepmr datav
gen tester = real(prepmr)
drop prepmr
gen prepmr=tester
drop tester
replace prepmr=. if prepmr==6
replace prepmr=prepmr-1
label values prepmr mit
tab prepmr datav, col

tab preptr datav
gen tester = real(preptr)
drop preptr
gen preptr=tester
drop tester
replace preptr=. if preptr==6
replace preptr=preptr-1
label values preptr mit
tab preptr datav 

tab valexp datav
gen tester = real(valexp)
drop valexp
gen valexp=tester
drop tester
replace valexp=0 if valexp==2
tab valexp datav
tab valexp mitralintent
drop if valexp==1
drop valexp

tab vsav datav 
gen tester = real(vsav)
drop vsav
gen vsav=tester
drop tester

drop if vsav==1 
drop if vsav==3 
replace vsav=1 if vsav==4|vsav==5
replace vsav=0 if vsav==2
tab vsav datav 

tab vsavpr //mostly replacements

tab vstcvr
drop if vstcvr=="3" //2 TAVRs
drop vstcvr

tab anlrenl datav //11 root enlargements, likely unplanned, left
tab aorticimplant
drop aorticimplant
tab vsmv datav
drop vsmv

tab vsmvpr
tab proc_id vsmvpr
tab proc_id

tab vsmitrannulo
gen tester = real(vsmitrannulo)
drop vsmitrannulo
gen vsmitrannulo=tester
drop tester
replace vsmitrannulo=0 if vsmitrannulo==2
replace vsmitrannulo=0 if vsmvpr==1 & vsmitrannulo==.
tab vsmitrannulo datav //denominator is all repairs here

tab vsmitrleafres datav
gen tester = real(vsmitrleafres)
drop vsmitrleafres
gen vsmitrleafres=tester
drop tester
replace vsmitrleafres=0 if vsmitrleafres==2
replace vsmitrleafres=0 if vsmvpr==1 & vsmitrleafres==.
tab vsmitrleafres datav

tab vsleafrestyp datav
gen tester = real(vsleafrestyp)
drop vsleafrestyp
gen vsleafrestyp=tester
drop tester
label define restyp 1 "tri" 2 "quad" 3 "other"
label values vsleafrestyp restyp //this is all subset within vsmitrleafres
tab vsleafrestyp vsmitrleafres, m

tab vsleafreploc datav
gen tester = real(vsleafreploc)
drop vsleafreploc
gen vsleafreploc=tester
drop tester
tab vsleafantres datav 
tab vsleafpostres datav
tab vsleafcomres datav
replace vsleafreploc = 1 if vsleafantres== "1"
replace vsleafreploc = 2 if vsleafpostres== "1"
replace vsleafreploc = 3 if vsleafcomres == "1"
replace vsleafreploc = 3 if vsleafantres== "1" & vsleafpostres== "1"
tab vsleafreploc datav
label define locs 1 "ant" 2 "post" 3 "both/oth"
label values vsleafreploc locs
tab vsleafreploc datav

tab vsmitrslidp datav
gen tester = real(vsmitrslidp)
drop vsmitrslidp
gen vsmitrslidp=tester
drop tester
replace vsmitrslidp=0 if vsmitrslidp==2
replace vsmitrslidp=0 if vsmvpr==1 & vsmitrslidp==.
tab vsmitrslidp datav

tab vsmitradecalc datav
gen tester = real(vsmitradecalc)
drop vsmitradecalc
gen vsmitradecalc=tester
drop tester
replace vsmitradecalc=0 if vsmitradecalc==2
replace vsmitradecalc=0 if vsmvpr==1 & vsmitradecalc==.
tab vsmitradecalc datav

tab vsmitrptfe datav
gen tester = real(vsmitrptfe)
drop vsmitrptfe
gen vsmitrptfe=tester
drop tester
replace vsmitrptfe=0 if vsmitrptfe==2
replace vsmitrptfe=0 if vsmvpr==1 & vsmitrptfe==.
tab vsmitrptfe datav

tab vsmitrchord datav
gen tester = real(vsmitrchord)
drop vsmitrchord
gen vsmitrchord=tester
drop tester
replace vsmitrchord=0 if vsmitrchord==2
replace vsmitrchord=0 if vsmvpr==1 & vsmitrchord==.
tab vsmitrchord datav

tab vsmitrleaferp datav
gen tester = real(vsmitrleaferp)
drop vsmitrleaferp
gen vsmitrleaferp=tester
drop tester
replace vsmitrleaferp=0 if vsmitrleaferp==2
replace vsmitrleaferp=0 if vsmvpr==1 & vsmitrleaferp==.
tab vsmitrleaferp datav

tab vsmitredge datav
gen tester = real(vsmitredge)
drop vsmitredge
gen vsmitredge=tester
drop tester
replace vsmitredge=0 if vsmitredge==2
replace vsmitredge=0 if vsmvpr==1 & vsmitredge==.
tab vsmitredge datav

tab vsmitrmleafclip datav 

tab vsmitrmitcomm datav
gen tester = real(vsmitrmitcomm)
drop vsmitrmitcomm
gen vsmitrmitcomm=tester
drop tester
replace vsmitrmitcomm=0 if vsmitrmitcomm==2
replace vsmitrmitcomm=0 if vsmvpr==1 & vsmitrmitcomm==.
tab vsmitrmitcomm datav

tab vsneochnum datav 
drop vsneochnum
tab vstcvmit 

drop vsleafantres
drop vsleafpostres
drop vsleafcomres
drop prepmpvl
drop vsmvrepapp
drop prepmgradm
drop vsneoant vsneopost vsneocom
drop vsneocomloc

//folding plasty, commisuroplasty, and cleft rep all in 2.8+ but good

tab mitralintent datav
gen tester = real(mitralintent)
drop mitralintent
gen mitralintent=tester
drop tester
replace mitralintent=0 if mitralintent==2
label define olaf 0 "replace" 1 "repair attempt"
label values mitralintent olaf
tab mitralintent vsmvpr //more than the vsmvpr, all encompassed in replace
tab mitralintent proc_id, m
tab mitralintent vsmvpr, m
tab mitralintent proc_id, col

tab vschorpres datav
gen tester = real(vschorpres)
drop vschorpres
gen vschorpres=tester
drop tester
label define asdfasdf 1 "none" 2 "ant" 3 "psot" 4 "both" 
label values vschorpres asdfasdf
tab vschorpres datav
tab vschorpres proc_id

tab mitralimplant datav //unfort only know bio vs mech in 2.8 on
gen tester = real(mitralimplant)
drop mitralimplant
gen mitralimplant=tester
drop tester
replace mitralimplant=0 if mitralimplant==2
tab mitralimplant proc_id, m //30 pt with replacements but no implant 

tab mitralimplantty
gen tester = real(mitralimplantty)
drop mitralimplantty
gen mitralimplantty=tester
drop tester
replace mitralimplantty=6 if mitralimplantty==7
label define valvety 1 "mech" 2 "clip" 3 "bio" 4 "tvt" 5 "ring" 6 "other"
label values mitralimplantty valvety
tab mitralimplantty datav
tab mitralimplantty proc_id

tab vstv datav
tab optricus datav
gen tester = real(optricus)
drop optricus
gen optricus=tester
drop tester
replace optricus=optricus-1
label define vtricc 0 "none" 1 "annulo onl" 2 "replace" 3 "recon+ann" 4 "recon onl" 5 "ectomy"
label values optricus vtricc
tab optricus datav, col

tab vstrrepannul datav
replace optricus=1 if vstrrepannulo=="1"
tab vstrreplace datav
replace optricus=2 if vstrreplace=="1"
tab tricusimplantty datav 
tab vstrleafres
replace optricus=4 if vstrleafres== "1"
replace optricus=3 if vstrleafres== "1" & vstrrepannulo== "1"
tab optricus datav
replace optricus=0 if vstv=="2"
tab optricus datav, col

gen tvrep=.
replace tvrep=0 if optricus==0
replace tvrep=1 if optricus==1|optricus==2|optricus==3|optricus==4
tab tvrep datav

drop vstcvtri

tab prevvad
drop if prevvad== "1" //7
tab prevvad
drop prevvad
drop prevvadf
drop prevvadin prevvadty

tab iabp
gen tester = real(iabp)
drop iabp
gen iabp=tester
drop tester
replace iabp=0 if iabp==2
tab iabp

tab iabpwhen
gen tester = real(iabpwhen)
drop iabpwhen
gen iabpwhen=tester
drop tester
label define ugh 1 "pre" 2 "intra" 3 "post"
label values iabpwhen ugh
tab iabpwhen

gen preop_iabp=.
replace preop_iabp=0 if iabp==0
replace preop_iabp=1 if iabpwhen==1
tab preop_iabp

tab cathbasassist
gen tester = real(cathbasassist)
drop cathbasassist
gen cathbasassist=tester
drop tester
replace cathbasassist=0 if cathbasassist==2
tab cathbasassist

gen preop_impella=.
replace preop_impella=0 if cathbasassist==0
replace preop_impella=1 if cathbasassistwhe=="1"
tab preop_impella datav

tab ecmo datav
tab ecmowhen

gen preop_ecmo=.
replace preop_ecmo=0 if ecmo== "2"
replace preop_ecmo=1 if ecmowhen== "1"
tab preop_ecmo

gen postop_ecmo=.
replace postop_ecmo=0 if ecmo== "2"
replace postop_ecmo=1 if ecmowhen== "2" | ecmowhen== "3" | ecmowhen== "4"
tab postop_ecmo


tab ocaracd datav
gen ppm=.
replace ppm=0 if ocaracd== "1"
replace ppm=1 if ocaracd== "2"
replace ppm=0 if opocard== 0
tab ppm  //too low

tab ocarcrtx 
drop if ocarcrtx=="1" //50
drop ocarcrtx

tab ocarvsd
drop if ocarvsd== "1" |ocarvsd== "3" |ocarvsd== "4" //290 VSDs
drop ocarvsd

tab ocarothr datav 
tab ocarafibmethrad
tab afibproc ocarafibmethrad
tab afibproc ocarafibmethcryo
tab afibproc ocarafibmethcas 

tab ocarasd datav
tab ocarasdpfo datav
replace ocarasd=ocarasdpfo if datav>2.8
tab ocarasd datav
gen tester = real(ocarasd)
drop ocarasd
gen ocarasd=tester
drop tester
replace ocarasd=0 if ocarasd==2
replace ocarasd=0 if opocard==0
tab ocarasd

drop ocaracdli
drop ocarafibaproc
drop ocarafibsurloc

tab ocarafibsurlaa datav
tab afibles7 datav
replace ocarafibsurlaa = afibles7 if datav>2.8
gen tester = real(ocarafibsurlaa)
drop ocarafibsurlaa
gen ocarafibsurlaa=tester
drop tester
replace ocarafibsurlaa=0 if ocarafibsurlaa==2
replace ocarafibsurlaa=0 if opocard==0 & ocarafibsurlaa !=1
tab ocarafibsurlaa datav
tab ocaraaproc datav //adds additional n for 2.8/2.9

replace ocarafibsurlaa=1 if ocaraaproc== "2" |ocaraaproc== "3"
tab ocarafibsurlaa datav
tab opocard ocarafibsurlaa

tab ocarcongdiag1 datav
tab ocarcongproc1

drop ocarcongdiag1 ocarcongdiag2 ocarcongdiag3
drop ocarcongproc1 ocarcongproc2 ocarcongproc3
drop afibles1 afibles7

tab onccaren 

tab oncothor datav
drop if oncothor== "1" |oncothor== "3" //355 
tab oncothor
****************************************************************
*************************************************

tab bldprod
gen tester = real(bldprod)
drop bldprod
gen bldprod=tester
drop tester
replace bldprod=0 if bldprod==2
tab bldprod ibldprod, col chi2

tab extubor
gen tester = real(extubor)
drop extubor
gen extubor=tester
drop tester
replace extubor=. if extubor==3
replace extubor=0 if extubor==2

tab reintub datav
tab postopintub datav
replace reintub=postopintub if datav>2.85
tab reintub datav
gen tester = real(reintub)
drop reintub
gen reintub=tester
drop tester
replace reintub=0 if reintub==2
tab reintub datav

codebook venthrstot
gen tester = real(venthrstot)
drop venthrstot
gen venthrstot=tester
drop tester

codebook venthrsa
gen tester = real(venthrsa)
drop venthrsa
gen venthrsa=tester
drop tester
drop venthrsa
tab icuvisit
codebook icuinhr
gen tester = real(icuinhr)
drop icuinhr
gen icuinhr=tester
drop tester

sum icuinhr
sum icuinhr if icuvisit== "2"
replace icuinhr=0 if icuvisit == "2"
sum icuinhr if icuvisit== "2"

tab popttmr datav
gen tester = real(popttmr)
drop popttmr
gen popttmr=tester
drop tester
replace popttmr=. if popttmr==6
label define aamit 1 "none" 2 "trace" 3 "mild" 4 "mod" 5 "sev"
label values popttmr aamit
tab popttmr, m 
tab popttmr datav, m

tab poptttr datav
gen tester = real(poptttr)
drop poptttr
gen poptttr=tester
drop tester
replace poptttr=. if poptttr==6
label values poptttr aamit
tab poptttr, m 

drop popefd
codebook popef
gen tester = real(popef)
drop popef
gen popef=tester
drop tester

tab complics datav
gen tester = real(complics)
drop complics
gen complics=tester
drop tester
replace complics=0 if complics==2
tab complics, m //45% complication rate of some kind

tab sursinf, m
gen tester = real(sursinf)
drop sursinf
gen sursinf=tester
drop tester
replace sursinf=0 if sursinf==2
tab sursinf datav
tab sursinf complics

tab csepsis, m
gen tester = real(csepsis)
drop csepsis
gen csepsis=tester
drop tester
replace csepsis=0 if csepsis==2
tab csepsis datav
tab csepsis complics
replace csepsis=0 if complics==0
tab csepsis datav, col

tab coprebld
gen tester = real(coprebld)
drop coprebld
gen coprebld=tester
drop tester
replace coprebld=0 if coprebld==2
tab coprebld complics
replace coprebld=0 if complics==0
tab coprebld datav, col

tab copreoth datav
gen tester = real(copreoth)
drop copreoth
gen copreoth=tester
drop tester
replace copreoth=0 if copreoth==2
tab copreoth complics
replace copreoth=0 if complics==0
tab copreoth datav, m

tab coprenon
gen tester = real(coprenon)
drop coprenon
gen coprenon=tester
drop tester
replace coprenon=0 if coprenon==2
tab coprenon complics
replace coprenon=0 if complics==0
tab coprenon datav, m

tab csternal
gen tester = real(csternal)
drop csternal
gen csternal=tester
drop tester
replace csternal=0 if csternal==2
tab csternal complics
replace csternal=0 if complics==0
tab csternal datav, m

tab cnstrokp datav
gen tester = real(cnstrokp)
drop cnstrokp
gen cnstrokp=tester
drop tester
replace cnstrokp=1 if cnstrokp==3|cnstrokp==4|cnstrokp==5
replace cnstrokp=0 if cnstrokp==2
tab cnstrokp datav, col
tab cnstrokp complics
replace cnstrokp=0 if complics==0
tab cnstrokp datav, m

tab cnstrokttia
gen tester = real(cnstrokttia)
drop cnstrokttia
gen cnstrokttia=tester
drop tester
replace cnstrokttia=0 if cnstrokttia==2
tab cnstrokttia datav, col
tab cnstrokttia complics
replace cnstrokttia=0 if complics==0
tab cnstrokttia datav, col

tab cppneum
gen tester = real(cppneum)
drop cppneum
gen cppneum=tester
drop tester
replace cppneum=0 if cppneum==2
tab cppneum datav, col
tab cppneum complics
replace cppneum=0 if complics==0
tab cppneum datav, col

tab cvte
gen tester = real(cvte)
drop cvte
gen cvte=tester
drop tester
replace cvte=0 if cvte==2
tab cvte datav, col
tab cvte complics
replace cvte=0 if complics==0
tab cvte datav, col

tab pulmemb
gen tester = real(pulmemb)
drop pulmemb
gen pulmemb=tester
drop tester
tab pulmemb complics
tab pulmemb cvte
replace pulmemb=0 if pulmemb==2
replace pulmemb=0 if cvte==0
tab pulmemb datav, col

tab crenfail datav
gen tester = real(crenfail)
drop crenfail
gen crenfail=tester
drop tester
replace crenfail=0 if crenfail==2
tab crenfail datav, col
tab crenfail complics
replace crenfail=0 if complics==0 & crenfail!=1
tab crenfail datav, col

tab crendial
gen tester = real(crendial)
drop crendial
gen crendial=tester
drop tester
replace crendial=0 if crendial==2
tab crendial crenfail
replace crendial=0 if crenfail==0
tab crendial datav, col

tab cotarrst
gen tester = real(cotarrst)
drop cotarrst
gen cotarrst=tester
drop tester
replace cotarrst=0 if cotarrst==2
tab cotarrst complics
replace cotarrst=0 if complics==0
tab cotarrst datav, col

tab cotmsf
gen tester = real(cotmsf)
drop cotmsf
gen cotmsf=tester
drop tester
replace cotmsf=0 if cotmsf==2
tab cotmsf complics, col
replace cotmsf=0 if complics==0
tab cotmsf datav, col

tab cotafib
gen tester = real(cotafib)
drop cotafib
gen cotafib=tester
drop tester
replace cotafib=0 if cotafib==2
tab cotafib complics
replace cotafib=0 if complics==0
tab cotafib afib 

tab mortalty
gen tester = real(mortalty)
drop mortalty
gen mortalty=tester
drop tester
replace mortalty=0 if mortalty==2
tab mortalty datav, col //no 2.9 data
tab mtdcstat datav, col //also no 2.9

tab mt30stat datav, col //much better

tab mtdcstat datav
tab dischmortstat datav 

// mt30stat 1 - alive
// mt30stat 2 - dead
// mt30stat 3 - unk

//dischmortstat 1 - in hosp, alive
//dischmortstat 2 - died in hosp
//dischmortstat 3 - discharged alive, last known alive
//dischmortstat 4 - disch alive, died at home

gen mort_30=.
replace mort_30=0 if mt30stat== "1"
replace mort_30=1 if mt30stat== "2"

gen mort_disch=.
replace mort_disch=0 if dischmortstat== "1" | dischmortstat== "3" | dischmortstat== "4"
replace mort_disch=1 if dischmortstat== "2"
replace mort_disch=1 if mtdcstat== "2"
replace mort_disch=0 if mtdcstat== "1"

tab mort_30 datav, col
tab mort_disch datav, col

tab mtcause
gen tester = real(mtcause)
drop mtcause
gen mtcause=tester
drop tester

replace mtcause=. if mtcause==7|mtcause==700|mtcause==777
label define asdfasdfasdf 1 "cardiac" 2 "neuro" 3 "renal" 4 "vasc" 5 "infxn" 6 "pulm" 
label values mtcause asdfasdfasdf
tab mtcause datav, m

tab disloctn mort_disch
tab disloctn datav
gen tester = real(disloctn)
drop disloctn
gen disloctn=tester
drop tester
replace disloctn=. if disloctn==6
replace disloctn=. if disloctn==777
label define disss 1 "home" 2 "rehab" 3 "acute care" 4 "nursing" 5 "hospice"
label values disloctn disss
tab disloctn mort_disch, col

tab cardref datav
gen tester = real(cardref)
drop cardref
gen cardref=tester
drop tester
replace cardref=0 if cardref==2
replace cardref=. if cardref==3
tab cardref

tab readm30 datav
gen tester = real(readm30)
drop readm30
gen readm30=tester
drop tester
tab readm30 datav

tab readmit datav
gen tester = real(readmit)
drop readmit
gen readmit=tester
drop tester
tab readmit datav
replace readmit=readm30 if datavrsn < 2.8
replace readmit=. if readmit==3
replace readmit=0 if readmit==2
tab readmit datav, col

codebook predmort 
gen tester = real(predmort)
drop predmort
gen predmort=tester
drop tester
codebook predmort 

codebook predmm
gen tester = real(predmm)
drop predmm
gen predmm=tester
drop tester
codebook predmm


sum siduration, detail
gen tester = real(siduration)
drop siduration
gen siduration=tester
drop tester
codebook siduration
sum siduration if siduration<20

codebook los
gen tester = real(los)
drop los
gen los=tester
drop tester
codebook los

codebook plos
gen tester = real(plos)
drop plos
gen plos=tester
drop tester
codebook plos

tab mort_30
sum surgtomort
gen tester = real(surgtomort)
drop surgtomort
gen surgtomort=tester
drop tester
sum surgtomort

sum surgtomort if surgtomort<31 
sum surgtomort if surgtomort<31 & mort_30==1
sum surgtomort if surgtomort<30 

tab STSRCHospD
tab STSRCHospD mort_30
tab STSRCHospD mort_disch //strc better
tab STSRCOM
tab STSRCOM complics
tab STSRCPermStroke
tab STSRCPermStroke cnstrokp //strc better
tab STSRCDSWI
tab STSRCDSWI sursinf //different
tab STSRCreop 
tab STSRCreop coprebld //different but strc all encompasisng
tab STSRCMM
tab STSRCMM complics //different
tab STSRcRenFail 
tab STSRcRenFail crenfail //strc better
tab STSRCProlvent
 

**************************************


gen predmort_scaled =predmort*100

gen annualsurgvol_group = .
replace annualsurgvol_group=1 if annualsurgvol <=5
replace annualsurgvol_group=2 if annualsurgvol > 5 & annualsurgvol <=10
replace annualsurgvol_group=3 if annualsurgvol > 10 & annualsurgvol <=15
replace annualsurgvol_group=4 if annualsurgvol > 15 & annualsurgvol <=20
replace annualsurgvol_group=5 if annualsurgvol > 20 & annualsurgvol <=25
replace annualsurgvol_group=6 if annualsurgvol > 25 & annualsurgvol <=30
replace annualsurgvol_group=7 if annualsurgvol > 30 & annualsurgvol <=35
replace annualsurgvol_group=8 if annualsurgvol > 35 & annualsurgvol <=40
replace annualsurgvol_group=9 if annualsurgvol > 40 & annualsurgvol <=45
replace annualsurgvol_group=10 if annualsurgvol > 45 & annualsurgvol <=50
replace annualsurgvol_group=11 if annualsurgvol > 50 & annualsurgvol <=55
replace annualsurgvol_group=12 if annualsurgvol > 55 & annualsurgvol <=60
replace annualsurgvol_group=13 if annualsurgvol > 60 & annualsurgvol <=65
replace annualsurgvol_group=14 if annualsurgvol > 65 & annualsurgvol <=70
replace annualsurgvol_group=15 if annualsurgvol > 70 & annualsurgvol <=75
replace annualsurgvol_group=16 if annualsurgvol > 75 & annualsurgvol <=80
replace annualsurgvol_group=17 if annualsurgvol > 80 & annualsurgvol <=85
replace annualsurgvol_group=18 if annualsurgvol > 85 & annualsurgvol <=90
replace annualsurgvol_group=19 if annualsurgvol > 90 & annualsurgvol <=95
replace annualsurgvol_group=20 if annualsurgvol > 95 & annualsurgvol <=100
replace annualsurgvol_group=21 if annualsurgvol > 100

xtile adi2018grouping = adi2018, nq(5)

******************************************************************
****Data Exploration**********************************************
tab proc_id
tab datav
codebook sts_siteid sts_hospid sts_surgid 
tab surgyear
tab qtr_of_year
graph bar (count), over(surgyear) title("MVR/r over Time")


***********Data Missingness*********************************

codebook adi2018 //missing in 33% of pts as well
codebook adi2015
codebook adidif

codebook distance //missing in 46,368 pts (33.8%)
tab precision if distance!=.
tab precision, m

codebook annualsurgvol // all calculated before exclusions applied
codebook annualhospvol
codebook annualsitevol

tab surgyear, m
tab qtr_of_year, m
tab sts_region, m

tab infendo, m
tab infendty, m
tab admitsrc , m
tab status , m

codebook age
tab female, m
tab race_cong, m

codebook bsa
codebook heightcm
codebook weightkg

tab payorgov, m
tab payorgovmcare, m
tab payorcom, m
tab payorns, m

tab cigsmoker, m
tab diabetes, m
tab diabctrl, m
tab hypertn, m
tab dyslip, m
tab dialysis, m
tab chrlungd, m
tab alcohol, m
tab liverdis, m
tab immsupp, m
tab pvd, m
tab cvd, m
tab cva, m
tab cvdtia, m

codebook hct
codebook platelets
codebook creatlst
codebook totalbumin

codebook totblrbn
codebook a1clvl
codebook inr
codebook meldscr

tab prevmi, m
tab chf, m 
tab classnyh, m
tab arrhythmia, m 
tab afib, m
tab medinotr, m
tab prcvint, m
tab pocpci, m
tab pocpcist, m
tab pocpciin, m
tab carcathper, m
tab numdisv, m

codebook hdef

tab vdstena, m 
tab vdinsufa, m
tab vdinsufm, m
tab vdstenm, m
tab mitral_etiology, m

tab vdtr, m
tab vdinsuft, m
tab vdstent, m
tab tricus_etiol, m

tab opcab, m
tab vsav, m
tab vadproc, m
tab opocard, m
tab oponcard, m
tab aortproc, m
tab anlrenl, m
tab afibproc, m

tab approach, m
tab robotic, m
tab cpbutil, m

codebook perfustm
tab circarr, m

codebook dhcatm
codebook xclamptm
codebook siduration

tab prepmr, m
tab preptr, m 
tab popttmr, m 
tab poptttr, m 

codebook popef
tab cperfutil, m
tab aortoccl, m

tab ibldprod, m
tab proc_id, m
tab vsmitrannulo, m
tab vsmitrleafres, m
tab vsleafrestyp, m //this is subset within all vsmitrleafres
tab vsleafreploc, m
tab vsmitrslidp, m
tab vsmitradecalc, m
tab vsmitrptfe, m
tab vsmitrchord, m
tab vsmitrleaferp, m
tab vsmitredge, m
tab vsmitrmleafclip, m
tab vsmitrmitcomm, m
tab mitralintent proc_id, m
tab mitralintent, m

tab vschorpres proc_id, m
tab mitralimplantty, m

tab optricus, m
tab tvrep, m
tab preop_iabp, m
tab preop_impella, m
tab preop_ecmo, m

tab postop_ecmo, m
tab bldprod, m
tab extubor, m
tab reintub, m

codebook venthrstot
codebook icuinhr
codebook los
codebook plos

tab complics, m
tab STSRCOM, m
tab STSRCMM, m
tab sursinf, m
tab STSRCDSWI, m
tab csepsis, m
tab STSRCreop
tab coprebld, m
tab copreoth, m
tab coprenon, m
tab csternal, m
tab STSRCPermStroke, m
tab cnstrokttia, m
tab cppneum, m
tab cvte, m
tab pulmemb, m
tab STSRcRenFail, m
tab crendial, m
tab STSRCProlvent, m
tab cotarrst, m 
tab cotmsf, m 
tab cotafib, m 
tab afib, m
tab mort_30, m 
tab STSRCHospD, m
tab mtcause, m 
tab disloctn, m 
tab cardref, m 
tab readm30, m 
tab readmit, m 

codebook predmort
codebook surgtomort
codebook adi2015
codebook adi2018

*******************************************************************************
********Start of descriptives*************************************************
codebook sts_siteid sts_hospid sts_surgid 

tab proc_id
xtile adi2018grouping = adi2018, nq(5)

codebook adi2018
codebook adi2015
codebook adidif

tab adi2018grouping, m

tab infendo adi2018grouping, col chi2
tab infendo infendty, row m
tab surgyear, m

codebook distance
sum distance if adi2018grouping==1, detail
sum distance if adi2018grouping==2, detail
sum distance if adi2018grouping==3, detail
sum distance if adi2018grouping==4, detail
sum distance if adi2018grouping==5, detail
kwallis distance, by(adi2018grouping)

codebook annualsurgvol
sum annualsurgvol if adi2018grouping==1, detail
sum annualsurgvol if adi2018grouping==2, detail
sum annualsurgvol if adi2018grouping==3, detail
sum annualsurgvol if adi2018grouping==4, detail
sum annualsurgvol if adi2018grouping==5, detail
kwallis annualsurgvol, by(adi2018grouping)

codebook annualhospvol
sum annualhospvol if adi2018grouping==1, detail
sum annualhospvol if adi2018grouping==2, detail
sum annualhospvol if adi2018grouping==3, detail
sum annualhospvol if adi2018grouping==4, detail
sum annualhospvol if adi2018grouping==5, detail
kwallis annualhospvol, by(adi2018grouping)

codebook annualsitevol
sum annualsitevol if adi2018grouping==1, detail
sum annualsitevol if adi2018grouping==2, detail
sum annualsitevol if adi2018grouping==3, detail
sum annualsitevol if adi2018grouping==4, detail
sum annualsitevol if adi2018grouping==5, detail
kwallis annualsitevol, by(adi2018grouping)

tab admitsrc adi2018grouping, col chi2
tab status adi2018grouping, col chi2

codebook age
sum age if adi2018grouping==1, detail
sum age if adi2018grouping==2, detail
sum age if adi2018grouping==3, detail
sum age if adi2018grouping==4, detail
sum age if adi2018grouping==5, detail
kwallis age, by(adi2018grouping)

tab female adi2018grouping, col chi2
tab race_cong adi2018grouping, col chi2

codebook bsa
sum bsa if adi2018grouping==1, detail
sum bsa if adi2018grouping==2, detail
sum bsa if adi2018grouping==3, detail
sum bsa if adi2018grouping==4, detail
sum bsa if adi2018grouping==5, detail
kwallis bsa, by(adi2018grouping)

codebook heightcm
sum heightcm if adi2018grouping==1, detail
sum heightcm if adi2018grouping==2, detail
sum heightcm if adi2018grouping==3, detail
sum heightcm if adi2018grouping==4, detail
sum heightcm if adi2018grouping==5, detail
kwallis heightcm, by(adi2018grouping)

codebook weightkg
sum weightkg if adi2018grouping==1, detail
sum weightkg if adi2018grouping==2, detail
sum weightkg if adi2018grouping==3, detail
sum weightkg if adi2018grouping==4, detail
sum weightkg if adi2018grouping==5, detail
kwallis weightkg, by(adi2018grouping)

tab payorgov adi2018grouping, col chi2
tab payorgovmcare adi2018grouping, col chi2
tab payorcom adi2018grouping, col chi2
tab payorns adi2018grouping, col chi2

tab cigsmoker adi2018grouping, col chi2
tab diabetes adi2018grouping, col chi2
tab diabctrl adi2018grouping, col chi2
tab hypertn adi2018grouping, col chi2
tab dyslip adi2018grouping, col chi2
tab dialysis adi2018grouping, col chi2
tab chrlungd adi2018grouping, col chi2
tab alcohol adi2018grouping, col chi2
tab liverdis adi2018grouping, col chi2
tab immsupp adi2018grouping, col chi2
tab pvd adi2018grouping, col chi2
tab cvd adi2018grouping, col chi2
tab cva adi2018grouping, col chi2
tab cvdtia adi2018grouping, col chi2

codebook hct
sum hct if adi2018grouping==1, detail
sum hct if adi2018grouping==2, detail
sum hct if adi2018grouping==3, detail
sum hct if adi2018grouping==4, detail
sum hct if adi2018grouping==5, detail
kwallis hct, by(adi2018grouping)

codebook platelets
sum platelets if adi2018grouping==1, detail
sum platelets if adi2018grouping==2, detail
sum platelets if adi2018grouping==3, detail
sum platelets if adi2018grouping==4, detail
sum platelets if adi2018grouping==5, detail
kwallis platelets, by(adi2018grouping)

codebook creatlst
sum creatlst if adi2018grouping==1, detail
sum creatlst if adi2018grouping==2, detail
sum creatlst if adi2018grouping==3, detail
sum creatlst if adi2018grouping==4, detail
sum creatlst if adi2018grouping==5, detail
kwallis creatlst, by(adi2018grouping)

codebook totalbumin
sum totalbumin if adi2018grouping==1, detail
sum totalbumin if adi2018grouping==2, detail
sum totalbumin if adi2018grouping==3, detail
sum totalbumin if adi2018grouping==4, detail
sum totalbumin if adi2018grouping==5, detail
kwallis totalbumin, by(adi2018grouping)

codebook totblrbn
sum totblrbn if adi2018grouping==1, detail
sum totblrbn if adi2018grouping==2, detail
sum totblrbn if adi2018grouping==3, detail
sum totblrbn if adi2018grouping==4, detail
sum totblrbn if adi2018grouping==5, detail
kwallis totblrbn, by(adi2018grouping)

codebook a1clvl
sum a1clvl if adi2018grouping==1, detail
sum a1clvl if adi2018grouping==2, detail
sum a1clvl if adi2018grouping==3, detail
sum a1clvl if adi2018grouping==4, detail
sum a1clvl if adi2018grouping==5, detail
kwallis a1clvl, by(adi2018grouping)

sum inr if adi2018grouping==1, detail
sum inr if adi2018grouping==2, detail
sum inr if adi2018grouping==3, detail
sum inr if adi2018grouping==4, detail
sum inr if adi2018grouping==5, detail
kwallis inr, by(adi2018grouping)

sum meldscr if adi2018grouping==1, detail
sum meldscr if adi2018grouping==2, detail
sum meldscr if adi2018grouping==3, detail
sum meldscr if adi2018grouping==4, detail
sum meldscr if adi2018grouping==5, detail
kwallis meldscr, by(adi2018grouping)

tab prevmi adi2018grouping, col chi2
tab chf adi2018grouping, col chi2
tab classnyh chf
tab arrhythmia adi2018grouping, col chi2
tab afib adi2018grouping, col chi2
tab medinotr adi2018grouping, col chi2

tab prcvint adi2018grouping, col chi2
tab pocpci adi2018grouping, col chi2
tab pocpcist adi2018grouping, col chi2
tab pocpciin adi2018grouping, col chi2

tab carcathper adi2018grouping, col chi2
tab numdisv adi2018grouping, col chi2

sum hdef if adi2018grouping==1, detail
sum hdef if adi2018grouping==2, detail
sum hdef if adi2018grouping==3, detail
sum hdef if adi2018grouping==4, detail
sum hdef if adi2018grouping==5, detail
kwallis hdef, by(adi2018grouping)

tab vdstena adi2018grouping, col chi2
tab vdinsufa adi2018grouping, col chi2
tab vdinsufm adi2018grouping, col chi2
tab vdstenm adi2018grouping, col chi2
tab mitral_etiology adi2018grouping, col chi2

tab vdtr adi2018grouping, col chi2
tab vdinsuft adi2018grouping, col chi2
tab vdstent adi2018grouping, col chi2
tab tricus_etiol adi2018grouping, col chi2

tab opcab adi2018grouping, col chi2
tab vsav adi2018grouping, col chi2
tab vadproc adi2018grouping, col chi2
tab opocard adi2018grouping, col chi2
tab aortproc adi2018grouping, col chi2
tab anlrenl adi2018grouping, col chi2
tab afibproc adi2018grouping, col chi2

tab approach adi2018grouping, col chi2
tab robotic adi2018grouping, col chi2
tab cpbutil adi2018grouping, col chi2

sum perfustm if adi2018grouping==1, detail
sum perfustm if adi2018grouping==2, detail
sum perfustm if adi2018grouping==3, detail
sum perfustm if adi2018grouping==4, detail
sum perfustm if adi2018grouping==5, detail
kwallis perfustm, by(adi2018grouping)

tab circarr datav

sum dhcatm if adi2018grouping==1, detail
sum dhcatm if adi2018grouping==2, detail
sum dhcatm if adi2018grouping==3, detail
sum dhcatm if adi2018grouping==4, detail
sum dhcatm if adi2018grouping==5, detail
kwallis dhcatm, by(adi2018grouping)

tab cperfutil adi2018grouping, col chi2
tab aortoccl adi2018grouping, col chi2

sum xclamptm if adi2018grouping==1, detail
sum xclamptm if adi2018grouping==2, detail
sum xclamptm if adi2018grouping==3, detail
sum xclamptm if adi2018grouping==4, detail
sum xclamptm if adi2018grouping==5, detail
kwallis xclamptm, by(adi2018grouping)

sum siduration if adi2018grouping==1, detail
sum siduration if adi2018grouping==2, detail
sum siduration if adi2018grouping==3, detail
sum siduration if adi2018grouping==4, detail
sum siduration if adi2018grouping==5, detail
kwallis siduration, by(adi2018grouping)

tab ibldprod adi2018grouping, col chi2

tab prepmr adi2018grouping, col chi2
tab preptr adi2018grouping, col chi2
tab popttmr adi2018grouping, col chi2
tab poptttr adi2018grouping, col chi2

sum popef if adi2018grouping==1, detail
sum popef if adi2018grouping==2, detail
sum popef if adi2018grouping==3, detail
sum popef if adi2018grouping==4, detail
sum popef if adi2018grouping==5, detail
kwallis popef, by(adi2018grouping)

tab proc_id adi2018grouping, col chi2
tab vsmitrannulo adi2018grouping, col chi2
tab vsmitrleafres adi2018grouping, col chi2
tab vsleafrestyp adi2018grouping, col chi2 //this is subset within all vsmitrleafres
tab vsleafreploc adi2018grouping, col chi2
tab vsmitrslidp adi2018grouping, col chi2
tab vsmitradecalc adi2018grouping, col chi2
tab vsmitrptfe adi2018grouping, col chi2
tab vsmitrchord adi2018grouping, col chi2
tab vsmitrleaferp adi2018grouping, col chi2
tab vsmitredge adi2018grouping, col chi2
tab vsmitrmleafclip adi2018grouping, col chi2
tab vsmitrmitcomm adi2018grouping, col chi2

tab mitralintent proc_id, m
tab mitralintent proc_id, col
tab mitralintent adi2018grouping, col chi2
tab vschorpres proc_id, m
tab mitralimplantty proc_id //lol

tab optricus adi2018grouping, col chi2
tab tvrep adi2018grouping, col chi2
tab preop_iabp adi2018grouping, col chi2
tab preop_impella adi2018grouping, col chi2
tab preop_ecmo adi2018grouping, col chi2

tab postop_ecmo adi2018grouping, col chi2
tab bldprod adi2018grouping, col chi2
tab bldprod ibldprod
tab extubor adi2018grouping, col chi2
tab reintub adi2018grouping, col chi2

sum venthrstot, detail
sum venthrstot if adi2018grouping==1, detail
sum venthrstot if adi2018grouping==2, detail
sum venthrstot if adi2018grouping==3, detail
sum venthrstot if adi2018grouping==4, detail
sum venthrstot if adi2018grouping==5, detail
kwallis venthrstot, by(adi2018grouping)

sum icuinhr, detail
sum icuinhr if adi2018grouping==1, detail
sum icuinhr if adi2018grouping==2, detail
sum icuinhr if adi2018grouping==3, detail
sum icuinhr if adi2018grouping==4, detail
sum icuinhr if adi2018grouping==5, detail
kwallis icuinhr, by(adi2018grouping)

codebook los
sum los if adi2018grouping==1, detail
sum los if adi2018grouping==2, detail
sum los if adi2018grouping==3, detail
sum los if adi2018grouping==4, detail
sum los if adi2018grouping==5, detail
kwallis los, by(adi2018grouping)

codebook plos
sum plos if adi2018grouping==1, detail
sum plos if adi2018grouping==2, detail
sum plos if adi2018grouping==3, detail
sum plos if adi2018grouping==4, detail
sum plos if adi2018grouping==5, detail
kwallis plos, by(adi2018grouping)

tab complics adi2018grouping, col chi2
tab STSRCOM adi2018grouping, col chi2
tab STSRCMM adi2018grouping, col chi2
tab sursinf adi2018grouping, col chi2
tab csepsis adi2018grouping, col chi2
tab STSRCreop adi2018grouping, col chi2
tab coprebld adi2018grouping, col chi2
tab copreoth adi2018grouping, col chi2
tab coprenon adi2018grouping, col chi2
tab csternal adi2018grouping, col chi2
tab STSRCDSWI adi2018grouping, col chi2
tab STSRCPermStroke adi2018grouping, col chi2
tab cnstrokttia adi2018grouping, col chi2
tab cppneum adi2018grouping, col chi2
tab cvte adi2018grouping, col chi2
tab pulmemb adi2018grouping, col chi2
tab STSRcRenFail adi2018grouping, col chi2
tab crendial adi2018grouping, col chi2
tab cotarrst adi2018grouping, col chi2
tab cotmsf adi2018grouping, col chi2
tab STSRCProlvent adi2018grouping, col chi2
tab cotafib adi2018grouping, col chi2
tab cotafib afib
tab mort_30 adi2018grouping, col chi2
tab STSRCHospD adi2018grouping, col chi2
tab mtcause adi2018grouping, col chi2
tab disloctn adi2018grouping, col chi2
tab cardref adi2018grouping, col chi2
tab readm30 adi2018grouping, col chi2
tab readmit adi2018grouping, col chi2

codebook predmort
sum predmort if adi2018grouping==1, detail
sum predmort if adi2018grouping==2, detail
sum predmort if adi2018grouping==3, detail
sum predmort if adi2018grouping==4, detail
sum predmort if adi2018grouping==5, detail
kwallis predmort, by(adi2018grouping)

codebook surgtomort
sum surgtomort if adi2018grouping==1, detail
sum surgtomort if adi2018grouping==2, detail
sum surgtomort if adi2018grouping==3, detail
sum surgtomort if adi2018grouping==4, detail
sum surgtomort if adi2018grouping==5, detail
kwallis surgtomort, by(adi2018grouping)

tab mort_30 adi2018grouping, col chi2


********************************************************************************
//Distribution of ADI
hist adi2015, width(1) frequency normal
hist adi2018, width(1) frequency normal
stem adi2015, prune
stem adi2018, prune //not normally distributed, mode is 1 for both

sfrancia adi2018
swilk adi2018
sktest adi2018

summarize adi2018
gen m= r(mean)
gen s2 = r(Var)
ksmirnov adi2018 = normal((adi2018-m)/sqrt(s2))
drop m
drop s2

graph box adi2018, over(surgyear)
kwallis adi2018, by(surgyear)
nptrend adi2018, by(surgyear)

summarize adi2018
statsby mean=r(mean) ub=r(ub) lb=r(lb) N=r(N), by(surgyear) clear: ci means adi2018
scatter mean surgyear, ms(0) mcolor(blue) || rcap ub lb surgyear, lcolor(blue)

  //then go back to full cohort
  
summarize adi2018 if surgyear==2012, detail
summarize adi2018 if surgyear==2018, detail

graph box adi2018, by(sts_region)
tab sts_region


gen adi2018grouping=.
replace adi2018grouping=1 if adi2018>=0 & adi2018<=19
replace adi2018grouping=2 if adi2018>=20 & adi2018<=39
replace adi2018grouping=3 if adi2018>=40 & adi2018<=59
replace adi2018grouping=4 if adi2018>=60 & adi2018<=79
replace adi2018grouping=5 if adi2018>=80 & adi2018<=100
tab adi2018grouping

drop adi2018grouping

xtile adi2018grouping = adi2018, nq(5)

gen adi2018grouping=.
replace adi2018grouping=1 if adi2018>=0 & adi2018<=19
replace adi2018grouping=2 if adi2018>=20 & adi2018<=79
replace adi2018grouping=3 if adi2018>=80 & adi2018<=100
tab adi2018grouping

gen adi2018grouping=.
replace adi2018grouping=1 if adi2018>=0 & adi2018<=9
replace adi2018grouping=2 if adi2018>=10 & adi2018<=19
replace adi2018grouping=3 if adi2018>=20 & adi2018<=29
replace adi2018grouping=4 if adi2018>=30 & adi2018<=39
replace adi2018grouping=5 if adi2018>=40 & adi2018<=49
replace adi2018grouping=6 if adi2018>=50 & adi2018<=59
replace adi2018grouping=7 if adi2018>=60 & adi2018<=69
replace adi2018grouping=8 if adi2018>=70 & adi2018<=79
replace adi2018grouping=9 if adi2018>=80 & adi2018<=89
replace adi2018grouping=10 if adi2018>=90 & adi2018<=100
tab adi2018grouping

********************************************************************************

//Is missingness in ADI related to missingness in Distance?
sum adi2018
sum adi2018 if distance==.
sum adi2018 if distance!=.

sum distance
sum distance if adi2015==.
sum distance if adi2015!=. //yes, same info used to calculate ADI needed for distance calc
         


********************************************************************************
//How stable is ADI across time?
sum adidif if adidif==0
tab datav if adidif!=.
tab datav if abs(adidif) < 10

gen tester=0 if abs(adidif) <= 10 & adidif !=.
replace tester=1 if abs(adidif)>10 & adidif!=.
tab tester //quite stable

********************************************************************************

**********************************************************************
//Associate ADI with other SES Metrics


//How do ADI and Race relate?
tab race_cong
graph box adi2018, over(race_cong) 

sum adi2018 if race_cong==1, detail
sum adi2018 if race_cong==2, detail
sum adi2018 if race_cong==3, detail
sum adi2018 if race_cong==4, detail
kwallis adi2018, by(race_cong)

regress adi2018 i.race_cong
regress adi2018 i.race_cong 

//How do ADI and Payor relate?

tab payorgov adi2018grouping, col chi2
tab payorgovmcare adi2018grouping, col chi2
tab payorcom adi2018grouping, col chi2
tab payorns adi2018grouping, col chi2

sum adi2018 if payorgovmcare==0, detail
sum adi2018 if payorgovmcare==1, detail
kwallis adi2018, by(payorgovmcare)

sum adi2018 if payorgov==0, detail
sum adi2018 if payorgov==1, detail
kwallis adi2018, by(payorgov)

sum adi2018 if payorcom==0, detail
sum adi2018 if payorcom==1, detail
kwallis adi2018, by(payorcom)

sum adi2018 if payorns==0, detail
sum adi2018 if payorns==1, detail
kwallis adi2018, by(payorns)


********************************************************************************

//How do ADI and distance, volume relate?
twoway scatter distance adi2018
graph box distance, over(adi2018grouping)
graph box distance, over(adi2018grouping) nooutsides
regress distance adi2018
rvpplot adi2018, yline(0)

sum distance if adi2018grouping==1, detail
sum distance if adi2018grouping==2, detail
sum distance if adi2018grouping==3, detail
sum distance if adi2018grouping==4, detail
sum distance if adi2018grouping==5, detail
kwallis distance, by(adi2018grouping) 

graph box annualsurgvol, over(adi2018grouping) nooutsides
graph box distance, over(adi2018grouping) nooutsides
graph box distance, over(adi2018grouping) nooutsides

********************************************************************************

//How does ADI and presentation of MV disease relate (i.e. diagnosis/urgency?)

tab mitral_etiology
graph box adi2018, over(mitral_etiology)

kwallis adi2018, by(mitral_etiology)

tab infendo
graph box adi2018, over(infendo)
sum adi2018 if infendo==0, detail
sum adi2018 if infendo==1, detail
kwallis adi2018, by(infendo)


sum adi2018 if admitsrc==0, detail
sum adi2018 if admitsrc==1, detail
sum adi2018 if admitsrc==2, detail
sum adi2018 if admitsrc==3, detail
kwallis adi2018, by(admitsrc)
graph box adi2018, over(admitsrc)

sum adi2018 if status==0, detail
sum adi2018 if status==1, detail
kwallis adi2018, by(status)
graph box adi2018, over(status)


*******************************************************************************************
//is adi correlated with  mortality

logistic mort_30 adi2018
logistic mort_disch adi2018
logistic mort_30 adi2015
logistic mort_disch adi2015
logistic mort_30 predmort
stepwise, pr(.01): logistic mort_30 predmort adi2018

logistic STSRCHospD adi2018
fitstat
lroc
logistic STSRCHospD c.adi2018#c.adi2018#c.adi2018 c.adi2018#c.adi2018 c.adi2018
fitstat
lroc
logistic STSRCHospD c.adi2018#c.adi2018#c.adi2018 c.adi2018
fitstat
lroc
logistic STSRCHospD c.adi2018#c.adi2018 c.adi2018
fitstat
lroc

mkspline adi2018s = adi2018, cubic displayknots
mat knots = r(knots)

logistic STSRCHospD predmort adi2018s* 

levelsof adi2018
xbrcspline adi2018s, values(`r(levels)') ref(50) matknots(knots) eform gen(aadi2018 or lb ub)

twoway (line lb ub or aadi2018, lp(- - l) lc(black black black) ) ///
                if inrange(aadi2018,0,100)  , ///
                                scheme(s1mono) legend(off) ///
                                ylabel(0(.25)2, angle(horiz) format(%2.1fc) ) ///
                                xlabel(0(5)100) ///
                                ytitle("Odds ratio of death") ///
                                xtitle("Area Deprivation Index, 2018")
								
drop aadi2018 or lb ub adi2018s* 


mkspline adi2018s = adi2018, cubic nknots(3) displayknots
mat knots = r(knots)


logistic STSRCHospD adi2018s* 

levelsof adi2018
xbrcspline adi2018s, values(`r(levels)') ref(50) matknots(knots) eform gen(aadi2018 or lb ub)

twoway (line lb ub or aadi2018, lp(- - l) lc(black black black) ) ///
                if inrange(aadi2018,0,100)  , ///
                                scheme(s1mono) legend(off) ///
                                ylabel(0(.25)2, angle(horiz) format(%2.1fc) ) ///
                                xlabel(0(5)100) ///
                                ytitle("Odds ratio of death") ///
                                xtitle("Area Deprivation Index, 2018")
								
drop aadi2018 or lb ub adi2018s* 

//it seems it does, linear model best

logistic mort_30 predmort if adi2018 !=.
fitstat, saving(mod1)
margins, at(predmort=(0(0.1)1))
marginsplot

logistic mort_30 predmort adi2018
fitstat, using(mod1) 
margins, at(predmort=(0(0.1)1))
marginsplot // A linear model does add to predictive power of predmort

logistic STSRCHospD predmort

logistic mort_30 adi2018 predmort
logistic mort_30 c.adi2018#c.adi2018#c.adi2018 c.adi2018#c.adi2018 c.adi2018 predmort
logistic mort_30 c.adi2018#c.adi2018#c.adi2018 c.adi2018 predmort
logistic mort_30 c.adi2018#c.adi2018 c.adi2018 predmort
logistic mort_30 adi2018s* predmort
fitstat

mkspline adi2018s = adi2018, cubic displayknots
mat knots = r(knots)


levelsof adi2018
xbrcspline adi2018s, values(`r(levels)') ref(50) matknots(knots) eform gen(aadi2018 or lb ub)

twoway (line lb ub or aadi2018, lp(- - l) lc(black black black) ) ///
                if inrange(aadi2018,0,100)  , ///
                                scheme(s1mono) legend(off) ///
                                ylabel(0(.25)2, angle(horiz) format(%2.1fc) ) ///
                                xlabel(0(5)100) ///
                                ytitle("Adjusted Odds ratio of death") ///
                                xtitle("Area Deprivation Index, 2018")

drop aadi2018 or lb ub adi2018s* 


logit mort_30 c.adi2018#c.adi2018#c.adi2018 c.adi2018#c.adi2018 c.adi2018
predict tester, pr
scatter tester adi2018
drop tester

logistic mort_30 c.adi2018#c.adi2018#c.adi2018 c.adi2018#c.adi2018 c.adi2018 predmort
fitstat, saving(mod1)
margins, at(adi2018=(0(10)100))
marginsplot

logistic mort_30 adi2018 predmort
fitstat, using(mod1)
margins, at(adi2018=(0(10)100))
marginsplot

mkspline adi2018s = adi2018, cubic nknots(3) displayknots
mat knots = r(knots)
logistic STSRCHospD adi2018s* predmort
fitstat, saving(mod1)

logistic mort_30 adi2018 predmort
fitstat, using(mod1)

drop adi2018s*

mkspline adi2018s = adi2018, cubic nknots(3) displayknots
mat knots = r(knots)
logistic mort_30 adi2018s* predmort annualsurgvol
fitstat, saving(mod1)

logistic mort_30 adi2018 predmort annualsurgvol
fitstat, using(mod1)

drop adi2018s*

logistic mort_30 c.adi2018#c.adi2018#c.adi2018 c.adi2018#c.adi2018 c.adi2018 predmort annualsurgvol
fitstat, saving(mod1)

logistic mort_30 adi2018 predmort annualsurgvol
fitstat, using(mod1)

drop adi2018s*

//look at how ADI affects mortality for "low-risk mitrals" (STS<2%)
//N = 67,430


mkspline adi2018s = adi2018, cubic displayknots
mat knots = r(knots)

logistic STSRCHospD predmort adi2018s* 
levelsof adi2018
xbrcspline adi2018s, values(`r(levels)') ref(50) matknots(knots) eform gen(aadi2018 or lb ub)

twoway (line lb ub or aadi2018, lp(- - l) lc(black black black) ) ///
                if inrange(aadi2018,0,100)  , ///
                                scheme(s1mono) legend(off) ///
                                ylabel(0(.25)3.5, angle(horiz) format(%2.1fc) ) ///
                                xlabel(0(5)100) ///
                                ytitle("Odds ratio of death") ///
                                xtitle("Area Deprivation Index, 2018")

drop aadi2018 or lb ub adi2018s* 



////// Model

stepwise, pr(0.05): logistic STSRCHospD adi2018 age1 age2 age3 age4 i.alcohol i.aortinsuf vdstena arrhythmia bmi2 bmi bsaa2 bsaa i.chrlungd cva cvdtia i.diab lvef i.chff hypertn hctt2 hctt immsupp liverdis i.mitinsuf i.payor_ins plt2 plt pvd dialysis creat1 creat2 female shock_cba i.status tricus

logistic STSRCHospD adi2018 age1 age2 age3 age4 i.alcohol i.aortinsuf vdstena arrhythmia bmi2 bmi bsaa2 bsaa i.chrlungd cva cvdtia i.diab lvef i.chff hypertn hctt2 hctt immsupp liverdis i.mitinsuf i.payor_ins plt2 plt pvd dialysis creat1 creat2 female shock_cba i.status tricus
//total model

stepwise, pr(0.05): logistic STSRCHospD adi2018 age1 age2 age3 age4 alcohol aortinsuf vdstena arrhythmia bmi2 bmi bsaa2 bsaa chrlungd cva cvdtia diab lvef chff hypertn hctt2 hctt immsupp liverdis mitinsuf payor_ins plt2 plt pvd dialysis creat1 creat2 female shock_cba status tricus
//stepwise, then the next one is with the categorical

logistic STSRCHospD adi2018 age1 age2 age3 age4 i.aortinsuf vdstena arrhythmia bmi2 bsaa2 bsaa i.chrlungd cva i.diab lvef i.chff hctt immsupp liverdis i.mitinsuf i.payor_ins plt pvd dialysis creat2 shock_cba i.status tricus

melogit STSRCHospD adi2018 age1 age2 age3 age4 i.aortinsuf vdstena arrhythmia bmi2 bsaa2 bsaa i.chrlungd cva i.diab lvef i.chff hctt immsupp liverdis i.mitinsuf i.payor_ins plt pvd dialysis creat2 shock_cba i.status tricus || sts_surgid:, or
predict predicted_probability, mu
roctab STSRCHospD predicted_probability //ROC 0.8336 [0.8254-0.8418] 

melogit STSRCHospD adi2018 age1 age2 age3 age4 i.aortinsuf vdstena arrhythmia bmi2 bsaa2 bsaa i.chrlungd cva i.diab lvef i.chff hctt immsupp liverdis i.mitinsuf i.payor_ins plt pvd dialysis creat2 shock_cba i.status tricus || sts_siteid: || sts_surgid:, or
predict predicted_probability, mu
roctab STSRCHospD predicted_probability //ROC 0.8357 [0.8275-0.8439]

mfpboot, select(0.05) df(1) clear outfile(mfpboot1) replicates(100) seed(101): logistic STSRCHospD adi2018 age1 age2 age3 age4 alcohol aortinsuf vdstena arrhythmia bmi2 bmi bsaa2 bsaa chrlungd cva cvdtia diab lvef chff hypertn hctt2 hctt immsupp liverdis mitinsuf payor_ins plt2 plt pvd dialysis creat1 creat2 female shock_cba status tricus

logistic STSRCHospD adi2018 age1 age2 age3 age4 i.aortinsuf arrhythmia bsaa2 bsaa i.chrlungd cva i.diab lvef i.chff hctt2 immsupp liverdis i.mitinsuf plt2 plt creat2 shock_cba i.status tricus

melogit STSRCHospD adi2018 age1 age2 age3 age4 i.aortinsuf arrhythmia bsaa2 bsaa i.chrlungd cva i.diab lvef i.chff hctt2 immsupp liverdis i.mitinsuf plt2 plt creat2 shock_cba i.status tricus || sts_surgid:, or
predict predicted_probability, mu
roctab STSRCHospD predicted_probability

melogit STSRCHospD adi2018 age1 age2 age3 age4 i.aortinsuf arrhythmia bsaa2 bsaa i.chrlungd cva i.diab lvef i.chff hctt2 immsupp liverdis i.mitinsuf plt2 plt creat2 shock_cba i.status tricus || sts_siteid: || sts_surgid:, or
predict predicted_probability, mu
roctab STSRCHospD predicted_probability

melogit STSRCHospD age1 age2 age3 age4 i.aortinsuf arrhythmia bsaa2 bsaa i.chrlungd cva i.diab lvef i.chff hctt2 immsupp liverdis i.mitinsuf plt2 plt creat2 shock_cba i.status tricus || sts_siteid: || sts_surgid:, or
predict predicted_probability, mu
roctab STSRCHospD predicted_probability


gen age1 = age
replace age1 = 0 if age >= 50
gen age2 = age
replace age2 = 0 if (age < 50) | (age >= 60)
gen age3 = age
replace age3 = 0 if (age < 60) | (age >= 75)
gen age4 = age
replace age4 = 0 if age < 75

gen aortinsuf = 0 if (vdinsufa == 0) | (vdinsufa == 1) | (vdinsufa == 2)
replace aortinsuf = 1 if (vdinsufa == 3)
replace aortinsuf = 2 if (vdinsufa == 4)

gen bmi = weightkg/((heightcm/100)^2)
replace bmi = 18 if (bmi < 18) & (bmi !=.)
replace bmi = 50 if (bmi > 50) & (bmi !=.)
gen bmi2 = bmi*bmi

gen bsaa = bsa
replace bsaa = 1.4 if (bsa < 1.4) & (bsa !=.)
replace bsaa = 2.6 if (bsa > 2.6) & (bsa !=.)
gen bsaa2 = bsaa*bsaa

gen diab = diabetes
replace diab = 2 if diabctrl == 2 | diabctrl == 6 | diabctrl == 7
replace diab = 3 if diabctrl == 3
replace diab = 4 if diabctrl == 4 | diabctrl == 5

gen lvef = hdef
replace lvef = 50 if (hdef>50) & (hdef!=.)

gen chff=chf
replace chff=2 if classnyh==4
tab chff

gen hctt = hct
replace hctt = 25 if (hct < 25) & (hct != .)
replace hctt = 50 if (hct > 50) * (hct != .)
gen hctt2 = hctt*hctt

gen mitinsuf = 0 if (vdinsufm == 0) | (vdinsufm == 1) | (vdinsufm == 2)
replace mitinsuf = 1 if (vdinsufm == 3)
replace mitinsuf = 2 if (vdinsufm == 4)

gen payor_ins= 10 if age < 65
replace payor_ins = 9 if (age < 65) & payorns==1
replace payor_ins = 8 if (age < 65) & ( (payorcom==1 | payorhmo==1))
replace payor_ins = 7 if (age < 65) & (payorgovmcare==1)
replace payor_ins = 6 if (age < 65) & (payorgovmcaid == "1")
replace payor_ins = 5 if (age < 65) & ( (payorgovmcare==1 & payorgovmcaid == "1"))
replace payor_ins = 4 if (age >= 65) 
replace payor_ins = 3 if (age >= 65) & ( (payorcom==1 | payorhmo==1))
replace payor_ins = 2 if (age >= 65) & payorgovmcare==1
replace payor_ins = 1 if (age >= 65) & ( (payorgovmcare==1 & payorgovmcaid == "1"))
tab payor_ins

gen plt = platelets
replace plt = 80000 if platelets < 80000 & platelets !=.
replace plt = 425000 if platelets > 425000 & platelets !=.
sum plt
gen plt2 = plt*plt

gen creat = creatlst
replace creat = 0.5 if (creatlst < 0.5) & (creatlst!=.)
replace creat = 5.0 if (creatlst > 5) & (creatlst!=.)
gen creat1=creat
gen creat2=creat
replace creat1=0 if creat1>1.5
replace creat2=0 if creat2 <= 1.5 

gen shock_cba = 0
replace shock_cba = 1 if (preop_iabp == 1) | (preop_ecmo==1) | (preop_impella==1) | (carshock == "1")
tab shock_cba

gen tricus=0
replace tricus=1 if optricus>0 & optricus != .
tab tricus


///////////Start including other vars
gen predmort_scaled =predmort*100
sum predmort_scaled, detail
encode sts_region, gen(region)

gen adi2018grouping = 0 if adi2018 <5 & adi2018 >=0
replace adi2018grouping = 5 if adi2018 <10 & adi2018 >=5
replace adi2018grouping = 10 if adi2018 <15 & adi2018 >=10
replace adi2018grouping = 15 if adi2018 <20 & adi2018 >=15
replace adi2018grouping = 20 if adi2018 <25 & adi2018 >=20
replace adi2018grouping = 25 if adi2018 <30 & adi2018 >=25
replace adi2018grouping = 30 if adi2018 <35 & adi2018 >=30
replace adi2018grouping = 35 if adi2018 <40 & adi2018 >=35
replace adi2018grouping = 40 if adi2018 <45 & adi2018 >=40
replace adi2018grouping = 45 if adi2018 <50 & adi2018 >=45
replace adi2018grouping = 50 if adi2018 <55 & adi2018 >=50
replace adi2018grouping = 55 if adi2018 <60 & adi2018 >=55
replace adi2018grouping = 60 if adi2018 <65 & adi2018 >=60
replace adi2018grouping = 65 if adi2018 <70 & adi2018 >=65
replace adi2018grouping = 70 if adi2018 <75 & adi2018 >=70
replace adi2018grouping = 75 if adi2018 <80 & adi2018 >=75
replace adi2018grouping = 80 if adi2018 <85 & adi2018 >=80
replace adi2018grouping = 85 if adi2018 <90 & adi2018 >=85
replace adi2018grouping = 90 if adi2018 <95 & adi2018 >=90
replace adi2018grouping = 95 if adi2018 <= 100 & adi2018 >=95

xtile adi2018grouping = adi2018, nq(50)
xtile mortGroup = predmort, nq(50)

logistic STSRCHospD adi2018
fitstat
margins, at(predmort_scaled=(0(0.1)8))
marginsplot

logistic STSRCHospD predmort_scaled
fitstat
margins, at(predmort_scaled=(0(0.1)8))
marginsplot

logistic STSRCHospD adi2018 predmort_scaled
fitstat, saving(mod1)
margins, at(predmort_scaled=(0(0.1)8))
marginsplot
margins, at(adi2018=(0(10)100))
marginsplot

statsby mean=r(mean) ub=r(ub) lb=r(lb) N=r(N), by(mortGroup) clear: ci means STSRCHospD
scatter mean mortGroup, ms(0) mcolor(blue) || rcap ub lb mortGroup, lcolor(blue) 

statsby mean=r(mean) ub=r(ub) lb=r(lb) N=r(N), by(adi2018grou) clear: ci means STSRCHospD
scatter mean adi2018grou, ms(0) mcolor(blue) || rcap ub lb adi2018grou, lcolor(blue) 

melogit STSRCHospD predmort_scaled || sts_surgid:, or
predict predicted_probability, mu
roctab STSRCHospD predicted_probability, graph //ROC 0.871

melogit STSRCHospD predmort_scaled || sts_siteid: || sts_surgid:, or
predict predicted_probability, mu
roctab STSRCHospD predicted_probability, graph //ROC 0.875

melogit STSRCHospD predmort_scaled i.region || sts_siteid: || sts_surgid:, or
predict predicted_probability, mu
roctab STSRCHospD predicted_probability //ROC 0.8684 [0.8613-0.8755]

melogit STSRCHospD predmort_scaled distance || sts_siteid: || sts_surgid:, or
predict predicted_probability, mu
roctab STSRCHospD predicted_probability //ROC 0.883 [0.8748-0.8908]

melogit STSRCHospD predmort_scaled adi2018 || sts_surgid: annualsurgvol_group, intmethod(laplace) trace iterate(100) or difficult
predict predicted_probability, mu
roctab STSRCHospD predicted_probability //ROC 0.883 [0.8748-0.8908]

melogit STSRCHospD predmort_scaled adi2018 || sts_siteid: || sts_surgid:, or
predict predicted_probability, mu
roctab STSRCHospD predicted_probability //ROC 0.883 [0.8748-0.8908]

melogit STSRCHospD predmort_scaled || sts_surgid:, or
melogit STSRCHospD predmort_scaled || sts_siteid: || sts_surgid:, or
melogit STSRCHospD adi2018 predmort_scaled || sts_siteid: || sts_surgid:, or //ROC 0.876
melogit STSRCHospD adi2018 predmort_scaled annualsurgvol || sts_siteid: || sts_surgid:, or //actually makes ROC go down

melogit STSRCHospD adi2018 predmort_scaled annualsurgvol || sts_siteid: || sts_surgid: annualsurgvol, or // makes ROC go down

melogit STSRCHospD adi2018 predmort_scaled || sts_surgid: annualsurgvol_group, or

melogit STSRCHospD predmort_scaled || sts_surgid:, or
predict predicted_probability, mu
roctab STSRCHospD predicted_probability //ROC 0.8706 [0.8637-0.8775]

//now lets add adi

melogit STSRCHospD adi2018 predmort_scaled || sts_surgid:, or
predict predicted_probability, mu
roctab STSRCHospD predicted_probability //ROC 0.8711 [0.8625-0.8796] minimally improves with adi

//add random effect of center

melogit STSRCHospD adi2018 predmort_scaled || sts_siteid: || sts_surgid:, or
predict predicted_probability, mu
roctab STSRCHospD predicted_probability //ROC 0.8760 [0.8676-0.8844] noticable with site by surgeon

melogit STSRCHospD predmort_scaled || sts_siteid: || sts_surgid:, or
predict predicted_probability, mu
roctab STSRCHospD predicted_probability //ROC 0.8747 [0.8678-0.8816] adi helps in this scenario

melogit STSRCHospD adi2018 predmort_scaled i.region || sts_siteid: || sts_surgid:, or
predict predicted_probability, mu //couple regions were sig, some not
roctab STSRCHospD predicted_probability //ROC 0.8722 [0.8637-0.8807]

melogit STSRCHospD adi2018 predmort_scaled distance || sts_siteid: || sts_surgid:, or
predict predicted_probability, mu //distance not sig
roctab STSRCHospD predicted_probability //ROC 0.8761 [0.8677 - 0.8846]

melogit STSRCHospD adi2018 predmort_scaled annualsurgvol || sts_siteid: || sts_surgid:, or
predict predicted_probability, mu //annualsurgvol sig, but ROC drops
roctab STSRCHospD predicted_probability //ROC 0.8608 [0.8512 - 0.8703]

melogit STSRCHospD predmort_scaled annualsurgvol || sts_siteid: || sts_surgid:, or
predict predicted_probability, mu //sig
roctab STSRCHospD predicted_probability //ROC 0.8579 [0.8499 - 0.8660]

melogit STSRCHospD predmort_scaled annualsurgvol_group || sts_siteid: || sts_surgid:, or
predict predicted_probability, mu //sig - limited fixed effect of surgeon if you include mixed effects
roctab STSRCHospD predicted_probability //ROC 0.8527 [0.8445 - 0.8609]

melogit STSRCHospD adi2018 predmort_scaled annualsurgvol_group || sts_siteid: || sts_surgid:, or
predict predicted_probability, mu 
roctab STSRCHospD predicted_probability

melogit STSRCHospD predmort_scaled || sts_siteid: || sts_surgid: annualsurgvol_group, intmethod(laplace) iterate(20) or difficult
predict predicted_probability, mu 
roctab STSRCHospD predicted_probability 

melogit STSRCHospD predmort_scaled adi2018 || sts_siteid: || sts_surgid: annualsurgvol_group, intmethod(laplace) trace iterate(100) or difficult
predict predicted_probability, mu //
roctab STSRCHospD predicted_probability 

melogit STSRCHospD predmort_scaled adi2018 || sts_surgid: annualsurgvol_group, intmethod(laplace) trace iterate(100) or difficult //ROC 0.864 [0.8553-0.8727]


tab annualsurgvol
gen tester=annualsurgvol
replace tester=10 if tester<10
tab tester

preserve

drop if annualsurgvol < 10
melogit mort_30 adi2018 predmort annualsurgvol || sts_surgid: annualsurgvol, or 

melogit mort_30 adi2018 tester annualsurgvol || sts_surgid: annualsurgvol, intmethod(laplace) iterate(20) or difficult 

meqrlogit mort_30 adi2018 tester || sts_surgid: annualsurgvol, intmethod(laplace) trace iterate(100) or difficult

mixlogit mort_30 adi2018 tester annualsurgvol, group rand(annualsurgvol) 

restore

drop annualsurgvol_group

gen annualsurgvol_group = .
replace annualsurgvol_group=1 if annualsurgvol <=5
replace annualsurgvol_group=2 if annualsurgvol > 5 & annualsurgvol <=10
replace annualsurgvol_group=3 if annualsurgvol > 10 & annualsurgvol <=15
replace annualsurgvol_group=4 if annualsurgvol > 15 & annualsurgvol <=20
replace annualsurgvol_group=5 if annualsurgvol > 20 & annualsurgvol <=25
replace annualsurgvol_group=6 if annualsurgvol > 25 & annualsurgvol <=30
replace annualsurgvol_group=7 if annualsurgvol > 30 & annualsurgvol <=35
replace annualsurgvol_group=8 if annualsurgvol > 35 & annualsurgvol <=40
replace annualsurgvol_group=9 if annualsurgvol > 40 & annualsurgvol <=45
replace annualsurgvol_group=10 if annualsurgvol > 45 & annualsurgvol <=50
replace annualsurgvol_group=11 if annualsurgvol > 50 & annualsurgvol <=55
replace annualsurgvol_group=12 if annualsurgvol > 55 & annualsurgvol <=60
replace annualsurgvol_group=13 if annualsurgvol > 60 & annualsurgvol <=65
replace annualsurgvol_group=14 if annualsurgvol > 65 & annualsurgvol <=70
replace annualsurgvol_group=15 if annualsurgvol > 70 & annualsurgvol <=75
replace annualsurgvol_group=16 if annualsurgvol > 75 & annualsurgvol <=80
replace annualsurgvol_group=17 if annualsurgvol > 80 & annualsurgvol <=85
replace annualsurgvol_group=18 if annualsurgvol > 85 & annualsurgvol <=90
replace annualsurgvol_group=19 if annualsurgvol > 90 & annualsurgvol <=95
replace annualsurgvol_group=20 if annualsurgvol > 95 & annualsurgvol <=100
replace annualsurgvol_group=21 if annualsurgvol > 100
tab annualsurgvol_group

melogit STSRCHospD adi2018 predmort_scaled annualsurgvol_group || sts_surgid: annualsurgvol_group, trace iterate(100) or difficult //this works too!!!
margins, at(adi2018=(0(10)100))
marginsplot


/////
mkspline predmortss = predmort, cubic displayknots
mat knots = r(knots)

logistic mort_30 predmortss*

levelsof predmort
xbrcspline predmortss, values(`r(levels)') ref(50) matknots(knots) eform gen(aadi2018 or lb ub)

twoway (line lb ub or aadi2018, lp(- - l) lc(black black black) ) ///
                if inrange(aadi2018,0,100)  , ///
                                scheme(s1mono) legend(off) ///
                                ylabel(0(.25)2, angle(horiz) format(%2.1fc) ) ///
                                xlabel(0(5)100) ///
                                ytitle("Odds ratio of death") ///
                                xtitle("Predicted Mortality Risk")

drop aadi2018 or lb ub predmortss* 

///

rocreg mort_30 adi2018, auc ctrlcov(predmort) ctrlmodel(linear) bootcc nodots 
rocregplot, classvars(adi2018)

rocreg mort_30 predmort, auc bootcc nodots
rocregplot, classvars(predmort) 

///
mkspline adi2018s = adi2018, cubic displayknots
mat knots = r(knots)

logit mort_30 predmort
lroc, nograph
predict xb1, xb

logit mort_30 adi2018s* predmort
lroc, nograph
predict xb2, xb

roccomp mort_30 xb1 xb2, graph summary

drop adi2018s*
drop xb1 xb2

******************************************************************************************************
******************************************************************************************************

//Does ADI affect repair rate?

tab proc_id
tab proc_id adi2018grouping, col chi2 

logistic proc_id adi2018
logistic proc_id adi2015

mkspline adi2018s = adi2018, cubic displayknots
mat knots = r(knots)

logistic proc_id adi2018s* 

levelsof adi2018
xbrcspline adi2018s, values(`r(levels)') ref(50) matknots(knots) eform gen(aadi2018 or lb ub)

twoway (line lb ub or aadi2018, lp(- - l) lc(black black black) ) ///
                if inrange(aadi2018,0,100)  , ///
                                scheme(s1mono) legend(off) ///
                                ylabel(0(.25)2, angle(horiz) format(%2.1fc) ) ///
                                xlabel(0(5)100) ///
                                ytitle("Odds ratio of Replacement") ///
                                xtitle("Area Deprivation Index, 2018")

drop aadi2018 or lb ub adi2018s* 
								
mkspline adi2018s = adi2018, cubic displayknots
mat knots = r(knots)

logistic proc_id adi2018s* age i.dialysis i.chf

levelsof adi2018
xbrcspline adi2018s, values(`r(levels)') ref(50) matknots(knots) eform gen(aadi2018 or lb ub)

twoway (line lb ub or aadi2018, lp(- - l) lc(black black black) ) ///
                if inrange(aadi2018,0,100)  , ///
                                scheme(s1mono) legend(off) ///
                                ylabel(0(.25)2, angle(horiz) format(%2.1fc) ) ///
                                xlabel(0(5)100) ///
                                ytitle("Adjusted Odds ratio of Replacement") ///
                                xtitle("Area Deprivation Index, 2018")

drop aadi2018 or lb ub adi2018s* 

//

logistic proc_id adi2018 //for some reason,predmort and distance break it
logistic proc_id adi2018 annualhospvol
logistic proc_id adi2018 annualhospvol age i.dialysis i.chf
logistic proc_id adi2018 annualhospvol age i.dialysis i.chf annualsurgvol 
stepwise, pr(.01): logistic proc_id adi2018 annualhospvol age dialysis chf annualsurgvol  


melogit proc_id adi2018 annualsurgvol age i.dialysis i.chf|| sts_surgid: , or
melogit proc_id adi2018 annualsurgvol age i.dialysis i.chf|| sts_surgid: annualsurgvol, or

logistic proc_id adi2018
fitstat
lroc

mkspline adi2018s = adi2018, cubic displayknots
mat knots = r(knots)

logistic proc_id adi2018s*

levelsof adi2018
xbrcspline adi2018s, values(`r(levels)') ref(50) matknots(knots) eform gen(aadi2018 or lb ub)

twoway (line lb ub or aadi2018, lp(- - l) lc(black black black) ) ///
                if inrange(aadi2018,0,100)  , ///
                                scheme(s1mono) legend(off) ///
                                ylabel(0(.25)2, angle(horiz) format(%2.1fc) ) ///
                                xlabel(0(5)100) ///
                                ytitle("Odds ratio of Replacement") ///
                                xtitle("Area Deprivation Index")

drop aadi2018 or lb ub adi2018s* 
fitstat
lroc

logistic proc_id adi2018 age1 age2 age3 age4 i.alcohol i.aortinsuf vdstena arrhythmia bmi2 bmi bsaa2 bsaa i.chrlungd cva cvdtia i.diab lvef i.chff hypertn hctt2 hctt immsupp liverdis i.mitinsuf i.payor_ins plt2 plt pvd dialysis creat1 creat2 female shock_cba i.status tricus i.race_cong pocpci i.admitsrc infendo prevmi vdstenm i.mitral_etiology i.tricus_etiol
stepwise, pr(0.05): logistic proc_id adi2018 age1 age2 age3 age4 alcohol aortinsuf vdstena arrhythmia bmi2 bmi bsaa2 bsaa chrlungd cva cvdtia diab lvef chff hypertn hctt2 hctt immsupp liverdis mitinsuf payor_ins plt2 plt pvd dialysis creat1 creat2 female shock_cba status tricus race_cong pocpci admitsrc infendo prevmi vdstenm mitral_etiology tricus_etiol

mfpboot, select(0.05) df(1) clear outfile(mfpboot2) replicates(100) seed(101): logistic proc_id adi2018 age1 age2 age3 age4 alcohol aortinsuf vdstena arrhythmia bmi2 bmi bsaa2 bsaa chrlungd cva cvdtia diab lvef chff hypertn hctt2 hctt immsupp liverdis mitinsuf payor_ins plt2 plt pvd dialysis creat1 creat2 female shock_cba status tricus race_cong pocpci admitsrc infendo prevmi vdstenm mitral_etiology tricus_etiol

logistic proc_id adi2018 i.alcohol i.aortinsuf vdstena arrhythmia shock_cba i.chrlungd cva i.diab lvef i.chff hypertn hctt2 hctt immsupp liverdis i.payor_ins plt2 plt creat2 creat1 female i.status tricus i.race_cong pocpci infendo prevmi vdstenm i.mitral_etiology i.tricus_etiol


melogit proc_id adi2018 i.alcohol i.aortinsuf vdstena arrhythmia shock_cba i.chrlungd cva i.diab lvef i.chff hypertn hctt2 hctt immsupp liverdis i.payor_ins plt2 plt creat2 creat1 female i.status tricus i.race_cong pocpci infendo prevmi vdstenm i.mitral_etiology i.tricus_etiol || sts_surgid:, or
	
predict predicted_probability, mu //
roctab proc_id predicted_probability 

melogit proc_id adi2018 i.alcohol i.aortinsuf vdstena arrhythmia shock_cba i.chrlungd cva i.diab lvef i.chff hypertn hctt2 hctt immsupp liverdis i.payor_ins plt2 plt creat2 creat1 female i.status tricus i.race_cong pocpci infendo prevmi vdstenm i.mitral_etiology i.tricus_etiol || sts_siteid: || sts_surgid:, or
	
predict predicted_probability, mu //
roctab proc_id predicted_probability 

melogit proc_id adi2018 i.alcohol i.aortinsuf vdstena arrhythmia shock_cba i.chrlungd cva i.diab lvef i.chff hypertn hctt2 hctt immsupp liverdis i.payor_ins plt2 plt creat2 creat1 female i.status tricus i.race_cong pocpci infendo prevmi vdstenm i.mitral_etiology i.tricus_etiol || sts_siteid: || sts_surgid:, or
	
predict predicted_probability, mu //
roctab proc_id predicted_probability 

melogit proc_id i.alcohol i.aortinsuf vdstena arrhythmia shock_cba i.chrlungd cva i.diab lvef i.chff hypertn hctt2 hctt immsupp liverdis i.payor_ins plt2 plt creat2 creat1 female i.status tricus i.race_cong pocpci infendo prevmi vdstenm i.mitral_etiology i.tricus_etiol || sts_siteid: || sts_surgid:, or

predict predicted_probability, mu //
roctab proc_id predicted_probability 


//Selection criteria for mitral, the isolated degenerative cohort

keep if infendo == 0
drop if dialysis == 1
keep if mitral_etiology == 1
drop if vdstenm == 1
//degen

logistic proc_id adi2018 age1 age2 age3 age4 i.alcohol i.aortinsuf vdstena arrhythmia bmi2 bmi bsaa2 bsaa i.chrlungd cva cvdtia i.diab lvef i.chff hypertn hctt2 hctt immsupp liverdis i.mitinsuf i.payor_ins plt2 plt pvd dialysis creat1 creat2 female shock_cba i.status tricus i.race_cong pocpci i.admitsrc infendo prevmi vdstenm i.mitral_etiology i.tricus_etiol
logistic proc_id adi2018 age1 age2 age3 age4 i.alcohol i.aortinsuf vdstena arrhythmia bmi2 bmi bsaa2 bsaa i.chrlungd cva cvdtia i.diab lvef i.chff hypertn hctt2 hctt immsupp liverdis i.mitinsuf i.payor_ins plt2 plt pvd creat1 creat2 female shock_cba i.status tricus i.race_cong pocpci i.admitsrc prevmi i.tricus_etiol

stepwise, pr(0.05): logistic proc_id adi2018 age1 age2 age3 age4 alcohol aortinsuf vdstena arrhythmia bmi2 bmi bsaa2 bsaa chrlungd cva cvdtia diab lvef chff hypertn hctt2 hctt immsupp liverdis mitinsuf payor_ins plt2 plt pvd creat1 creat2 female shock_cba status tricus race_cong pocpci admitsrc prevmi tricus_etiol



mfpboot, select(0.05) df(1) clear outfile(mfpboot3) replicates(100) seed(101): logistic proc_id adi2018 age1 age2 age3 age4 alcohol aortinsuf vdstena arrhythmia bmi2 bmi bsaa2 bsaa chrlungd cva cvdtia diab lvef chff hypertn hctt2 hctt immsupp liverdis mitinsuf payor_ins plt2 plt pvd dialysis creat1 creat2 female shock_cba status tricus race_cong pocpci admitsrc infendo prevmi vdstenm mitral_etiology tricus_etiol

mfpboot, select(0.05) df(1) clear outfile(mfpboot3) replicates(100) seed(101): logistic proc_id adi2018 age1 age2 age3 age4 alcohol aortinsuf vdstena arrhythmia bmi2 bmi bsaa2 bsaa chrlungd cva cvdtia diab lvef chff hypertn hctt2 hctt immsupp liverdis mitinsuf payor_ins plt2 plt pvd creat1 creat2 female shock_cba status tricus race_cong pocpci admitsrc prevmi vdstenm tricus_etiol
mfpboot, select(0.05) df(1) clear outfile(mfpboot3) replicates(100) seed(101): logistic proc_id adi2018 age1 age2 age3 age4 alcohol aortinsuf vdstena arrhythmia bmi2 bmi bsaa2 bsaa chrlungd cva cvdtia diab lvef chff hypertn hctt2 hctt immsupp liverdis mitinsuf payor_ins plt2 plt pvd creat1 creat2 female shock_cba status tricus race_cong pocpci admitsrc prevmi vdstenm tricus_etiol

logistic proc_id adi2018 age1 age2 age3 age4 i.alcohol vdstena arrhythmia i.chrlungd cva i.diab i.chff hypertn liverdis i.payor_ins plt2 plt female shock_cba i.status tricus i.race_cong prevmi 

melogit	proc_id adi2018 age1 age2 age3 age4 i.alcohol vdstena arrhythmia i.chrlungd cva i.diab i.chff hypertn liverdis i.payor_ins plt2 plt female shock_cba i.status tricus i.race_cong prevmi || sts_surgid:, or


melogit	proc_id adi2018 age1 age2 age3 age4 i.alcohol vdstena arrhythmia i.chrlungd cva i.diab i.chff hypertn liverdis i.payor_ins plt2 plt female shock_cba i.status tricus i.race_cong prevmi || sts_siteid: || sts_surgid:, or			

						
						
margins, at(adi2018=(0(10)100))
marginsplot
						
predict predicted_probability, mu //
roctab proc_id predicted_probability 


********************************************************************************

//Does race affect mortality?
logistic mort_30 i.race_cong 
logistic mort_disch i.race_cong
logistic mort_30 i.race_cong
logistic mort_disch i.race_cong

tab mort_30 race_cong, col chi2

graph box predmort, over(race_cong) nooutsides

sum predmort if race_cong==1, detail
sum predmort if race_cong==2, detail
sum predmort if race_cong==3, detail
sum predmort if race_cong==4, detail
kwallis predmort, by(race_cong)


**************************************************************************************************************************************
********Start of descriptives
tab adi2018grouping
tab proc_id adi2018grouping, m col chi2
tab datav adi2018grouping, col chi2
codebook sts_siteid sts_hospid sts_surgid 

tab surgyear adi2018grouping, m col chi2
tab qtr_of_year adi2018grouping, m col chi2
tab sts_region adi2018grouping, m col chi2

sum distance if adi2018grouping==1, detail
sum distance if adi2018grouping==2, detail
sum distance if adi2018grouping==3, detail
sum distance if adi2018grouping==4, detail
sum distance if adi2018grouping==5, detail
kwallis distance, by(adi2018grouping)

codebook adi2018
codebook adi2015
codebook adidif

sum annualsurgvol if adi2018grouping==1, detail
sum annualsurgvol if adi2018grouping==2, detail
sum annualsurgvol if adi2018grouping==3, detail
sum annualsurgvol if adi2018grouping==4, detail
sum annualsurgvol if adi2018grouping==5, detail
kwallis annualsurgvol, by(adi2018grouping)

sum annualhospvol if adi2018grouping==1, detail
sum annualhospvol if adi2018grouping==2, detail
sum annualhospvol if adi2018grouping==3, detail
sum annualhospvol if adi2018grouping==4, detail
sum annualhospvol if adi2018grouping==5, detail
kwallis annualsurgvol, by(adi2018grouping)

sum annualsitevol if adi2018grouping==1, detail
sum annualsitevol if adi2018grouping==2, detail
sum annualsitevol if adi2018grouping==3, detail
sum annualsitevol if adi2018grouping==4, detail
sum annualsitevol if adi2018grouping==5, detail
kwallis annualsurgvol, by(adi2018grouping)

tab infendo
tab infendo infendty
tab infendo surgyear, col chi2 //going up each year
tab infendo adi2018grouping, col chi2
graph bar (count), over(infendo) over(surgyear) title("Endocarditis over Time")

tab admitsrc adi2018grouping, col chi2
tab status adi2018grouping, col chi2

sum age if adi2018grouping==1, detail
sum age if adi2018grouping==2, detail
sum age if adi2018grouping==3, detail
sum age if adi2018grouping==4, detail
sum age if adi2018grouping==5, detail
kwallis age, by(adi2018grouping)

tab female adi2018grouping, col chi2
tab race_cong adi2018grouping, col chi2

sum bsa if adi2018grouping==1, detail
sum bsa if adi2018grouping==2, detail
sum bsa if adi2018grouping==3, detail
sum bsa if adi2018grouping==4, detail
sum bsa if adi2018grouping==5, detail
kwallis bsa, by(adi2018grouping)

sum heightcm if adi2018grouping==1, detail
sum heightcm if adi2018grouping==2, detail
sum heightcm if adi2018grouping==3, detail
sum heightcm if adi2018grouping==4, detail
sum heightcm if adi2018grouping==5, detail
kwallis heightcm, by(adi2018grouping)

sum weightkg if adi2018grouping==1, detail
sum weightkg if adi2018grouping==2, detail
sum weightkg if adi2018grouping==3, detail
sum weightkg if adi2018grouping==4, detail
sum weightkg if adi2018grouping==5, detail
kwallis weightkg, by(adi2018grouping)

tab payorgov adi2018grouping, col chi2
tab payorgovmcare adi2018grouping, col chi2
tab payorcom adi2018grouping, col chi2
tab payorns adi2018grouping, col chi2
tab cigsmoker adi2018grouping, col chi2 //going up each year
tab diabetes adi2018grouping, col chi2
tab diabctrl adi2018grouping, col chi2
tab hypertn adi2018grouping, col chi2
tab dyslip adi2018grouping, col chi2
tab dialysis adi2018grouping, col chi2
tab chrlungd adi2018grouping, col chi2
tab alcohol adi2018grouping, col chi2 //going up each year
tab liverdis adi2018grouping, col chi2
tab immsupp adi2018grouping, col chi2
tab pvd adi2018grouping, col chi2
tab cvd adi2018grouping, col chi2
tab cva adi2018grouping, col chi2
tab cvdtia adi2018grouping, col chi2

sum hct if adi2018grouping==1, detail
sum hct if adi2018grouping==2, detail
sum hct if adi2018grouping==3, detail
sum hct if adi2018grouping==4, detail
sum hct if adi2018grouping==5, detail
kwallis hct, by(adi2018grouping)

sum platelets if adi2018grouping==1, detail
sum platelets if adi2018grouping==2, detail
sum platelets if adi2018grouping==3, detail
sum platelets if adi2018grouping==4, detail
sum platelets if adi2018grouping==5, detail
kwallis platelets, by(adi2018grouping)

sum creatlst if adi2018grouping==1, detail
sum creatlst if adi2018grouping==2, detail
sum creatlst if adi2018grouping==3, detail
sum creatlst if adi2018grouping==4, detail
sum creatlst if adi2018grouping==5, detail
kwallis creatlst, by(adi2018grouping)

sum totalbumin, detail

sum totalbumin if adi2018grouping==1, detail
sum totalbumin if adi2018grouping==2, detail
sum totalbumin if adi2018grouping==3, detail
sum totalbumin if adi2018grouping==4, detail
sum totalbumin if adi2018grouping==5, detail
kwallis totalbumin, by(adi2018grouping)

sum totblrbn if adi2018grouping==1, detail
sum totblrbn if adi2018grouping==2, detail
sum totblrbn if adi2018grouping==3, detail
sum totblrbn if adi2018grouping==4, detail
sum totblrbn if adi2018grouping==5, detail
kwallis totblrbn, by(adi2018grouping)

sum a1clvl if adi2018grouping==1, detail
sum a1clvl if adi2018grouping==2, detail
sum a1clvl if adi2018grouping==3, detail
sum a1clvl if adi2018grouping==4, detail
sum a1clvl if adi2018grouping==5, detail
kwallis a1clvl, by(adi2018grouping)

sum inr if adi2018grouping==1, detail
sum inr if adi2018grouping==2, detail
sum inr if adi2018grouping==3, detail
sum inr if adi2018grouping==4, detail
sum inr if adi2018grouping==5, detail
kwallis inr, by(adi2018grouping)

sum meldscr if adi2018grouping==1, detail
sum meldscr if adi2018grouping==2, detail
sum meldscr if adi2018grouping==3, detail
sum meldscr if adi2018grouping==4, detail
sum meldscr if adi2018grouping==5, detail
kwallis meldscr, by(adi2018grouping)

tab prevmi adi2018grouping, col chi2
tab chf adi2018grouping, col chi2
tab classnyh chf
tab arrhythmia adi2018grouping, col chi2
tab afib adi2018grouping, col chi2
tab medinotr adi2018grouping, col chi2

tab prcvint adi2018grouping, col chi2
tab pocpci adi2018grouping, col chi2
tab pocpcist adi2018grouping, col chi2
tab pocpciin adi2018grouping, col chi2

tab carcathper adi2018grouping, col chi2
tab numdisv adi2018grouping, col chi2

sum hdef if adi2018grouping==1, detail
sum hdef if adi2018grouping==2, detail
sum hdef if adi2018grouping==3, detail
sum hdef if adi2018grouping==4, detail
sum hdef if adi2018grouping==5, detail
kwallis hdef, by(adi2018grouping)

tab vdstena adi2018grouping, col chi2
tab vdinsufa adi2018grouping, col chi2
tab vdinsufm adi2018grouping, col chi2
tab vdstenm adi2018grouping, col chi2
tab mitral_etiology adi2018grouping, col chi2

tab vdtr adi2018grouping, col chi2
tab vdinsuft adi2018grouping, col chi2
tab vdstent adi2018grouping, col chi2
tab tricus_etiol adi2018grouping, col chi2

tab opcab adi2018grouping, col chi2
tab vsav adi2018grouping, col chi2
tab vadproc adi2018grouping, col chi2
tab opocard adi2018grouping, col chi2
tab oponcard adi2018grouping, col chi2 
tab aortproc adi2018grouping, col chi2
tab anlrenl adi2018grouping, col chi2
tab afibproc adi2018grouping, col chi2

tab approach adi2018grouping, col chi2
tab robotic adi2018grouping, col chi2
tab cpbutil adi2018grouping, col chi2

sum perfustm if adi2018grouping==1, detail
sum perfustm if adi2018grouping==2, detail
sum perfustm if adi2018grouping==3, detail
sum perfustm if adi2018grouping==4, detail
sum perfustm if adi2018grouping==5, detail
kwallis perfustm, by(adi2018grouping)

tab circarr datav

sum dhcatm if adi2018grouping==1, detail
sum dhcatm if adi2018grouping==2, detail
sum dhcatm if adi2018grouping==3, detail
sum dhcatm if adi2018grouping==4, detail
sum dhcatm if adi2018grouping==5, detail
kwallis dhcatm, by(adi2018grouping)

tab cperfutil adi2018grouping, col chi2
tab aortoccl adi2018grouping, col chi2

sum xclamptm if adi2018grouping==1, detail
sum xclamptm if adi2018grouping==2, detail
sum xclamptm if adi2018grouping==3, detail
sum xclamptm if adi2018grouping==4, detail
sum xclamptm if adi2018grouping==5, detail
kwallis xclamptm, by(adi2018grouping)

sum siduration if adi2018grouping==1, detail
sum siduration if adi2018grouping==2, detail
sum siduration if adi2018grouping==3, detail
sum siduration if adi2018grouping==4, detail
sum siduration if adi2018grouping==5, detail
kwallis siduration, by(adi2018grouping)

tab ibldprod adi2018grouping, col chi2

tab prepmr adi2018grouping, col chi2
tab preptr adi2018grouping, col chi2
tab popttmr adi2018grouping, col chi2
tab poptttr adi2018grouping, col chi2

sum popef if adi2018grouping==1, detail
sum popef if adi2018grouping==2, detail
sum popef if adi2018grouping==3, detail
sum popef if adi2018grouping==4, detail
sum popef if adi2018grouping==5, detail
kwallis popef, by(adi2018grouping)

tab proc_id adi2018grouping, col chi2
tab vsmitrannulo adi2018grouping, col chi2
tab vsmitrleafres adi2018grouping, col chi2
tab vsleafrestyp adi2018grouping, col chi2 //this is subset within all vsmitrleafres
tab vsleafreploc adi2018grouping, col chi2
tab vsmitrslidp adi2018grouping, col chi2
tab vsmitradecalc adi2018grouping, col chi2
tab vsmitrptfe adi2018grouping, col chi2
tab vsmitrchord adi2018grouping, col chi2
tab vsmitrleaferp adi2018grouping, col chi2
tab vsmitredge adi2018grouping, col chi2
tab vsmitrmleafclip adi2018grouping, col chi2
tab vsmitrmitcomm adi2018grouping, col chi2

tab mitralintent proc_id, m
tab mitralintent proc_id, col
tab mitralintent adi2018grouping, col chi2
tab vschorpres proc_id, m

tab optricus adi2018grouping, col chi2
tab tvrep adi2018grouping, col chi2
tab preop_iabp adi2018grouping, col chi2
tab preop_impella adi2018grouping, col chi2
tab preop_ecmo adi2018grouping, col chi2

tab postop_ecmo adi2018grouping, col chi2
tab bldprod adi2018grouping, col chi2
tab bldprod ibldprod
tab extubor adi2018grouping, col chi2
tab reintub adi2018grouping, col chi2

sum venthrstot, detail
sum venthrstot if adi2018grouping==1, detail
sum venthrstot if adi2018grouping==2, detail
sum venthrstot if adi2018grouping==3, detail
sum venthrstot if adi2018grouping==4, detail
sum venthrstot if adi2018grouping==5, detail
kwallis venthrstot, by(adi2018grouping)

sum icuinhr, detail
sum icuinhr if adi2018grouping==1, detail
sum icuinhr if adi2018grouping==2, detail
sum icuinhr if adi2018grouping==3, detail
sum icuinhr if adi2018grouping==4, detail
sum icuinhr if adi2018grouping==5, detail
kwallis icuinhr, by(adi2018grouping)

codebook los
sum los if adi2018grouping==1, detail
sum los if adi2018grouping==2, detail
sum los if adi2018grouping==3, detail
sum los if adi2018grouping==4, detail
sum los if adi2018grouping==5, detail
kwallis los, by(adi2018grouping)

codebook plos
sum plos if adi2018grouping==1, detail
sum plos if adi2018grouping==2, detail
sum plos if adi2018grouping==3, detail
sum plos if adi2018grouping==4, detail
sum plos if adi2018grouping==5, detail
kwallis plos, by(adi2018grouping)

tab complics adi2018grouping, col chi2
tab sursinf adi2018grouping, col chi2
tab csepsis adi2018grouping, col chi2
tab coprebld adi2018grouping, col chi2
tab copreoth adi2018grouping, col chi2
tab coprenon adi2018grouping, col chi2
tab csternal adi2018grouping, col chi2
tab cnstrokp adi2018grouping, col chi2
tab cnstrokttia adi2018grouping, col chi2
tab cppneum adi2018grouping, col chi2
tab cvte adi2018grouping, col chi2
tab pulmemb adi2018grouping, col chi2
tab crenfail adi2018grouping, col chi2
tab crendial adi2018grouping, col chi2
tab cotarrst adi2018grouping, col chi2
tab cotmsf adi2018grouping, col chi2
tab cotafib adi2018grouping, col chi2
tab cotafib afib
tab mort_30 adi2018grouping, col chi2
tab mort_disch adi2018grouping, col chi2
tab mtcause adi2018grouping, col chi2
tab disloctn adi2018grouping, col chi2
tab cardref adi2018grouping, col chi2
tab readm30 adi2018grouping, col chi2
tab readmit adi2018grouping, col chi2

codebook predmort
sum predmort if adi2018grouping==1, detail
sum predmort if adi2018grouping==2, detail
sum predmort if adi2018grouping==3, detail
sum predmort if adi2018grouping==4, detail
sum predmort if adi2018grouping==5, detail
kwallis predmort, by(adi2018grouping)

codebook surgtomort
sum surgtomort if adi2018grouping==1, detail
sum surgtomort if adi2018grouping==2, detail
sum surgtomort if adi2018grouping==3, detail
sum surgtomort if adi2018grouping==4, detail
sum surgtomort if adi2018grouping==5, detail
kwallis surgtomort, by(adi2018grouping)


tab mort_30 adi2018grouping, col chi2

