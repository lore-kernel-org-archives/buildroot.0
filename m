From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 13:20:03 +0200
Subject: [Buildroot] [PATCH] libssh: fix build with musl libc
In-Reply-To: <c6c17e3d2f56efd666671cb38bb037d9741536a7.1536933561.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 14 Sep 2018 16:59:21 +0300")
References: <c6c17e3d2f56efd666671cb38bb037d9741536a7.1536933561.git.baruch@tkos.co.il>
Message-ID: <87zhv3bnh8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > libssh uses GNU extensions to the glob() API. Update the cmake test to
 > take that into account so that glob() is not used with musl libc.

 > Fixes:
 > http://autobuild.buildroot.net/results/0c2/0c2d17316fd6bd2bf1359e23a2a1273fa349cf2a/
 > http://autobuild.buildroot.net/results/936/936abac5362b33980fd1efe8b830409ee2f86f6b/
 > http://autobuild.buildroot.net/results/51b/51b1b136ab4209ee443c1b450a932341b2ff81b7/

 > Cc: Scott Fan <fancp2007@gmail.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
