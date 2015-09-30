From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Sep 2015 22:56:00 +0200
Subject: [Buildroot] [PATCH] iostat: fix build with musl
In-Reply-To: <0adb275dfb0b27263aa2a671be7505ca55eb5db8.1443633203.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 30 Sep 2015 20:13:23 +0300")
References: <0adb275dfb0b27263aa2a671be7505ca55eb5db8.1443633203.git.baruch@tkos.co.il>
Message-ID: <87pp0zwrrz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > musl does not provide access to the kernel defined HZ macro. Under Linux HZ is
 > always 100, so use that value.

 > Fixes:
 > http://autobuild.buildroot.net/results/dc9/dc98a572c7055cb66cf14648af750b7e0c8e136e/
 > http://autobuild.buildroot.net/results/fe3/fe3907858f90f766f1949be631427dbb079e08ed/
 > http://autobuild.buildroot.net/results/59e/59e7c8a3d94d06ba52ea5034fcabd9737a5314db/

 > and more.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
