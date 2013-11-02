From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Nov 2013 14:42:59 +0100
Subject: [Buildroot] [git commit] uboot-tools: fix license issues
Message-ID: <20131104211055.09B399BC97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4feba5d62b8bd60732f28bfb43297c395eedd3c2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix license directory and filename change, fixes:
http://autobuild.buildroot.net/results/8c9/8c94c81fe74399c854de335329cf4942f8356fbe/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uboot-tools/uboot-tools.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index e19372a..73e1d32 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -8,7 +8,7 @@ UBOOT_TOOLS_VERSION = 2013.10
 UBOOT_TOOLS_SOURCE  = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE    = ftp://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPLv2+
-UBOOT_TOOLS_LICENSE_FILES = COPYING
+UBOOT_TOOLS_LICENSE_FILES = Licenses/gpl-2.0.txt
 
 define UBOOT_TOOLS_BUILD_CMDS
 	$(MAKE) -C $(@D) 			\
