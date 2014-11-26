From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Nov 2014 23:22:54 +0100
Subject: [Buildroot] [PATCH] libnspr: fix static build
In-Reply-To: <4112e251a7a4b3513c66ff30ac2f502b0aa2541c.1417022842.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 26 Nov 2014 19:27:22 +0200")
References: <4112e251a7a4b3513c66ff30ac2f502b0aa2541c.1417022842.git.baruch@tkos.co.il>
Message-ID: <87oartppoh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Disable shared library in a static build.
 > Fixes:
 > http://autobuild.buildroot.net/results/6ff/6ffae151ec3eaca175923ab860cf42167871164c/
 > http://autobuild.buildroot.net/results/cab/cab19721c43b3256dd51ae511016bc9ea440512a/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
