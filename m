From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 May 2018 22:47:00 +0200
Subject: [Buildroot] [PATCH 1/1] ltp-testsuite: Bump to version 20180515
In-Reply-To: <20180515145622.30102-1-petr.vorel@gmail.com>
References: <20180515145622.30102-1-petr.vorel@gmail.com>
Message-ID: <20180519224700.752d4196@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 May 2018 16:56:22 +0200, Petr Vorel wrote:
> Dropped patch applied by upstream + LTP_TESTSUITE_AUTORECONF = YES which
> this patch required and thus not needed any more.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  ...x-numa-v2-detection-for-cross-compilation.patch | 37 ----------------------
>  package/ltp-testsuite/ltp-testsuite.hash           |  4 +--
>  package/ltp-testsuite/ltp-testsuite.mk             |  5 +--
>  3 files changed, 3 insertions(+), 43 deletions(-)
>  delete mode 100644 package/ltp-testsuite/0002-numa-Fix-numa-v2-detection-for-cross-compilation.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
