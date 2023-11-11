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
# autos = automobile

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
s/"OfferAudible.*"/"audible:service"/g
s/"BP#.*"/"bp:gas"/g
s/"BARNES & NOBLE.*"/"barns noble:retail"/g
s/"AUTOZONE.*"/"autozone:autos"/g
s/"BEST BUY.*"/"best buy:retail"/g
s/"(BRUEGGERS|BRUEGGER'S BAGELS).*"/"breuggers bagels:food"/g
s/"BOJANGLES.*"/"bojangles:food"/g
s/"CHICK\-FIL\-A.*"/"chick-fil-a:food"/g
s/"(CHINA ?TOWN|FOOD AT CHINA EXPRESS|BM CHINATOWN EXPRESS).*"/"chinatown express:food"/g
s/"CIRCLE K.*"/"circle k:gas"/g
s/"(CINEMARK|CNK\*CINEMARK\.COM).*"/"cinemark:retail"/g
s/"CITY OF RALEIGH.*"/"raliegh water sewer:utility"/g
s/"(CONSUMERREPORTS|CONSUMERRPRTS|CR \*CONSUM|CR DIGITAL M).*"/"consumer reports:service"/g
s/"COOK OUT.*"/"cook out:food"/g
s/"CVS\/PHARMACY.*"/"cvs pharmacy:medical"/g
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
s/"NCDMV.*"/"nc dmv:autos"/g
s/"PAYIT NC DMV.*"/"nc dmv:autos"/g
s/"NC QUICK PASS.*"/"nc quick pass:travel"/g
s/"(NCSU|NC STATE).*"/"nc state:school"/g
s/"NORTH CAROLINA STATE UNIV.*"/"nc state:school"/g
s/"NEO-ASIA.*"/"neo asia:food"/g
s/"netflix.com.*"/"netflix:service"/g
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
s/"UBER TRIP.*"/"uber rides:travel"/g
s/"UberBV.*"/"uber rides:travel"/g
s/"U.HAUL.*"/"u-haul:home"/g
s/"USPS.*"/"us post office:misc"/g
s/"WAKE.?TECH.*"/"wake tech:school"/g
s/"WALGREENS.*"/"walgreens:retail"/g
s/"(WAL-MART #|WALMART\.COM|WM SUPERCENTER).*"/"wal-mart:retail"/g
s/"WEIGHTWATCHERS.*"/"weight watchers:service"/g
s/"WENDYS .*"/"wendys:food"/g
s/"54TH STREET.*"/"54th street:food"/g
s/"ADVANCE AUTO.*"/"advance auto:autos"/g
s/"ADY\*Jetbrains.*"/"jetbrains:service"/g
s/"AIRBNB.*"/"airbnb:travel"/g
s/"AJISAI.*"/"ajisai:food"/g
s/"Angie's List.*"/"angie's list:service"/g
s/"AMZ\*Wikimedia.*"/"wikipedia:donation"/g
s/"AMZ*034Motorsport.*"/"motorsport store:autos"/g
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
s/"CARQUEST.*"/"carquest:autos"/g
s/"CASA CARBON.*"/"casa carbone:food"/g
s/"CENGAGE LEA.*"/"cengage learning:school"/g
s/"CHAMPA.*"/"champa grill:food"/g
s/"CHARLES MEGLIO.*"/"charles meglio:misc"/g
s/"CHASE PARK PLAZA.*"/"chase park plaza:travel"/g
s/"NAMI .*"/"nami:donation"/g
s/"NATL SOC OF.*"/"national society of lead:misc"/g
s/"NBS-NCS\*.*"/"nbs-ncs service:misc"/g
s/"NICKEL POINT.*"/"nickel point brewing:food"/g
s/"NOODLES \& CO.*"/"noodles & co:food"/g
s/"NORTHERN TOOL.*"/"northern tool:tools"/g
s/"OAK PARK POOL.*"/"oak park pool:home"/g
s/"OFFICEMAX.*"/"office max:retail"/g
s/"OFFICIAL RECORDS ONLINE.*"/"official records online:service"/g
s/"OPTIMUM OUTCOMES.*"/"optimum outcomes:misc"/g
s/"OREILLYMEDIA.*"/"oreilly books:service"/g
s/"OUR LADY OF LOURDES.*"/"our lady of lourdes:donation"/g
s/"PADDLE\.NET\* CURSIVE.*"/"cursive intellij plugin:service"/g
s/"PARADISE INDIAN.*"/"paradise indian cuisine:food"/g
s/"PARKER'S #.*"/"parker's 54:food"/g
s/"PATEL BRO.*"/"patel brothers:grocery"/g
s/"Payment Thank You.*"/"amazon payment:payment"/g
s/"AERCRECYCLI.*"/"aerc recycling:misc"/g
s/"ANCESTRYCOM.*"/"ancestry.com:service"/g
s/"ANTENNAMANL.*"/"antenna man:service"/g
s/"AUTOZONEINC.*"/"autozone:autos"/g
s/"BITWARDEN.*"/"bitwarden:service"/g
s/"BM.*"/"paypal bm:misc"/g
s/"CARFAXINC.*"/"carfax:autos"/g
s/"DOMINO'S.*"/"dominos:food"/g
s/"EBAY.*"/"ebay:delivery"/g
s/"ECSTUNING.*"/"ecstuning:autos"/g
s/"FEVER.*"/"paypal fever:misc"/g
s/"FOOD ONLINE CHIN.*"/"chinatown express:food"/g
s/"HOME DEPOT.*"/"home depot:tools"/g
s/"IDPARTS.*"/"idparts:autos"/g
s/"INNOVATEPC.*"/"innova tech:delivery"/g
s/"ISLANDGROCE.*"/"island groceries:delivery"/g
s/"LEANPUB.*"/"leanpub:service"/g
s/"LOWES\.COM.*"/"lowes hardware:tools"/g
s/"MEDIUM\.COM.*"/"medium.com:service"/g
s/"MICROSOFTSTORE.*"/"microsoft store:service"/g
s/"NAMI WAKE.*"/"nami:donation"/g
s/"NY TIMES.*"/"nytimes:service"/g
s/"OAKPARKPOO.*"/"oak park pool:home"/g
s/"ORATOR LLC.*"/"orator llc:service"/g
s/"PADDLE\.COM.*"/"cursive intellij plugin:service"/g
s/"PEARSONEDUC.*"/"pearson education:school"/g
s/"SAFELITE.*"/"safelite glass:autos"/g
s/"SCOOTERSOF.*"/"scooter software:service"/g
s/"TAGCROWDCOM.*"/"tag crowd.com:service"/g
s/"TEQUIPMENT.*"/"te equipment:delivery"/g
s/"VIDAXLLLC.*"/"vidaxl llc:service"/g
s/"VIDAXLLLC.*"/"vidax llc:service"/g
s/"WAYFAIR.*"/"wayfair:delivery"/g
s/"WIKIPEDIA.*"/"wikipedia:donation"/g
s/"ZENNIOPTICL.*"/"zenni optical:medical"/g
s/"PEPBOYS.*"/"pepboys:autos"/g
s/"PERSIS INDIAN.*"/"persis indian grill:food"/g
s/"PHOENIX LIMITED PARTNERSH.*"/"phoenix partners:misc"/g
s/"PIGGLY WIGGLY.*"/"piggly wiggly:grocery"/g
s/"POCKET GETPOCKET.*"/"pocket:service"/g
s/"PLAYERS RETREAT.*"/"players retreat:misc"/g
s/"POOLE'S PLUMBING.*"/"pooles plumbing:home"/g
s/"POPEYES.*"/"popeyes:food"/g
s/"POPSHELF.*"/"popshelf:retail"/g
s/"PP\*BRUCELEETEALLC.*"/"bruce lee tea:food"/g
s/"PP\*WINDSHIELDS.*"/"windshields:autos"/g
s/"Public Mini Mart.*"/"public minimart:retail"/g
s/"PURCHASE INTEREST CHARGE.*"/"purchase interest:payment"/g
s/"QDOBA.*"/"qdoba:food"/g
s/"PRICELN\*SANDCASTLE.*"/"sand castle resort:travel"/g
s/"QT .*"/"qt gas:gas"/g
s/"RALEIGH ENDO CENTER.*"/"raleigh endo center:medical"/g
s/"RALEIGH GRAND .*"/"raleigh grand theater:misc"/g
s/"RALEIGH UTILITY BILL.*"/"raleigh water sewer:utility"/g
s/"Randys Pizza.*"/"randys pizza:food"/g
s/"BAR TACO.*"/"bar taco:food"/g
s/"CHARGRILL.*"/"chargrill:food"/g
s/"CHEDDAR UP PAYMENT.*"/"cheddar up payment:misc"/g
s/"CHE EMPANADAS.*"/"che empanadas:food"/g
s/"CHEESECAKE.*"/"cheesecake factory:food"/g
s/"CHELSEA CAFE.*"/"chelsea cafe:food"/g
s/"CHHOTES.*"/"chhotes:misc"/g
s/"CHILI'S.*"/"chilis:food"/g
s/"CHIMNEYS PLUS.*"/"chimneys plus:home"/g
s/"CITY OF CHARLOTTE CDOT.*"/"charlotte parking:travel"/g
s/"CITYOFSTLOUIS\-PARKING.*"/"st louis parking:travel"/g
s/"CLAIRE'S.*"/"clairs:retail"/g
s/"CLASSIC PERFORMANCE AUTO.*"/"classic performance auto:autos"/g
s/"CLASS OF SENIOR DUES.*"/"senior dues:school"/g
s/"CNTY\/YLLW CAB.*"/"stl yellow cab:travel"/g
s/"COLLEGEBOARD\*PROFIL.*"/"college boards:school"/g
s/"CPR EDUCATORS.*"/"cpr educators:school"/g
s/"CREATION ENGINE INC.*"/"creation engine:service"/g
s/"CRISP SALAD .*"/"crisp salad:food"/g
s/"DICKEYS.*"/"dickeys:food"/g
s/"DICK'S SPORTING.*"/"dick's sporting:retail"/g
s/"DILLARD'S .*"/"dillards:retail"/g
s/"DINING MICROS.*"/"dining micros:food"/g
s/"DMV VEHICLE.*"/"nc dmv:autos"/g
s/"DOLLAR GENERAL.*"/"dollar general:retail"/g
s/"DOLLAR RENT A CAR.*"/"dollar rent a car:travel"/g
s/"D\-Triangle Vision.*"/"triangle vision:medical"/g
s/"DUCK DONUTS.*"/"duck donuts:food"/g
s/"EAGLES.*"/"eagles:misc"/g
s/"EAUTOREPAIR\.NET.*"/"eauto repair:autos"/g
s/"ECA 11.*"/"eca 11:misc"/g
s/"EZ WAY.*"/"ez way:misc"/g
s/"FAS MART.*"/"fas mart:gas"/g
s/"FASTMED URGENT.*"/"fast med urgent care:medical"/g
s/"FIRSTPOINT BD.*"/"firstpoint bd:misc"/g
s/"FIRST WATCH.*"/"first watch:food"/g
s/"FITNESS YOUR WAY.*"/"fitness your way:service"/g
s/"FLOORING ACCESSORY.*"/"flooring accessory:home"/g
s/"FRED ANDERSON NISSAN.*"/"fred anderson nissan:autos"/g
s/"FSI\*PSNC.*"/"psnc:utility"/g
s/"GATEWAY ARCH.*"/"gateway arch:travel"/g
s/"GCF.*"/"goodwill:retail"/g
s/"GINOS PIZZA.*"/"ginos pizza:food"/g
s/"GOV\*NC DMV.*"/"nc dmv:autos"/g
s/"GWU MUSEUM AND.*"/"george washington univ:travel"/g
s/"HABITAT FOR HUMANITY.*"/"habitat for humanity:retail"/g
s/"HELICOPTER SOL.*"/"helicopter solutions:travel"/g
s/"HIBACHI.*"/"hibachi grill:food"/g
s/"HOT TOPIC.*"/"hot topic myrtle beach:travel"/g
s/"HOLYLAND OLIVE.*"/"holyland olive wood:retail"/g
s/"HUDSONNEWS.*"/"hudson news:retail"/g
s/"IDPARTS.*"/"idparts:autos"/g
s/"IKEA ST LOUIS.*"/"ikea restaurant:food"/g
s/"I LOVE NY PIZZA.*"/"i love ny pizza:food"/g
s/"INTEREST CHARGE REVERSAL.*"/"interest charge reversal:payment"/g
s/"INTREX COMPUTERS.*"/"intrex computers:retail"/g
s/"JCPENNEY.*"/"jc penney:retail"/g
s/"JetBrains.*"/"jetbrains:service"/g
s/"JH ONLINE BILLING.*"/"jh online medical billing:medical"/g
s/"JIFFY LUBE.*"/"jiffy lube:autos"/g
s/"JOSE AND SONS.*"/"jose and sons:food"/g
s/"J Z WANG PSYCH.*"/"j z wang psychiatry:medical"/g
s/"KADHAI.*"/"kadhai indian:food"/g
s/"K DISCOUNT BEAUTY.*"/"k discount beauty:retail"/g
s/"KILWINS.*"/"kilwins:misc"/g
s/"KOHL'S.*"/"kohl's:retail"/g
s/"KROGER.*"/"kroger:grocery"/g
s/"KRUEGER SYSTEMS ICIRCUITA.*"/"icircuit:service"/g
s/"LEITH TOYOTA.*"/"leith toyota:autos"/g
s/"LEITH VW.*"/"leith vw:autos"/g
s/"LEMON SQUAD.*"/"lemon squad inspections:autos"/g
s/"LEMONS WRECKER.*"/"lemons wrecker:autos"/g
s/"LG CNS.*"/"lg cns:misc"/g
s/"LGBS ERC TOLLS.*"/"erc tolls:travel"/g
s/"LIDL.*"/"lidl:grocery"/g
s/"LIGHT YEARS.*"/"light years:retail"/g
s/"LOCALS SEAFOOD.*"/"locals seafood:food"/g
s/"LOGMEIN\*LastPass.*"/"lastpass:service"/g
s/"LYNNWOOD GRILL.*"/"lynnwood grill:food"/g
s/"MAMA MIA PIZZ.*"/"mama mia pizza:food"/g
s/"MANNING.*"/"mannng books:service"/g
s/"MAPLESOFT.*"/"maplesoft:service"/g
s/"MCKENZIE MRKTS.*"/"mckenzie markets:food"/g
s/"MCLAURIN PARKING.*"/"mclaurin parking:travel"/g
s/"MED\*RALEIGH ENDO.*"/"raleigh endo center:medical"/g
s/"MENCHIE`S FROZEN.*"/"menchie's frozen yogurt:food"/g
s/"MINUTEKEY.*"/"minute key dup:home"/g
s/"MO BOT GDN.*"/"missouri butterfly museum:travel"/g
s/"CARID.COM.*"/"carid.com:autos"/g
s/"VLADSCH.COM.*"/"vladsh.com:misc"/g
s/"PETCO.*"/"petco:retail"/g
s/"RALEIGH PARKING METERS.*"/"raleigh parking:travel"/g
s/"RDUAA PUBLIC.*"/"rdu parking:travel"/g
s/"RETINA ASSOC.*"/"retina associates:medical"/g
s/"REVCO SOLUTION.*"/"revco solutions:medical"/g
s/"REVELRY.*"/"revelry:misc"/g
s/"REX HOSPITAL.*"/"rex hospital:medical"/g
s/"ROSES.*"/"roses:misc"/g
s/"ROYAL CHIN.*"/"royal chinese buffet:food"/g
s/"RPS TALLA.*"/"rps tallahassee:travel"/g
s/"Safari Books.*"/"safari online:service"/g
s/"SAFE LIGHT.*"/"safe light:autos"/g
s/"SAINT LOUIS ZOO.*"/"st louis zoo:travel"/g
s/"SANDCASTL.*"/"sand castle resort:travel"/g
s/"SAUCECON ONLINE.*"/"saucecon conference:service"/g
s/"SEOUL GARDEN.*"/"seoul garden:food"/g
s/"SHABASHABU.*"/"shabashabu:food"/g
s/"SLEEPMED.*"/"sleepmed:medical"/g
s/"SMARTSTYLE.*"/"smartstyle:retail"/g
s/"SOFTPLAN.*"/"soft plan:service"/g
s/"SOHO STEAK.*"/"soho steak:food"/g
s/"SOPHIAMSACH.*"/"butterfly museum:travel"/g
s/"SPEEDWAY.*"/"speedway gas:gas"/g
s/"SP \* MONUMENT GRILLS.*"/"monument grills:delivery"/g
s/"266 PELICAN'S SNOBALL.*"/"pelican snoball:food"/g
s/"BTR PELICANS.*"/"pelican snoball:food"/g
s/"ARCH CAFE.*"/"arch cafe nyc:food"/g
s/"AROMA KOREA.*"/"aroma korean:food"/g
s/"BAZIL INDIAN.*"/"bazil indian cuisine:food"/g
s/"BROADWAY AT THE BEACH.*"/"broadway myrtle beach:travel"/g
s/"BRUEGGER'S BAGELS.*"/"breuggers bagels:food"/g
s/"CUSTOM STATION.*"/"custom station myrtle beach:travel"/g
s/"GROOVY DUCK BAKERY.*"/"groovy duck bakery:food"/g
s/"GUSSY'S PLACE.*"/"gussy's place:food"/g
s/"HOLLYWOOD HEROES.*"/"hollywood heroes:food"/g
s/"RALEIGH - VAN GOGH.*"/"van gogh exhibit:misc"/g
s/"THAI BISTRO.*"/"thai bistro:food"/g
s/"TRIANGLE RECONSTRUCTI.*"/"triangle reconstruction:home"/g
s/"SSM HEALTH SLUH PARKING.*"/"ssm hospital parking:travel"/g
s/"STATE FARM INSURANCE.*"/"state farm insurance:autos"/g
s/"ST\. LOUIS AIRPORT TAXI.*"/"st louis airport taxi:travel"/g
s/"STRAUB'S.*"/"straubs:grocery"/g
s/"SUGAR LIFE.*"/"sugar life myrtle beach:travel"/g
s/"SWERVEPAY LLC.*"/"swervepay:travel"/g
s/"TABLOTV\.COM.*"/"tablo tv:service"/g
s/"TASU ASIAN BISTRO.*"/"tasu asian bistro:food"/g
s/"TAXI TAXI.*"/"taxi taxi restaurant:food"/g
s/"T&C.*"/"t&c:misc"/g
s/"TELADOC.*"/"teladoc:medical"/g
s/"TGI FRIDAY.*"/"tgif friday's:food"/g
s/"THE CRAB HOUSE.*"/"crab house:food"/g
s/"THE FOUNDATION OF HOPE.*"/"foundation of hope:donation"/g
s/"THE GIANT CRAB.*"/"giant crab:food"/g
s/"THE MELTING POT.*"/"melting pot:food"/g
s/"THE UPS STORE.*"/"ups store:misc"/g
s/"TORRID.*"/"torrid:misc"/g
s/"TRADER JOE.*"/"trader joe's:grocery"/g
s/"Triangle Transit.*"/"triangle transit:travel"/g
s/"T\-SHIRT CONNECT.*"/"t-shirt connection:travel"/g
s/"TST\* BulBox.*"/"bulbox:food"/g
s/"TST\* CHAN.*"/"chan:food"/g
s/"TST\* Dank Burrito.*"/"dank burrito:food"/g
s/"TST\* SPICY 9.*"/"spicy 9:food"/g
s/"TST\* THE MELTING POT.*"/"melting pot:food"/g
s/"TST\* WOODY S SPORTS.*"/"woody's sports tavern:food"/g
s/"TTP\*TAUNTONPUBLISHER.*"/"taunton press:service"/g
s/"TVY\*FITNESSYOURWAY.*"/"fitness your way:service"/g
s/"UDAY REEBYE MD.*"/"dr uday reebye:medical"/g
s/"UNC CH EXERCISE.*"/"unc exercise:medical"/g
s/"UNC CH PERFORMING.*"/"unc performing arts:school"/g
s/"USA\*CANTEEN VENDING.*"/"canteen vending:food"/g
s/"VIVA MEXICAN KITCHEN.*"/"viva mexican kitchen:food"/g
s/"Volkswagen AG.*"/"vw:autos"/g
s/"WAKE COUNTY REVENUE DEPT.*"/"wake co revenue:taxes"/g
s/"WAKEMEDIC AUBONPAIN.*"/"au bon pain:food"/g
s/"WAL-MART CHECK PRINTNG.*"/"walmart check printing:misc"/g
s/"WASHINGTON PASSPORT.*"/"washington passport office:travel"/g
s/"WAWA.*"/"wawa gas:gas"/g
s/"WC REGISTER OF DEEDS.*"/"wake co registry of deeds:misc"/g
s/"WEGMANS.*"/"wegmans:grocery"/g
s/"WHALES.*"/"whales myrtle beach:travel"/g
s/"WINDY HILL ABC.*"/"abc liquors:retail"/g
s/"WOK N GRILL.*"/"wok n grill:food"/g
s/"WWW\.CAREMARK\.COM.*"/"caremark card:medical"/g
s/"WWWKERMATDI.*"/"kerma tdi:autos"/g
s/"YARD HOUSE.*"/"yard house:food"/g
s/"YOU TURN.*"/"you turn:misc"/g
s/"ZENNI OPTICAL.*"/"zenni optical:medical"/g
s/"ZWELIS.*"/"zwelis:food"/g
s/"AMZ\*034Motorsport De.*"/"034 motorsport:autos"/g
s/"SN \*Super 32 Challenge.*"/"super 32 challenge:misc"/g
s/"ULTA.*"/"ulta beauty:retail"/g
s/"WAKE RADIOLOGY CONSULTAN.*"/"wake radiology:medical"/g
s/"WHOLEFDS.*"/"whole foods:grocery"/g
s/"WWW\.TABLOTV\.COM.*"/"tablo tv:service"/g
s/"DIERBERGS.*"/"dierbergs:grocery"/g
s/"STLHOLOCAUSTMUSEUM.*"/"holocaust museum:travel"/g
s/"SSM SLUH CAFETERIA.*"/"ssm hospital cafeteria:food"/g
s/"KLS FINANCIAL SERVICES.*"/"kls financial:medical"/g
s/"SCHNUCKS.*"/"schnucks:grocery"/g
s/"A A PLUMBER.*"/"william the plumber:home"/g
s/"TST\* Drunken Fish.*"/"drunken fish:food"/g
s/"MENS WEARHOUSE.*"/"mens warehouse:clothing"/g
s/"SP SANCTUARY GIRL.*"/"christian bookstore:retail"/g
s/"TRIANGLE POP-UP.*"/"christian bookstore:retail"/g
s/"Offer:Audible.*"/"audible:service"/g
s/"LGBS: ERC TOLLS.*"/"toll road?:travel"/g
s/"BRIGS GREAT BEGINNINGS.*"/"briggs:food"/g
s/"COSTCO WHSE.*"/"costco:retail"/g
s/"WWW COSTCO.*"/"costco:home"/g
s/"TRIMBLE INC.*"/"sketchup:service"/g
s/"UNC CH DPS PAY.*"/"unc hosp parking:travel"/g
s/"TST\* The Bowls.*"/"bowls restaurant:food"/g
s/"YOHO HIBACHI.*"/"yoho sushi:food"/g
s/"CHOPSTICKS AND.*"/"chopsticks rest:food"/g
s/"RELISH CRAFT KITCHEN.*"/"relish craft:food"/g
s/"TARUN AGARWAL.*"/"dental arts:medical"/g
s/"USA\*MINUTE KEY.*"/"key making machine:home"/g
s/"2LEVY.*"/"levy appetize:food"/g
s/"ART INST.*"/"art institute:travel"/g
s/"AU BON PAIN.*"/"au bon pain:food"/g
s/"BIGBY COFFEE.*"/"bigby coffee:food"/g
s/"CABINET DIY.*"/"cabinet diy:home"/g
s/"Carts SmarteCarte.*"/"smart cart:travel"/g
s/"CHATGPT.*"/"chatgpt:service"/g
s/"CONDE NAST WIRED.*"/"wired mag:service"/g
s/"DECK THE NECK.*"/"deck the neck:retail"/g
s/"DEN MART CHARLOTTE.*"/"den mart charlotte:food"/g
s/"DISCOUNT TIRE.*"/"discount tire:autos"/g
s/"DMV LIABILITY INS.*"/"dmv penalty:autos"/g

