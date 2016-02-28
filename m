From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Feb 2016 22:27:03 +0100
Subject: [Buildroot] [PATCH v2] gcc: remove 4.5.x
In-Reply-To: <1456345550-16199-1-git-send-email-gustavo@zacarias.com.ar>
References: <1456345550-16199-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160228222703.49e8e039@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 24 Feb 2016 17:25:50 -0300, Gustavo Zacarias wrote:
> It's been deprecated for some time now.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/gcc/4.5.4/100-uclibc-conf.patch            |  13 -
>  ...00-powerpc-link-with-math-lib.patch.conditional | 125 --------
>  package/gcc/4.5.4/301-missing-execinfo_h.patch     |  11 -
>  package/gcc/4.5.4/302-c99-snprintf.patch           |  13 -
>  .../gcc/4.5.4/305-libmudflap-susv3-legacy.patch    |  49 ---
>  package/gcc/4.5.4/810-arm-softfloat-libgcc.patch   |  38 ---
>  package/gcc/4.5.4/820-arm-unbreak-armv4t.patch     |  14 -
>  package/gcc/4.5.4/830-arm-pr43440.patch            | 345 ---------------------
>  package/gcc/Config.in.host                         |  27 --
>  9 files changed, 635 deletions(-)
>  delete mode 100644 package/gcc/4.5.4/100-uclibc-conf.patch
>  delete mode 100644 package/gcc/4.5.4/1000-powerpc-link-with-math-lib.patch.conditional
>  delete mode 100644 package/gcc/4.5.4/301-missing-execinfo_h.patch
>  delete mode 100644 package/gcc/4.5.4/302-c99-snprintf.patch
>  delete mode 100644 package/gcc/4.5.4/305-libmudflap-susv3-legacy.patch
>  delete mode 100644 package/gcc/4.5.4/810-arm-softfloat-libgcc.patch
>  delete mode 100644 package/gcc/4.5.4/820-arm-unbreak-armv4t.patch
>  delete mode 100644 package/gcc/4.5.4/830-arm-pr43440.patch

As requested by Peter, I've added Config.in.legacy handling, and
applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
