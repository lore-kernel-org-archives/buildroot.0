From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 12 Oct 2018 21:58:57 +0200
Subject: [Buildroot] [PATCH 1/2] spandsp: fix static build with jpeg
 enabled
In-Reply-To: <461481fbc34bd2142d4b7e7265f953c2fbf84056.1539319191.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 12 Oct 2018 07:39:50 +0300")
References: <461481fbc34bd2142d4b7e7265f953c2fbf84056.1539319191.git.baruch@tkos.co.il>
Message-ID: <87zhvjq6m6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > When jpeg is enabled libtiff links with it, but the spandsp configure
 > test doesn't take that into account, so the configure test fails. Use
 > pkg-config to add the required tiff dependencies.

 > Fixes:
 > http://autobuild.buildroot.net/results/243/243f1d1271a767556e0a4cd56a42fcc8c1a371ed/
 > http://autobuild.buildroot.net/results/485/48527e144bc4ad3eaab807f302888380bd9e78bb/
 > http://autobuild.buildroot.net/results/058/05885325ec274cb9860d423c57eed5e7063aedc0/

 > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
