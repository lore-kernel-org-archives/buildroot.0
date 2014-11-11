From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 11 Nov 2014 22:41:11 +0100
Subject: [Buildroot] [PATCH] tcpdump: fix static build
In-Reply-To: <be457e188e773edcdc62c53a9237aa532b708c0e.1415701383.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 11 Nov 2014 12:23:03 +0200")
References: <be457e188e773edcdc62c53a9237aa532b708c0e.1415701383.git.baruch@tkos.co.il>
Message-ID: <87vbmll8js.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Commit 746116d1eb2e (tcpdump: use libpcap shared library) broke static build
 > of tcpdump, because its configure script doesn't take into account indirect
 > dependencies of libpcap. Add these dependencies to the LIBS configure
 > parameter.

 > Fixes:
 > http://autobuild.buildroot.net/results/fd231d34e4bb0306609b021e9e74eb862b7bd6bd/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
