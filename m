From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 11 Feb 2014 19:53:38 +0100
Subject: [Buildroot] [PATCH 2/3] coreutils: fix build against uclibc
	snapshot
In-Reply-To: <5d62445fcadab4f283d0e1868bd2481d9c40856a.1392128329.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 11 Feb 2014 16:25:21 +0200")
References: <cover.1392128329.git.baruch@tkos.co.il>
 <5d62445fcadab4f283d0e1868bd2481d9c40856a.1392128329.git.baruch@tkos.co.il>
Message-ID: <874n45v5u5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > uClibc development version adds support for POSIX spawn routines. However,
 > unlike glibc these routines are in librt. This breaks gnulib autoconf
 > detection. Teach gnulib autoconf to look for POSIX spawn in librt.

 > Fixes:
 > http://autobuild.buildroot.net/results/246/246b3778a1a646afd1c8b9c17b4579fb5a27120e/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
