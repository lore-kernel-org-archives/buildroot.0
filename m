From: Heiko Abraham <abrahamh@web.de>
Date: Sat, 24 May 2014 15:49:43 +0200
Subject: [Buildroot] [PATCH] hwdata: add license information
Message-ID: <1400939383-10495-1-git-send-email-abrahamh@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add missing license info and file for package 'hwdata'
---
 package/hwdata/hwdata.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index 501baec..d1044c4 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -8,6 +8,8 @@ HWDATA_VERSION = 0.230
 HWDATA_SOURCE = hwdata_$(HWDATA_VERSION).orig.tar.gz
 HWDATA_PATCH = hwdata_$(HWDATA_VERSION)-1.diff.gz
 HWDATA_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/h/hwdata/
+HWDATA_LICENSE = GPLv2 XFree86_1.0_license
+HWDATA_LICENSE_FILES = COPYING LICENSE
 
 define HWDATA_INSTALL_TARGET_CMDS
 	install -D -m 644 $(@D)/pci.ids $(TARGET_DIR)/usr/share/hwdata/pci.ids
-- 
1.8.5.2 (Apple Git-48)
