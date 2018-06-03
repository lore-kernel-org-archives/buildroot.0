From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 3 Jun 2018 20:41:56 +0200
Subject: [Buildroot] [PATCH 1/1] libraw: bump to version 0.18.11
In-Reply-To: <20180530200519.19155-1-fontaine.fabrice@gmail.com>
References: <20180530200519.19155-1-fontaine.fabrice@gmail.com>
Message-ID: <20180603204156.76df6edd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 May 2018 22:05:19 +0200, Fabrice Fontaine wrote:
> - Remove all patches (already in version)
> - Since version 0.18 (2016-12-07), there is no
>   'LibRaw Software License 27032010' licensing anymore (and all signed
>   agreements have expired). LibRaw is now dual-licensed: LGPL 2.1 or
>   CDDL 1.0
> - Add hash for license files
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...emove-paths-which-break-cross-compilation.patch |  29 --
>  ...002-libraw_x3f.cpp-remove-Byte-order-mark.patch |  39 ---
>  ...ernal-dcraw_common-rename-internal-powf64.patch | 348 ---------------------
>  package/libraw/libraw.hash                         |   6 +-
>  package/libraw/libraw.mk                           |  11 +-
>  5 files changed, 7 insertions(+), 426 deletions(-)
>  delete mode 100644 package/libraw/0001-Remove-paths-which-break-cross-compilation.patch
>  delete mode 100644 package/libraw/0002-libraw_x3f.cpp-remove-Byte-order-mark.patch
>  delete mode 100644 package/libraw/0003-internal-dcraw_common-rename-internal-powf64.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
