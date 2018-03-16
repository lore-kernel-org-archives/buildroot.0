From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 Mar 2018 22:03:14 +0100
Subject: [Buildroot] [PATCH] xfsprogs: fix build with musl
In-Reply-To: <3dfc3abd899ffac0abac2c6ec55ee158a291dbce.1521181880.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 16 Mar 2018 08:31:20 +0200")
References: <3dfc3abd899ffac0abac2c6ec55ee158a291dbce.1521181880.git.baruch@tkos.co.il>
Message-ID: <87y3irhgx9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Add two patches to fix missing header files that trigger build failure
 > with musl libc.

 > Fixes:
 > http://autobuild.buildroot.net/results/a39/a3989394aba0bd3a52146e2a5e6b87b586efb6c6/
 > http://autobuild.buildroot.net/results/b3b/b3b3c06ea565125bf9f9ad2ebc16bb21f6c7228f/
 > http://autobuild.buildroot.net/results/223/2238475d2c21c65960a56f86a08fe35d1021080f/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
