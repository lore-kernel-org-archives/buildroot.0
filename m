From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 26 Nov 2013 13:42:08 +0100
Subject: [Buildroot] [PATCH] uclibc-snapshot: enable option
	UCLIBC_SUSV2_LEGACY
In-Reply-To: <46fc98d21f475329842710a85d93130fd829a1f4.1385467267.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 26 Nov 2013 14:01:07 +0200")
References: <46fc98d21f475329842710a85d93130fd829a1f4.1385467267.git.baruch@tkos.co.il>
Message-ID: <87eh63jpwf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > From: Chris Zankel <chris@zankel.net>
 > With uClibc commit e8065705, valloc is now optional in SUSv2 and removed
 > from SUSv3 and later. However, cdrkit currently requires valloc, so
 > enable it in the uClibc snapshot configuration file.

 > Fixes
 > http://autobuild.buildroot.net/results/5a5/5a51f3f06e04eed39d59477ea1178aef7d397754/

 > Signed-off-by: Chris Zankel <chris@zankel.net>
 > [baruch: fix summary line, add autobuild reference]
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
