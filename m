From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 21 Jun 2019 22:37:52 +0200
Subject: [Buildroot] [PATCH 1/2] package/uboot-tools: bump to version
 2019.04
In-Reply-To: <1561148550-3766-1-git-send-email-pjtexier@koncepto.io>
References: <1561148550-3766-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <20190621223752.3082f6a3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 21 Jun 2019 22:22:29 +0200
Pierre-Jean Texier <pjtexier@koncepto.io> wrote:

>  - Bump to version 2019.04.
>  - remove the patch that have been upstreamed.
>  - Refresh patches for the new version.
> 
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
>  .../uboot-tools/0001-drop-configh-from-tools.patch | 10 +++---
>  ...-Makefile-build-host-tools-with-std-gnu99.patch | 42 ----------------------
>  ...le-fix-HOSTCFLAGS-with-CROSS_BUILD_TOOLS.patch} |  0
>  package/uboot-tools/uboot-tools.hash               |  2 +-
>  package/uboot-tools/uboot-tools.mk                 |  2 +-
>  5 files changed, 8 insertions(+), 48 deletions(-)
>  delete mode 100644 package/uboot-tools/0004-tools-Makefile-build-host-tools-with-std-gnu99.patch
>  rename package/uboot-tools/{0005-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUILD_TOOLS.patch => 0004-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUILD_TOOLS.patch} (100%)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
