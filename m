From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Sep 2018 21:15:14 +0200
Subject: [Buildroot] [PATCH] package/gcc: xtensa: fix atomic NAND code
 generation
In-Reply-To: <20180905164839.14360-1-jcmvbkbc@gmail.com>
References: <20180905164839.14360-1-jcmvbkbc@gmail.com>
Message-ID: <20180905211514.519f071e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  5 Sep 2018 09:48:39 -0700, Max Filippov wrote:
> xtensa gcc incorrectly generates code for atomic NAND operation as
> ~a1 & a2 instead of ~(a1 & a2). Fix that.
> 
> Backported from: r264087
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  ...nsa-fix-NAND-code-in-xtensa_expand_atomic.patch | 39 ++++++++++++++++++++++
>  ...nsa-fix-NAND-code-in-xtensa_expand_atomic.patch | 39 ++++++++++++++++++++++
>  ...nsa-fix-NAND-code-in-xtensa_expand_atomic.patch | 39 ++++++++++++++++++++++
>  3 files changed, 117 insertions(+)
>  create mode 100644 package/gcc/6.4.0/872-gcc-xtensa-fix-NAND-code-in-xtensa_expand_atomic.patch
>  create mode 100644 package/gcc/7.3.0/0003-gcc-xtensa-fix-NAND-code-in-xtensa_expand_atomic.patch
>  create mode 100644 package/gcc/8.2.0/0004-gcc-xtensa-fix-NAND-code-in-xtensa_expand_atomic.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
