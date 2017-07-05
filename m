From: Fabio Estevam <fabio.estevam@nxp.com>
Date: Wed, 5 Jul 2017 10:49:42 -0300
Subject: [Buildroot] [PATCH] pciutils: bump to version 3.5.5
Message-ID: <1499262582-20744-1-git-send-email-fabio.estevam@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <festevam@gmail.com>

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 package/pciutils/pciutils.hash | 2 +-
 package/pciutils/pciutils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pciutils/pciutils.hash b/package/pciutils/pciutils.hash
index 2572c35..80d7041 100644
--- a/package/pciutils/pciutils.hash
+++ b/package/pciutils/pciutils.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/software/utils/pciutils/sha256sums.asc
-sha256	3a99141a9f40528d0a0035665a06dc37ddb1ae341658e51b50a76ecf86235efc	pciutils-3.5.2.tar.xz
+sha256	1d62f8fa192f90e61c35a6fc15ff3cb9a7a792f782407acc42ef67817c5939f5	pciutils-3.5.5.tar.xz
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 5b32eed..2dd5771 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCIUTILS_VERSION = 3.5.2
+PCIUTILS_VERSION = 3.5.5
 PCIUTILS_SITE = $(BR2_KERNEL_MIRROR)/software/utils/pciutils
 PCIUTILS_SOURCE = pciutils-$(PCIUTILS_VERSION).tar.xz
 PCIUTILS_INSTALL_STAGING = YES
-- 
2.7.4
