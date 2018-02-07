From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 7 Feb 2018 16:59:15 +0200
Subject: [Buildroot] [PATCH 1/1] busybox: bump to 1.28.0
In-Reply-To: <20180207145215.19465-1-aduskett@gmail.com>
References: <20180207145215.19465-1-aduskett@gmail.com>
Message-ID: <20180207145915.pxmyc7ggfscxkpxs@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam,

On Wed, Feb 07, 2018 at 09:52:15AM -0500, Adam Duskett wrote:
> Other changes:
>  - Update 0002-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch
>    for 1.28.0
>  - Remove upstream patches 3, 4, and 5.
>  - Update buxybox.config and busybox-minimal.config

Also fixes CVE-2017-15873 (upstream commit 0402cb32d), and CVE-2017-15874 
(upstream commit 9ac42c500586).

baruch

> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  ...ags-strip-non-l-arguments-returned-by-pkg.patch |  4 +-
>  ...clude-per-arch-Makefile-before-Makefile.f.patch | 46 -----------
>  ...h-sparc-sparc64-Makefile-define-ARCH_FPIC.patch | 79 ------------------
>  ...0005-httpd-fix-handling-of-range-requests.patch | 27 -------
>  package/busybox/busybox-minimal.config             | 93 +++++++++++++---------
>  package/busybox/busybox.config                     | 87 ++++++++++++--------
>  package/busybox/busybox.hash                       |  6 +-
>  package/busybox/busybox.mk                         |  2 +-
>  8 files changed, 116 insertions(+), 228 deletions(-)
>  delete mode 100644 package/busybox/0003-Makefile-include-per-arch-Makefile-before-Makefile.f.patch
>  delete mode 100644 package/busybox/0004-arch-sparc-sparc64-Makefile-define-ARCH_FPIC.patch
>  delete mode 100644 package/busybox/0005-httpd-fix-handling-of-range-requests.patch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
