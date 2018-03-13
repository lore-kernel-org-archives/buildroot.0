From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Mar 2018 22:14:03 +0100
Subject: [Buildroot] [PATCH] uclibc-ng-test: fix build with musl and
 older kernel headers
In-Reply-To: <dc0715acbc8fffc5fe66d2d81e205e31bf1ba6dd.1520945641.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 13 Mar 2018 14:54:01 +0200")
References: <dc0715acbc8fffc5fe66d2d81e205e31bf1ba6dd.1520945641.git.baruch@tkos.co.il>
Message-ID: <874lljllus.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > musl libc provides its own system call macros, including
 > preadv2/pwritev2. Having these macros defined is not enough to determine
 > availability of other related macros in kernel headers.

 > Add a patch to check these macros directly.

 > Fixes:
 > http://autobuild.buildroot.net/results/7e9/7e9945f46ef9e0f6de7e1c85b0ca1104df6c86f5/
 > http://autobuild.buildroot.net/results/782/782652193bb6770ae68d509b3a7087667622d627/
 > http://autobuild.buildroot.net/results/582/5827a724c7f24218010f4cdd24924dca457b0361/

 > Cc: Waldemar Brodkorb <wbx@openadk.org>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
