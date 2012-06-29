From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 29 Jun 2012 07:43:00 -0300
Subject: [Buildroot] [PATCH] pciutils: bump to version 3.1.10
Message-ID: <1340966580-21356-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pciutils/pciutils.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index d1c8db5..a43fb95 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-PCIUTILS_VERSION = 3.1.9
+PCIUTILS_VERSION = 3.1.10
 PCIUTILS_SITE = ftp://atrey.karlin.mff.cuni.cz/pub/linux/pci
 PCIUTILS_INSTALL_STAGING = YES
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-- 
1.7.8.6
