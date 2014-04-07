From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 Apr 2014 23:55:06 +0200
Subject: [Buildroot] [PATCH] harfbuzz: disable static build
In-Reply-To: <3efb9030cd296fe5bff851119271dad240900c1d.1396855052.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 7 Apr 2014 10:17:32 +0300")
References: <3efb9030cd296fe5bff851119271dad240900c1d.1396855052.git.baruch@tkos.co.il>
Message-ID: <87r458dcud.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > harfbuzz doesn't handle static linking against pthread correctly.
 > Fixes:
 > http://autobuild.buildroot.net/results/701/701a1a260a58a81f45b3b9eae7eb47b400e05b37/

Thanks, but looking at the build error (linking issue of test programs)
it looks quite easy to fix, so I've done that instead.

-- 
Bye, Peter Korsgaard
