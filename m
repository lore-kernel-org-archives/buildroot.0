From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Jul 2019 08:23:20 +0200
Subject: [Buildroot] [PATCH] package/libnftnl: drop obsolete patch
In-Reply-To: <8f9414398d3f524d9b44a196ca134638b3604e0f.1562296092.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 5 Jul 2019 06:08:12 +0300")
References: <8f9414398d3f524d9b44a196ca134638b3604e0f.1562296092.git.baruch@tkos.co.il>
Message-ID: <87tvc1vw2v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Patch #1 is obsolete since upstream commit 244d60de2f1 ("utils: define
 > xfree() as macro") in version 1.0.3. xfree is no longer a symbol, so it
 > can't conflict with symbols of the code libnftnl links with.

 > Cc: Yegor Yefremov <yegorslists@googlemail.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
