From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 16 Jan 2014 09:25:31 +0100
Subject: [Buildroot] [PATCH v2] rt-tests: disable NPTL is missing
In-Reply-To: <0255f67e72bc626106163b3cfb821a68d99970fd.1389596187.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 13 Jan 2014 08:56:27 +0200")
References: <0255f67e72bc626106163b3cfb821a68d99970fd.1389596187.git.baruch@tkos.co.il>
Message-ID: <87fvooqqo4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes
 > http://autobuild.buildroot.net/results/8aa/8aaa4b56a53241b7342fede568fbc72a7656cc38/.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > ---
 > v2: exclude linuxthreads-{old,new} for internal toolchains (Peter Korsgaard)

Committed, thanks.

-- 
Bye, Peter Korsgaard
