From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Oct 2016 22:20:56 +0200
Subject: [Buildroot] [PATCH] lirc-tools: fix build with kernel headers
	v4.8+
In-Reply-To: <7ccf454919745520121768791455dc138ccdf6db.1476819325.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 18 Oct 2016 22:35:25 +0300")
References: <7ccf454919745520121768791455dc138ccdf6db.1476819325.git.baruch@tkos.co.il>
Message-ID: <87lgxlflxz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Backport upstream path that removes reverence to macros that are no longer in
 > the kernel lirc.h headers.

 > Fixes:
 > http://autobuild.buildroot.net/results/f01/f015d52faa214f7786dd3169628ce74b738a8b46/
 > http://autobuild.buildroot.net/results/55f/55f1ac19736499ef536561bd65c011d2649f43da/
 > http://autobuild.buildroot.net/results/c68/c689786b6b0867cea2e45df1c5556cccdd377b33/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
