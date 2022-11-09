# Tags:
# food = fast food; restaurants; door dash; grub hub
# gas = gas stations
# retail = walmart, sams, macy's, etc ... any type of brick and mortar store
# grocery = brick and mortar grocery store, sams, food lion
# delivery = online merchandise
# service = online service, consumer reports
# utility = natural gas, electricity, phone, internet
# membership = AAA
# tools = harbor freight, lowes hardware, auto parts, etc
# payment = payment
# travel = airfare
# medical = dentist, doctor, pharmacy
# school = ECU, NC STATE, UNC
# fee = dmv, tags
# tax = property tax
# home = home maintenance
# donation = giving money away

# misc = non categorized



s/"& /"/g
s/://g
s/"4464 Dominos Pizza.*"/"dominos pizza:food"/g
s/"AAA .*"/"aaa:membership"/g
s/"ALDI .*"/"aldi:shop"/g
s/"Amazon.com.*"/"amazon.com:delivery"/g
s/"Amazon Music.*"/"amazon music:service"/g
s/"Amazon ?Prime.*"/"amazon.com:delivery"/g
s/"Amazon Digital.*"/"amazon digital:service"/g
s/"AMZN Digital.*"/"amazon digital:service"/g
s/"Amazon Kindle.*"/"amazon kindle:service"/g
s/"Amazon Services-Kindle.*"/"amazon kindle:service"/g
s/"AMAZON MKTPLACE PMTS.*"/"amazon payment:payment"/g
s/"(Amazon Video|Prime Video).*"/"amazon video:service"/g
s/"AMERICAN AI.*"/"american airlines:travel"/g
s/"AMZN Mktp.*"/"amazon.com:delivery"/g
s/"AMZN Pickup.*"/"amazon.com:delivery"/g
s/"(APL\*|APPLE\.COM).*"/"apple online:service"/g
s/"(ATT|AT&T).*"/"at&t:utility"/g
s/"AUNTIE ANNE.*"/"auntie ann:food"/g
s/"Audible.*"/"audible:service"/g
s/"BP#.*"/"bp:gas"/g
s/"BARNES & NOBLE.*"/"barns noble:retail"/g
s/"AUTOZONE.*"/"autozone:tools"/g
s/"BEST BUY.*"/"best buy:retail"/g
s/"(BRUEGGERS|SQ *BRUEGGER'S BAGELS).*"/"breuggers:food"/g
s/"BOJANGLES.*"/"bojangles:food"/g
s/"CHICK\-FIL\-A.*"/"chick-fil-a:food"/g
s/"(CHINA ?TOWN|FOOD AT CHINA EXPRESS|BM CHINATOWN EXPRESS).*"/"chinatown express:food"/g
s/"CIRCLE K.*"/"circle k:gas"/g
s/"(CINEMARK|CNK\*CINEMARK\.COM).*"/"cinemark:retail"/g
s/"CITY OF RALEIGH.*"/"raliegh water sewer:utility"/g
s/"(CONSUMERREPORTS|CONSUMERRPRTS|CR \*CONSUM|CR DIGITAL M).*"/"consumer reports:service"/g
s/"COOK OUT.*"/"cook out:food"/g
s/"CVS\/PHARMACY.*"/"cvs pharmach:medical"/g
s/"DD DOORDASH.*"/"doordash:food"/g
s/"(Daylight Donuts|DAYLIGHT DONUTS).*"/"dunkin donuts:food"/g
s/"DENTAL ARTS.*"/"dental arts:medical"/g
s/"DELTA DENTAL.*"/"delta dental:medical"/g
s/"(DOLLAR TREE|DOLRTREE).*"/"dollar tree:retail"/g
s/"(Dominos Pizza|DOMINO'S).*"/"dominos pizza:food"/g
s/"(DUKE ASC|DUKE HEALTH|DUKE ORTHO|DUKE PKG|DUKE PTOT|UNCHC MYCHART).*"/"duke health:medical"/g
s/"DUNKIN.*"/"dunkin donuts:food"/g
s/"ECU (ORIENT|CAMPUS|STUDENT).*"/"ecu:school"/g
s/"(TN EAST CAROLINA|V EAST CAROLINA).*"/"ecu:school"/g
s/"EL RODEO.*"/"el rodeo:food"/g
s/"ENTERPRISE RENT.*"/"enterprise rent a car:travel"/g
s/"EXXONMOBIL.*"/"exxon mobile:gas"/g
s/"FEDEX .*"/"fedex:misc"/g
s/"FOOD LION.*"/"food lion:grocery"/g
s/"FRESH (CREAM|EATS|LOCAL).*"/"fresh ice cream:food"/g
s/"GOLDEN CORRAL.*"/"golden corral:food"/g
s/"GOOGLE.*"/"google pay:payment"/g
s/"GRUBHUB.*"/"grub hub:food"/g
s/"GUGHLHUPF.*"/"gughlhupf:food"/g
s/"HARBOR FREIGHT.*"/"harbor freight:tool"/g
s/"HARRIS TEETER.*"/"harris teeter:grocery"/g
s/"HERTZ RENT.*"/"hertz rent a car:travel"/g
s/"Holly Park Pharmacy.*"/"holly park pharmacy:medical"/g
s/"HOME ?DEPOT.*"/"home depot:tools"/g
s/"HLU\*Hulu.*"/"hulu online:service"/g
s/"HWY 55 .*"/"hwy 55:food"/g
s/"(IBMBLDG500|IBM BUILDING 500).*"/"ibm bldg 500:food"/g
s/"IMPERIAL CENTER.*"/"imperial center:medical"/g
s/"JIMMY JOHNS.*"/"jimmy johns:food"/g
s/"Kindle .*"/"amazon kindle:service"/g
s/"(LABCORP|LCA\*LABCORP).*"/"lab corp:medical"/g
s/"LASTPASS.*"/"lastpass:service"/g
s/"LOVES .*"/"loves gas:gas"/g
s/"LOWES .*"/"lowes hardware:tools"/g
s/"(MACYS|MACY'S).*"/"macy's:retail"/g
s/"MCDONALD'S.*"/"mcdonalds:food"/g
s/"MYEYEDR.*"/"my eye doctor:medical"/g
s/"MYFITNESSPAL.*"/"my fitness pal:service"/g
s/"NCDMV.*"/"nc dmv:fee"/g
s/"NC QUICK PASS.*"/"nc quick pass:travel"/g
s/"(NCSU|NC STATE).*"/"nc state:school"/g
s/"NEO-ASIA.*"/"neo asia:food"/g
s/"(NETFLIX|Netflix)\.com.*"/"netflix:service"/g
s/"OLIVE GARD.*"/"olive garden:food"/g
s/"OMALLEYS.*"/"omalleys:food"/g
s/"PACIFIC BEACHWEAR.*"/"pacific beachwear:retail"/g
s/"PANDORA\*INTERNET.*"/"pandora radio:service"/g
s/"PANERA BREAD.*"/"panera bread:food"/g
s/"PAPA JOHN.*"/"papa johns:food"/g
s/"PF CHANG.*"/"pf chang:food"/g
s/"RALEIGH ALE HOUSE.*"/"ale house:food"/g
s/"RALEIGH DENTAL ARTS.*"/"dental arts:medical"/g
s/"RALEIGH FAMILY PRACTICE.*"/"raleigh family practice:medical"/g
s/"RALEIGH ORTHO.*"/"raleigh orthopedic:medical"/g
s/"(RUDAA PUBLIC|RDU AIRPORT).*"/"rdu airport parking:travel"/g
s/"RED LOBSTER.*"/"red lobster:food"/g
s/"(Returned Payment|RETURN PMT FEE).*"/"returned payments:fee"/g
s/"ROTO-ROOTER.*"/"roto rooter:home"/g
s/"SALSA FRESH.*"/"salsa fresh:food"/g
s/"(SAMSCLUB|SAMS CLUB).*"/"sams club:grocery"/g
s/"SEARS.*"/"sears:retail"/g
s/"SHEETZ.*"/"sheets:gas"/g
s/"SHELL OIL.*"/"shell oil:gas"/g
s/"SMOOTHIE KING.*"/"smootie king:food"/g
s/"SOFTPLAN SYS.*"/"softplan:service"/g
s/"SONIC DRIVE.*"/"sonic drive in:food"/g
s/"SOUTHWES .*"/"southwest air:travel"/g
s/"(SPEEDPAY|SPI\*DUKE).*"/"duke energy:utility"/g
s/"STARBUCKS.*"/"starbucks:food"/g
s/"STEAK ESCAPE.*"/"steak escape:food"/g
s/"STEAK N SHAKE.*"/"steak n shake:food"/g
s/"TARGET .*"/"target:retail"/g
s/"TACO BELL.*"/"taco bell:food"/g
s/"THAI HOUSE.*"/"thai house:food"/g
s/"THE HOME DEPOT.*"/"home depot:tools"/g
s/"(TMOBILE\*WALMART|TMO\*WALMART|WAL\*?MART FAMILY MOBILE).*"/"walmart family mobile:utility"/g
s/"TOTAL WINE.*"/"total wine:retail"/g
s/"(TRACKWRESTLING|WRESTLEREG\.COM|AAU MEMBERSHIPS).*"/"track wrestling:service"/g
s/"TRIANGLE (DENTAL|IMPLANT).*"/"triangle dental:medical"/g
s/"UBER EATS.*"/"uber eats:food"/g
s/"UBER\*? (\*TRIP|TRIP|TECH).*"/"uber rides:travel"/g
s/"UberBV.*"/"uber rides:travel"/g
s/"U.HAUL.*"/"u-haul:home"/g
s/"USPS.*"/"us post office:misc"/g
s/"WAKE.?TECH.*"/"wake tech:school"/g
s/"WALGREENS.*"/"walgreens:retail"/g
s/"(WAL-MART #|WALMART\.COM|WM SUPERCENTER).*"/"wal-mart:retail"/g
s/"WEIGHTWATCHERS.*"/"weight watchers:service"/g
s/"WENDYS .*"/"wendys:food"/g

s/"54TH STREET.*"/"54th street:food"/g
s/"ADVANCE AUTO.*"/"advance auto:tools"/g
s/"ADY\*Jetbrains.*"/"jetbrains:service"/g
s/"AIRBNB.*"/"airbnb:travel"/g
s/"AJISAI.*"/"ajisai:food"/g
s/"Angie's List.*"/"angie's list:service"/g
s/"AMZ\*Wikimedia.*"/"wikipedia:donation"/g
s/"AMZ*034Motorsport.*"/"motorsport store:toools"/g
s/"ANIME PARA.*"/"anime paradaisu:retail"/g
s/"ANKIAPP.*"/"anki app:service"/g
s/"BADD KITTY.*"/"badd kitty:retail"/g
s/"BAGEL FACTORY.*"/"bagel factory:food"/g
s/"BARBOUR ENTERPR.*"/"barbour enterprise:misc"/g
s/"BASIL THAI.*"/"basil thai:food"/g
s/"BB \*SAFE HAVEN.*"/"safe haven cats:donation"/g
s/"BEST CHOICE ROOF.*"/"best choice roofing:home"/g
s/"BEST WESTERN.*"/"best western hotel:travel"/g
s/"BIG LOTS.*"/"big lots store:retial"/g
s/"BLUE CROSS.*"/"blue cross:medical"/g
s/"BMX\*DOMINION.*"/"dominion natural gas:utility"/g
s/"BOOKS A MILLION.*"/"books a million:retail"/g
s/"BOX LUNCH.*"/"box lunch:food"/g
s/"BUFFALO BRO.*"/"buffalo brothers:food"/g
s/"BULL CITY BURGER.*"/"bull city burger:food"/g
s/"BULL CITY FINA.*"/"bull city financial:medical"/g
s/"CAREMARK.*"/"caremark pharmacy:medical"/g
s/"CARQUEST.*"/"carquest:tools"/g
s/"CASA CARBON.*"/"casa carbone:food"/g
s/"CENGAGE LEA.*"/"cengage learning:school"/g
s/"CHAMPA.*"/"champa grill:food"/g
s/"CHARLES MEGLIO.*"/"charles meglio:misc"/g
s/"CHASE PARK PLAZA.*"/"chase park plaza:travel"/g








































