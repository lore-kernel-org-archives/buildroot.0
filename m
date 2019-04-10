From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Apr 2019 19:27:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/libunwind: bump to version 1.3.1
In-Reply-To: <20190407171820.3379-1-fontaine.fabrice@gmail.com>
References: <20190407171820.3379-1-fontaine.fabrice@gmail.com>
Message-ID: <20190410192720.27d71287@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  7 Apr 2019 19:18:20 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Remove first, third and fourth patches (already in version)
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ..._REQUIRE_CAS-to-fix-build-on-ARM-v6.patch} |  0
>  .../0001-add-disable-tests-option.patch       | 68 --------------
>  ...n-of-tests-on-alpine-linux-musl-libc.patch | 88 -------------------
>  ...ind-arm-fix-build-failure-due-to-asm.patch | 43 ---------
>  package/libunwind/libunwind.hash              |  5 +-
>  package/libunwind/libunwind.mk                |  2 +-
>  6 files changed, 5 insertions(+), 201 deletions(-)
>  rename package/libunwind/{0002-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch => 0001-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch} (100%)
>  delete mode 100644 package/libunwind/0001-add-disable-tests-option.patch
>  delete mode 100644 package/libunwind/0003-Fix-compilation-of-tests-on-alpine-linux-musl-libc.patch
>  delete mode 100644 package/libunwind/0004-libunwind-arm-fix-build-failure-due-to-asm.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
