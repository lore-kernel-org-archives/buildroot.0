From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 11 May 2014 20:51:20 +0200
Subject: [Buildroot] [PATCH] libeio: needs threads
In-Reply-To: <082d8eff94b1a2e5f210119dcff157435af6147c.1399797292.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Sun, 11 May 2014 11:34:52 +0300")
References: <082d8eff94b1a2e5f210119dcff157435af6147c.1399797292.git.baruch@tkos.co.il>
Message-ID: <87oaz487yv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/278/27854bf8425d64dbb475653161bbf1f386173366/

 > libeio only reverse dependency (enlightenment) depends on
 > BR2_TOOLCHAIN_HAS_THREADS already.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
