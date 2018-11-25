From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Nov 2018 09:20:54 +0100
Subject: [Buildroot] [PATCH next] uclibc: bump to version 1.0.31
In-Reply-To: <20181124234929.30984-1-casantos@datacom.com.br>
References: <20181124234929.30984-1-casantos@datacom.com.br>
Message-ID: <20181125092054.3555703d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 24 Nov 2018 21:49:29 -0200, Carlos Santos wrote:
> Remove all patches, since they were already applied upstream.
> Add license file hash.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
> ---
>  ...ldconfig-add-glibc-compatibility-fix.patch | 54 -------------------
>  ...ock_nanosleep-independent-of-thread-.patch | 34 ------------
>  ..._DEBUG-segv-when-printing-R_ARC_NONE.patch | 45 ----------------
>  ...stemp64-clear-flags-as-mkostemp-does.patch | 38 -------------
>  package/uclibc/uclibc.hash                    |  6 ++-
>  package/uclibc/uclibc.mk                      |  4 +-
>  6 files changed, 6 insertions(+), 175 deletions(-)
>  delete mode 100644 package/uclibc/0001-Revert-ldconfig-add-glibc-compatibility-fix.patch
>  delete mode 100644 package/uclibc/0002-librt-declare-clock_nanosleep-independent-of-thread-.patch
>  delete mode 100644 package/uclibc/0003-ldso-arc-fix-LD_DEBUG-segv-when-printing-R_ARC_NONE.patch
>  delete mode 100644 package/uclibc/0004-mkostemp64-clear-flags-as-mkostemp-does.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
