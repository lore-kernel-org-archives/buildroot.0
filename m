From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Jul 2019 15:46:38 +0200
Subject: [Buildroot] [PATCH] package/uboot-tools: bump to version 2019.07
In-Reply-To: <1562620109-22335-1-git-send-email-pjtexier@koncepto.io>
References: <1562620109-22335-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <20190714154638.03f5df2e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  8 Jul 2019 23:08:29 +0200
Pierre-Jean Texier <pjtexier@koncepto.io> wrote:

> - Bump to version 2019.07.
> - remove the patches that have been upstreamed.
> 
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
>  .../0003-Make-FIT-support-really-optional.patch    | 101 ---------------------
>  ...ile-fix-HOSTCFLAGS-with-CROSS_BUILD_TOOLS.patch |  28 ------
>  package/uboot-tools/uboot-tools.hash               |   2 +-
>  package/uboot-tools/uboot-tools.mk                 |   2 +-
>  4 files changed, 2 insertions(+), 131 deletions(-)
>  delete mode 100644 package/uboot-tools/0003-Make-FIT-support-really-optional.patch
>  delete mode 100644 package/uboot-tools/0004-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUILD_TOOLS.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
