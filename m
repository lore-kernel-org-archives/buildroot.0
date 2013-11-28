From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 28 Nov 2013 23:25:54 +0100
Subject: [Buildroot] [PATCH v3 1/2] libnspr: Add dependency on
	!BR2_xtensa and !BR2_bfin
In-Reply-To: <3b85e7b21185d25eb6f40c25ac1402aa08b1bfeb.1385567320.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 27 Nov 2013 17:48:39 +0200")
References: <3b85e7b21185d25eb6f40c25ac1402aa08b1bfeb.1385567320.git.baruch@tkos.co.il>
Message-ID: <8761rcxix9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > From: Chris Zankel <chris@zankel.net>
 > Xtensa is not yet supported in libnspr. Also add dependencies to libnss,
 > which requires libnspr, and ecryptfs-utils, which requires libnss.

 > Fixes (xtensa)
 > http://autobuild.buildroot.net/results/14b/14ba6426edbffa100de924aa69157b3f59368ff2/

 > Fixes (blackfin)
 > http://autobuild.buildroot.net/results/dd3/dd353703ed94cec48cd126d80cd2f1b039811be4/

 > [baruch: fix summary, add autobuild reference, add comment dependency,
 >  add blackfin]

 > Signed-off-by: Chris Zankel <chris@zankel.net>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > ---

 > v3:
 > 	Move the list of arch dependencies to a separate config symbol to reduce
 > 	the churn when arch dependencies changes (Thomas Petazzoni)

 > 	Add blackfin to the not-supported list

Committed both, thanks.

-- 
Bye, Peter Korsgaard
