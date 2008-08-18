From: mohammad shojaeinia <mohashoj2004@gmail.com>
Date: Mon, 18 Aug 2008 16:50:30 +0330
Subject: [Buildroot] [ns] (.text+0x6b13): undefined reference to
	function_name
Message-ID: <1911987e0808180620x4e8508ceyec27397542b01962@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi
Dear ns-users
i use *"make clean"* and *"make"* for run trust based routing in DSR but i
give some error such this
help me please
this code is refer to Mr Leonard conard

dsr/dsragent.o: In function
`DSRAgent::returnSrcRouteToRequestor(SRPacket&)':
dsragent.cc:(.text+0x8cf): undefined reference to
`TrustManager::initNewTrustValues(Path&, int)'
dsr/dsragent.o: In function
`DSRAgent::returnSrcRteForOutsideDomainToRequestor(SRPacket&)':
dsragent.cc:(.text+0xd11): undefined reference to
`TrustManager::initNewTrustValues(Path&, int)'
dsr/dsragent.o: In function `DSRAgent::sendOutPacketWithRoute(SRPacket&,
bool, double)':
dsragent.cc:(.text+0x1219): undefined reference to
`ACKMonitor::addACK(double, int*, int, double)'
dsr/dsragent.o: In function `DSRAgent::sendRouteShortening(SRPacket&, int,
int)':
dsragent.cc:(.text+0x1c7c): undefined reference to
`TrustManager::initNewTrustValues(Path&, int)'
dsr/dsragent.o: In function `DSRAgent::replyFromRouteCache(SRPacket&)':
dsragent.cc:(.text+0x257f): undefined reference to
`TrustManager::initNewTrustValues(Path&, int)'
dsr/dsragent.o: In function `DSRAgent::handleForwarding(SRPacket&)':
dsragent.cc:(.text+0x2c90): undefined reference to
`TrustManager::initNewTrustValues(Path&, int)'
dsr/dsragent.o: In function `DSRAgent::acceptRouteReply(SRPacket&)':
dsragent.cc:(.text+0x3090): undefined reference to
`TrustManager::initNewTrustValues(Path&, int)'
dsr/dsragent.o: In function `DSRAgent::tap(Packet const*)':
dsragent.cc:(.text+0x4d54): undefined reference to
`TrustManager::initNewTrustValues(Path&, int)'
dsr/dsragent.o:dsragent.cc:(.text+0x4e46): more undefined references to
`TrustManager::initNewTrustValues(Path&, int)' follow
dsr/dsragent.o: In function `DSRAgent::handlePacketReceipt(SRPacket&)':
dsragent.cc:(.text+0x55d8): undefined reference to
`TrustManager::updateTrustForNodes(Path&, double)'
dsragent.cc:(.text+0x5670): undefined reference to
`TrustManager::initNewTrustValues(Path&, int)'
dsragent.cc:(.text+0x57fc): undefined reference to
`ACKMonitor::handleACKReceived(double, int*, int, double, int)'
dsr/dsragent.o: In function `DSRAgent::Terminate()':
dsragent.cc:(.text+0x6276): undefined reference to `TrustManager::save(int)'
dsragent.cc:(.text+0x6286): undefined reference to `TrustManager::toPrint()'
dsragent.cc:(.text+0x62d6): undefined reference to `ACKMonitor::terminate()'
dsr/dsragent.o: In function `DSRAgent::command(int, char const* const*)':
dsragent.cc:(.text+0x6b13): undefined reference to
`TrustManager::setId(int)'
dsragent.cc:(.text+0x6b37): undefined reference to `TrustManager::load(int)'
dsr/dsragent.o: In function `DSRAgent::~DSRAgent()':
dsragent.cc:(.text+0x6c10): undefined reference to
`ACKMonitor::~ACKMonitor()'
dsr/dsragent.o: In function `DSRAgent::~DSRAgent()':
dsragent.cc:(.text+0x6dca): undefined reference to
`ACKMonitor::~ACKMonitor()'
dsr/dsragent.o: In function `DSRAgent::~DSRAgent()':
dsragent.cc:(.text+0x6f76): undefined reference to
`ACKMonitor::~ACKMonitor()'
dsr/dsragent.o: In function `DSRAgent::initTrustManager()':
dsragent.cc:(.text+0x70de): undefined reference to
`TrustFormaterS1::TrustFormaterS1(TrustManager*)'
dsragent.cc:(.text+0x70f5): undefined reference to
`TrustManager::setTrustFormater(TrustFormater*)'
dsragent.cc:(.text+0x710f): undefined reference to
`TrustUpdaterS1::TrustUpdaterS1()'
dsragent.cc:(.text+0x7150): undefined reference to
`TrustManager::setTrustUpdater(TrustUpdater*)'
dsragent.cc:(.text+0x7189): undefined reference to
`ACKMonitor::setTrustManager(TrustManager*)'
dsr/dsragent.o: In function `DSRAgent::DSRAgent()':
dsragent.cc:(.text+0x75bf): undefined reference to
`TrustManager::TrustManager()'
dsragent.cc:(.text+0x7626): undefined reference to
`ACKMonitor::ACKMonitor()'
dsragent.cc:(.text+0x777c): undefined reference to
`ACKMonitor::~ACKMonitor()'
dsr/dsragent.o: In function `DSRAgent::DSRAgent()':
dsragent.cc:(.text+0x7a9d): undefined reference to
`TrustManager::TrustManager()'
dsragent.cc:(.text+0x7b04): undefined reference to
`ACKMonitor::ACKMonitor()'
dsragent.cc:(.text+0x7c5a): undefined reference to
`ACKMonitor::~ACKMonitor()'
collect2: ld returned 1 exit status
make: *** [ns] Error 1
Regards,
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080818/0780391a/attachment.htm 
