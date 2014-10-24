package MARC::Lint::CodeData;

use strict;
use warnings; 

#declare the necessary variables
use vars qw($VERSION @EXPORT_OK %GeogAreaCodes %ObsoleteGeogAreaCodes %LanguageCodes %ObsoleteLanguageCodes %CountryCodes %ObsoleteCountryCodes %Sources600_651 %ObsoleteSources600_651 %Sources655 %ObsoleteSources655);

$VERSION = '1.08';

use base qw(Exporter AutoLoader);

@EXPORT_OK = qw(%GeogAreaCodes %ObsoleteGeogAreaCodes %LanguageCodes %ObsoleteLanguageCodes %CountryCodes %ObsoleteCountryCodes %Sources600_651 %ObsoleteSources600_651 %Sources655 %ObsoleteSources655);

=head1 NAME and DESCRIPTION

MARC::Lint::CodeData -- Contains codes from the MARC code lists for Geographic Areas, Languages, and Countries.

Code data is used for validating fields 008, 040, 041, and 043.

Also, sources for subfield 2 in 600-651 and 655.

Stores codes in hashes, %MARC::Lint::CodeData::[name].

Note: According to the official MARC documentation, Sears is not a valid 655
term. The code data below treats it as valid, in anticipation of a change in
the official documentation.

=head1 SYNOPSIS

use MARC::Lint::CodeData;

#Should provide access to the following:
#%MARC::Lint::CodeData::GeogAreaCodes;
#%MARC::Lint::CodeData::ObsoleteGeogAreaCodes;
#%MARC::Lint::CodeData::LanguageCodes;
#%MARC::Lint::CodeData::ObsoleteLanguageCodes;
#%MARC::Lint::CodeData::CountryCodes;
#%MARC::Lint::CodeData::ObsoleteCountryCodes;
#%MARC::Lint::CodeData::Sources600_651;
#%MARC::Lint::CodeData::ObsoleteSources600_651;
#%MARC::Lint::CodeData::Sources655;
#%MARC::Lint::CodeData::ObsoleteSources655;


#or, import specific code list data
use MARC::Lint::CodeData qw(%GeogAreaCodes);

my $gac = "n-us---";
my $validgac = 1 if ($GeogAreaCodes{$gac});
print "Geographic Area Code $gac is valid\n" if $validgac;


=head1 EXPORT

None by default. 
@EXPORT_OK: %GeogAreaCodes, %ObsoleteGeogAreaCodes, %LanguageCodes, %ObsoleteLanguageCodes, %CountryCodes, %ObsoleteCountryCodes, %Sources600_651, %ObsoleteSources600_651, %Sources655, %ObsoleteSources655.

=head1 TO DO

Update codes as needed (see L<http://www.loc.gov/marc/>).

Add other codes for MARC Code Lists for Relators, Sources, Description Conventions.

Determine what to do about 600-655 codes with indicators (cash, lcsh, lcshac,
mesh, nal, and rvm). Currently, these are duplicated in valid and obsolete
hashes. Validation routines should probably treat these differently due to large
numbers of records using these codes, created before the indicators were
allowed.

Determine whether three blank spaces should be in the LanguageCodes (for 008 validation) or not. 
If it is here, then 041 would be allowed to have three blank spaces as a valid code 
(though other checks would report the error--spaces at the beginning and ending of a subfield
and multiple spaces in a field where such a thing is not allowed).

=head2 SEE ALSO

L<MARC::Lint>

L<MARC::Lintadditions> (for check_040, check_041, check_043 using these codes)

L<MARC::Errorchecks> (for 008 validation using these codes)

L<http://www.loc.gov/marc/> for the official code lists.

The following (should be included in the distribution package for this package):
countrycodelistclean.pl
gaccleanupscript.pl
languagecodelistclean.pl
The scripts above take the MARC code list ASCII version as input.
They output tab-separated codes for updating the data below.

=head1 VERSION HISTORY

Version 1.08: Updated May 30, 2006.

 -Added new source codes from Technical Notice of May 26, 2006.

Version 1.07: Updated Mar. 13, 2006.

 -Added new source codes from Technical Notice of Mar. 10, 2006.

Version 1.06: Updated Feb. 23, 2006.

 -Added new language codes from Technical Notice of Feb 23, 2006.
 -Alphabetized language codes.

Version 1.05: Updated Jan. 11, 2006.

 -Added new sources codes from Technical Notice of Jan. 10, 2006.

Version 1.04: Updated Oct. 13, 2005.

 -Added new sources codes from Technical Notice of Oct. 12, 2005.

Version 1.03: Updated Aug. 31, 2005.

 -Added new language codes for Ainu and Southern Altai (August 30, 2005 technical notice)

Version 1.02: Updated June 21-July 12, 2005. Released (to CPAN) with new version of MARC::Errorchecks.

 -Added GAC and Country code changes for Australia (July 12, 2005 update)
 -Added 6xx subfield 2 source code data for June 17, 2005 update.
 -Updated valid Language codes to June 2, 2005 changes.

Version 1.01: Updated Jan. 5-Feb. 10, 2005. Released (to CPAN) Feb. 13, 2005 (with new version of MARC::Errorchecks).

 -Added code list data for 600-651 subfield 2 and for 655 subfield 2 sources.
 -Updated codes based on changes made Jan. 19 (languages), Feb. 2 (sources), Feb. 9 (sources). 
 
Version 1.00 (original version): First release, Dec. 5, 2004. Uploaded to SourceForge CVS, Jan. 3, 2005.
 -Included in MARC::Errorchecks distribution on CPAN.
 -Used by MARC::Lintadditions.

=cut

#fill the valid Geographic Area Codes hash

%GeogAreaCodes = map {($_, 1)} (split "\t", ("a-af---	f------	fc-----	fe-----	fq-----	ff-----	fh-----	fs-----	fb-----	fw-----	n-us-al	n-us-ak	e-aa---	n-cn-ab	f-ae---	ea-----	sa-----	poas---	aa-----	sn-----	e-an---	f-ao---	nwxa---	a-cc-an	t------	nwaq---	nwla---	n-usa--	ma-----	ar-----	au-----	r------	s-ag---	n-us-az	n-us-ar	a-ai---	nwaw---	lsai---	u-ac---	a------	ac-----	as-----	l------	fa-----	u------	u-at---	u-at-ac	e-au---	a-aj---	lnaz---	nwbf---	a-ba---	ed-----	eb-----	a-bg---	nwbb---	a-cc-pe	e-bw---	e-be---	ncbh---	el-----	ab-----	f-dm---	lnbm---	a-bt---	mb-----	a-ccp--	s-bo---	nwbn---	a-bn---	e-bn---	f-bs---	lsbv---	s-bl---	n-cn-bc	i-bi---	nwvb---	a-bx---	e-bu---	f-uv---	a-br---	f-bd---	n-us-ca	a-cb---	f-cm---	n-cn---	nccz---	lnca---	lncv---	cc-----	poci---	ak-----	e-urk--	e-urr--	nwcj---	f-cx---	nc-----	e-urc--	f-cd---	s-cl---	a-cc---	a-cc-cq	i-xa---	i-xb---	q------	s-ck---	n-us-co	b------	i-cq---	f-cf---	f-cg---	fg-----	n-us-ct	pocw---	u-cs---	nccr---	e-ci---	nwcu---	nwco---	a-cy---	e-xr---	e-cs---	f-iv---	eo-----	zd-----	n-us-de	e-dk---	dd-----	d------	f-ft---	nwdq---	nwdr---	x------	n-usr--	ae-----	an-----	a-em---	poea---	xa-----	s-ec---	f-ua---	nces---	e-uk-en	f-eg---	f-ea---	e-er---	f-et---	me-----	e------	ec-----	ee-----	en-----	es-----	ew-----	lsfk---	lnfa---	pofj---	e-fi---	n-us-fl	e-fr---	h------	s-fg---	pofp---	a-cc-fu	f-go---	pogg---	f-gm---	a-cc-ka	awgz---	n-us-ga	a-gs---	e-gx---	e-ge---	e-gw---	f-gh---	e-gi---	e-uk---	e-uk-ui	nl-----	np-----	fr-----	e-gr---	n-gl---	nwgd---	nwgp---	pogu---	a-cc-kn	a-cc-kc	ncgt---	f-gv---	f-pg---	a-cc-kw	s-gy---	a-cc-ha	nwht---	n-us-hi	i-hm---	a-cc-hp	a-cc-he	a-cc-ho	ah-----	nwhi---	ncho---	a-cc-hk	a-cc-hh	n-cnh--	a-cc-hu	e-hu---	e-ic---	n-us-id	n-us-il	a-ii---	i------	n-us-in	ai-----	a-io---	a-cc-im	m------	c------	n-us-ia	a-ir---	a-iq---	e-ie---	a-is---	e-it---	nwjm---	lnjn---	a-ja---	a-cc-ku	a-cc-ki	a-cc-kr	poji---	a-jo---	zju----	n-us-ks	a-kz---	n-us-ky	f-ke---	poki---	pokb---	a-kr---	a-kn---	a-ko---	a-cck--	a-ku---	a-kg---	a-ls---	cl-----	e-lv---	a-le---	nwli---	f-lo---	a-cc-lp	f-lb---	f-ly---	e-lh---	poln---	e-li---	n-us-la	e-lu---	a-cc-mh	e-xn---	f-mg---	lnma---	n-us-me	f-mw---	am-----	a-my---	i-xc---	f-ml---	e-mm---	n-cn-mb	poxd---	n-cnm--	zma----	poxe---	nwmq---	n-us-md	n-us-ma	f-mu---	i-mf---	i-my---	mm-----	ag-----	pome---	zme----	n-mx---	nm-----	n-us-mi	pott---	pomi---	n-usl--	aw-----	n-usc--	poxf---	n-us-mn	n-us-ms	n-usm--	n-us-mo	n-uss--	e-mv---	e-mc---	a-mp---	n-us-mt	nwmj---	zmo----	f-mr---	f-mz---	f-sx---	ponu---	n-us-nb	a-np---	zne----	e-ne---	nwna---	n-us-nv	n-cn-nk	ponl---	n-usn--	a-nw---	n-us-nh	n-us-nj	n-us-nm	u-at-ne	n-us-ny	u-nz---	n-cn-nf	ncnq---	f-ng---	fi-----	f-nr---	fl-----	a-cc-nn	poxh---	n------	ln-----	n-us-nc	n-us-nd	pn-----	n-use--	xb-----	e-uk-ni	u-at-no	n-cn-nt	e-no---	n-cn-ns	n-cn-nu	po-----	n-us-oh	n-uso--	n-us-ok	a-mk---	n-cn-on	n-us-or	zo-----	p------	a-pk---	popl---	ncpn---	a-pp---	aopf---	s-py---	n-us-pa	ap-----	s-pe---	a-ph---	popc---	zpl----	e-pl---	pops---	e-po---	n-cnp--	n-cn-pi	nwpr---	ep-----	a-qa---	a-cc-ts	u-at-qn	n-cn-qu	mr-----	er-----	n-us-ri	sp-----	nr-----	e-rm---	e-ru---	e-ur---	e-urf--	f-rw---	i-re---	nwsd---	fd-----	nweu---	lsxj---	nwxi---	nwxk---	nwst---	n-xl---	nwxm---	pows---	posh---	e-sm---	f-sf---	n-cn-sn	zsa----	a-su---	ev-----	e-uk-st	f-sg---	i-se---	a-cc-ss	a-cc-sp	a-cc-sm	a-cc-sh	e-urs--	e-ure--	e-urw--	a-cc-sz	f-sl---	a-si---	e-xo---	e-xv---	i-xo---	zs-----	pobp---	f-so---	f-sa---	s------	az-----	ls-----	u-at-sa	n-us-sc	ao-----	n-us-sd	lsxs---	ps-----	xc-----	n-usu--	n-ust--	e-urn--	e-sp---	f-sh---	aoxp---	a-ce---	f-sj---	fn-----	fu-----	zsu----	s-sr---	lnsb---	nwsv---	f-sq---	e-sw---	e-sz---	a-sy---	a-ch---	a-ta---	f-tz---	u-at-tm	n-us-tn	i-fs---	n-us-tx	a-th---	af-----	a-cc-tn	a-cc-ti	at-----	f-tg---	potl---	poto---	nwtr---	lstd---	w------	f-ti---	a-tu---	a-tk---	nwtc---	potv---	f-ug---	e-un---	a-ts---	n-us---	nwuc---	poup---	e-uru--	zur----	s-uy---	n-us-ut	a-uz---	ponn---	e-vc---	s-ve---	zve----	n-us-vt	u-at-vi	a-vt---	nwvi---	n-us-va	e-urp--	fv-----	powk---	e-uk-wl	powf---	n-us-dc	n-us-wa	n-usp--	awba---	nw-----	n-us-wv	u-at-we	xd-----	f-ss---	nwwi---	n-us-wi	n-us-wy	a-ccs--	a-cc-su	a-ccg--	a-ccy--	ay-----	a-ye---	e-yu---	n-cn-yk	a-cc-yu	fz-----	f-za---	a-cc-ch	f-rh---	u-atc--	u-ate--	u-atn--"));

#fill the obsolete Geographic Area Codes hash

%ObsoleteGeogAreaCodes = map {($_, 1)} (split "\t", ("t-ay---	e-ur-ai	e-ur-aj	nwbc---	e-ur-bw	f-by---	pocp---	e-url--	cr-----	v------	e-ur-er	et-----	e-ur-gs	pogn---	nwga---	nwgs---	a-hk---	ei-----	f-if---	awiy---	awiw---	awiu---	e-ur-kz	e-ur-kg	e-ur-lv	e-ur-li	a-mh---	cm-----	e-ur-mv	n-usw--	a-ok---	a-pt---	e-ur-ru	pory---	nwsb---	posc---	a-sk---	posn---	e-uro--	e-ur-ta	e-ur-tk	e-ur-un	e-ur-uz	a-vn---	a-vs---	nwvr---	e-urv--	a-ys---"));

#fill the valid Language Codes hash

%LanguageCodes = map {($_, 1)} (split "\t", ("   	aar	abk	ace	ach	ada	ady	afa	afh	afr	ain	aka	akk	alb	ale	alg	alt	amh	ang	anp	apa	ara	arc	arg	arm	arn	arp	art	arw	asm	ast	ath	aus	ava	ave	awa	aym	aze	bad	bai	bak	bal	bam	ban	baq	bas	bat	bej	bel	bem	ben	ber	bho	bih	bik	bin	bis	bla	bnt	bos	bra	bre	btk	bua	bug	bul	bur	byn	cad	cai	car	cat	cau	ceb	cel	cha	chb	che	chg	chi	chk	chm	chn	cho	chp	chr	chu	chv	chy	cmc	cop	cor	cos	cpe	cpf	cpp	cre	crh	crp	csb	cus	cze	dak	dan	dar	day	del	den	dgr	din	div	doi	dra	dsb	dua	dum	dut	dyu	dzo	efi	egy	eka	elx	eng	enm	epo	est	ewe	ewo	fan	fao	fat	fij	fil	fin	fiu	fon	fre	frm	fro	frr	frs	fry	ful	fur	gaa	gay	gba	gem	geo	ger	gez	gil	gla	gle	glg	glv	gmh	goh	gon	gor	got	grb	grc	gre	grn	gsw	guj	gwi	hai	hat	hau	haw	heb	her	hil	him	hin	hit	hmn	hmo	hsb	hun	hup	iba	ibo	ice	ido	iii	ijo	iku	ile	ilo	ina	inc	ind	ine	inh	ipk	ira	iro	ita	jav	jbo	jpn	jpr	jrb	kaa	kab	kac	kal	kam	kan	kar	kas	kau	kaw	kaz	kbd	kha	khi	khm	kho	kik	kin	kir	kmb	kok	kom	kon	kor	kos	kpe	krc	krl	kro	kru	kua	kum	kur	kut	lad	lah	lam	lao	lat	lav	lez	lim	lin	lit	lol	loz	ltz	lua	lub	lug	lui	lun	luo	lus	mac	mad	mag	mah	mai	mak	mal	man	mao	map	mar	mas	may	mdf	mdr	men	mga	mic	min	mis	mkh	mlg	mlt	mnc	mni	mno	moh	mol	mon	mos	mul	mun	mus	mwl	mwr	myn	myv	nah	nai	nap	nau	nav	nbl	nde	ndo	nds	nep	new	nia	nic	niu	nno	nob	nog	non	nor	nso	nub	nwc	nya	nym	nyn	nyo	nzi	oci	oji	ori	orm	osa	oss	ota	oto	paa	pag	pal	pam	pan	pap	pau	peo	per	phi	phn	pli	pol	pon	por	pra	pro	pus	que	raj	rap	rar	roa	roh	rom	rum	run	rus	sad	sag	sah	sai	sal	sam	san	sas	sat	scc	scn	sco	scr	sel	sem	sga	sgn	shn	sid	sin	sio	sit	sla	slo	slv	sma	sme	smi	smj	smn	smo	sms	sna	snd	snk	sog	som	son	sot	spa	srd	srn	srr	ssa	ssw	suk	sun	sus	sux	swa	swe	syr	tah	tai	tam	tat	tel	tem	ter	tet	tgk	tgl	tha	tib	tig	tir	tiv	tkl	tlh	tli	tmh	tog	ton	tpi	tsi	tsn	tso	tuk	tum	tup	tur	tut	tvl	twi	tyv	udm	uga	uig	ukr	umb	und	urd	uzb	vai	ven	vie	vol	vot	wak	wal	war	was	wel	wen	wln	wol	xal	xho	yao	yap	yid	yor	ypk	zap	zen	zha	znd	zul	zun	zxx"));

#fill the obsolete Language Codes hash

%ObsoleteLanguageCodes = map {($_, 1)} (split "\t", ("ajm	esk	esp	eth	far	fri	gag	gua	int	iri	cam	kus	mla	max	lan	gal	lap	sao	gae	sho	snh	sso	swz	tag	taj	tar	tru	tsw"));

#fill the valid Country Codes hash

%CountryCodes = map {($_, 1)} (split "\t", ("aca	af 	alu	aku	aa 	abc	ae 	as 	an 	ao 	am 	ay 	aq 	ag 	azu	aru	ai 	aw 	at 	au 	aj 	bf 	ba 	bg 	bb 	bw 	be 	bh 	dm 	bm 	bt 	bo 	bn 	bs 	bv 	bl 	bcc	bi 	vb 	bx 	bu 	uv 	br 	bd 	cau	cb 	cm 	xxc	cv 	cj 	cx 	cd 	cl 	cc 	ch 	xa 	xb 	ck 	cou	cq 	cf 	cg 	ctu	cw 	cr 	ci 	cu 	cy 	xr 	iv 	deu	dk 	dcu	ft 	dq 	dr 	em 	ec 	ua 	es 	enk	eg 	ea 	er 	et 	fk 	fa 	fj 	fi 	flu	fr 	fg 	fp 	go 	gm 	gz 	gau	gs 	gw 	gh 	gi 	gr 	gl 	gd 	gp 	gu 	gt 	gv 	pg 	gy 	ht 	hiu	hm 	ho 	hu 	ic 	idu	ilu	ii 	inu	io 	iau	ir 	iq 	iy 	ie 	is 	it 	jm 	ja 	ji 	jo 	ksu	kz 	kyu	ke 	gb 	kn 	ko 	ku 	kg 	ls 	lv 	le 	lo 	lb 	ly 	lh 	li 	lau	lu 	xn 	mg 	meu	mw 	my 	xc 	ml 	mm 	mbc	xe 	mq 	mdu	mau	mu 	mf 	ot 	mx 	miu	fm 	xf 	mnu	msu	mou	mv 	mc 	mp 	mtu	mj 	mr 	mz 	sx 	nu 	nbu	np 	ne 	na 	nvu	nkc	nl 	nhu	nju	nmu	nyu	nz 	nfc	nq 	ng 	nr 	xh 	xx 	nx 	ncu	ndu	nik	nw 	ntc	no 	nsc	nuc	ohu	oku	mk 	onc	oru	pk 	pw 	pn 	pp 	pf 	py 	pau	pe 	ph 	pc 	pl 	po 	pic	pr 	qa 	qea	quc	riu	rm 	ru 	rw 	re 	xj 	xd 	xk 	xl 	xm 	ws 	sm 	sf 	snc	su 	stk	sg 	yu 	se 	sl 	si 	xo 	xv 	bp 	so 	sa 	scu	sdu	xs 	sp 	sh 	xp 	ce 	sj 	sr 	sq 	sw 	sz 	sy 	ta 	tz 	tnu	fs 	txu	th 	tg 	tl 	tma	to 	tr 	ti 	tu 	tk 	tc 	tv 	ug 	un 	ts 	xxk	uik	xxu	uc 	up 	uy 	utu	uz 	nn 	vp 	vc 	ve 	vtu	vm 	vi 	vau	vra	wea	wk 	wlk	wf 	wau	wj 	wvu	ss 	wiu	wyu	xga	xna	xoa	xra	ye 	ykc	za 	rh "));

#fill the obsolete Country Codes hash

%ObsoleteCountryCodes = map {($_, 1)} (split "\t", ("ai 	air	ac 	ajr	bwr	cn 	cz 	cp 	ln 	cs 	err	gsr	ge 	gn 	hk 	iw 	iu 	jn 	kzr	kgr	lvr	lir	mh 	mvr	nm 	pt 	rur	ry 	xi 	sk 	xxr	sb 	sv 	tar	tt 	tkr	unr	uk 	ui 	us 	uzr	vn 	vs 	wb 	ys "));

%Sources600_651 = map {($_, 1)} (split "\t", ("aass	aat	abne	agrifors	agrovoc	agrovocf	agrovocs	albt	allars	amg	apaist	asft	asth	atla	barn	bella	bet	bhammf	bhashe	bicssc	bidex	blmlsh	bt	cabt	cash	cct	ccte	cctf	ceeus	cht	ciesiniv	cilla	csahssa	csalsct	csapa	csh	cstud	dacs	dcs	ddcrit	dissao	dit	drama	dtict	ebfem	eclas	eks	ericd	est	fast	fgtpcm	fire	fmesh	fnhl	francis	galestne	gem	georeft	gtt	hapi	hkcan	helecon	henn	hlasstg	huc	iaat	ica	icpsr	idas	iescs	iest	ilot	ilpt	inist	inspect	ipat	ipsp	isis	itoamc	itrt	jhpb	jhpk	jlabsh	kaa	kao	kaunokki	kdm	kitu	kssbar	kta	ktpt	ktta	kula	kupu	lacnaf	larpcal	lcsh	lcshac	lctgm	lemac	lemb	liv	lnmmbr	local	ltcsh	lua	maaq	mar	masa	mesh	mipfesd	mmm	mpirdes	mtirdes	musa	nal	nalnaf	nasat	ncjt	ndllsh	nicem	nimacsc	nlmnaf	ntcpsc	ntcsd	ntissc	nznb	ogst	opms	pascal	peri	pha	pmbok	pmcsg	poliscit	popinte	precis	prvt	psychit	qrma	qrmak	raam	ram	rasuqam	renib	reo	rero	rerovoc	reveal	rma	rpe	rswk	rugeo	rurkp	rvm	sao	sbiao	scgdst	scisshl	scot	sears	sfit	sgc	sgce	shbe	she	sigle	sipri	sk	slem	smda	sosa	swd	swemesh	taika	taxhs	tbit	test	tgn	thub	tlka	tlsh	toit	trt	trtsa	tsht	ttka	ulan	umitrist	unbisn	unbist	unescot	usaidt	vmj	waqaf	watrest	wgst	wot	wpicsh	ysa"));

#The codes cash, lcsh, lcshac, mesh, nal, and rvm are covered by 2nd indicators in 600-655
#they are only used when indicators are not available
%ObsoleteSources600_651 = map {($_, 1)} (split "\t", ("cash	lcsh	lcshac	mesh	nal	reroa	rvm"));

%Sources655 = map {($_, 1)} (split "\t", ("	aat	amg	asth	barn	bt	cash	cct	dacs	dcs	dct	ericd	estc	fast	fbg	fire	galestne	gem	gmgpc	gsafd	gtlm	hapi	hkcan	ica	ilot	itrt	jhpb	jhpk	lacnaf	lcsh	lcshac	lctgm	lemac	local	maaq	mar	marcgt	mesh	migfg	mim	nal	nalnaf	ngl	nimafc	nlmnaf	nmc	nznb	opms	pmcsg	qrmak	raam	radfg	rbbin	rbgenr	rbpap	rbpri	rbprov	rbpub	rbtyp	reo	rerovoc	reveal	rma	rugeo	rvm	sao	sears	sgc	sgce	sgp	sipri	swemesh	tbit	thub	toit	tsht	ulan	vmj	waqaf"));

#The codes cash, lcsh, lcshac, mesh, nal, and rvm are covered by 2nd indicators in 600-655
#they are only used when indicators are not available
%ObsoleteSources655 = map {($_, 1)} (split "\t", ("cash	ftamc	lcsh	lcshac	mesh	nal	reroa	rvm"));

1;

=head1 LICENSE

This code may be distributed under the same terms as Perl itself. 

Please note that this module is not a product of or supported by the 
employers of the various contributors to the code.

=head1 AUTHOR

Bryan Baldus
eijabb@cpan.org

Copyright (c) 2004-2006.

=cut

__END__