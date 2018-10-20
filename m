From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Oct 2018 14:24:27 +0200
Subject: [Buildroot] [PATCH] mdadm: fix mdmon build without threads
In-Reply-To: <1bb26b73a032e6492f0cbeb97e99e029c1869a1f.1539944304.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 19 Oct 2018 13:18:24 +0300")
References: <1bb26b73a032e6492f0cbeb97e99e029c1869a1f.1539944304.git.baruch@tkos.co.il>
Message-ID: <87pnw4dcw4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Commit 45498bbc62d8df (mdadm: also install mdmon) enabled build of hte
 > mdmon utility. This utility requires USE_PTHREADS make variable
 > undefined to build when threads are not supported.

 > Fixes:
 > http://autobuild.buildroot.net/results/4bd/4bdd03b1d8f30ef32177727aae46d8cf54fbc35e/

 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
