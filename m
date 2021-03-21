From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 21 Mar 2021 10:30:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/gvfs: add GVFS_CPE_ID_VENDOR
Message-ID: <20210321093000.533877-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:gnome:gvfs is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnome%3Agvfs

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gvfs/gvfs.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index c5104e8dbf..fc77e8e1aa 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -19,6 +19,7 @@ GVFS_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES)
 GVFS_LICENSE = LGPL-2.0+
 GVFS_LICENSE_FILES = COPYING
+GVFS_CPE_ID_VENDOR = gnome
 
 GVFS_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
-- 
2.30.1
