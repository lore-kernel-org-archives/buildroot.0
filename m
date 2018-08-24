From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Fri, 24 Aug 2018 15:51:45 +0200
Subject: [Buildroot] [PATCH] package/sam-ba: bump to version 2.18
Message-ID: <1535118705-4279-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps the sam-ba package to version 2.18 and
adds hashes for license files.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/sam-ba/sam-ba.hash | 7 +++++--
 package/sam-ba/sam-ba.mk   | 6 +++---
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/sam-ba/sam-ba.hash b/package/sam-ba/sam-ba.hash
index 61feb32..ae1fb5e 100644
--- a/package/sam-ba/sam-ba.hash
+++ b/package/sam-ba/sam-ba.hash
@@ -1,2 +1,5 @@
-# Locally calculated
-sha256	  302734f53e471b5d1a292c9af937262f4fd766ec47ebfea62439761e7c1cd9d7	sam-ba_2.16_linux.zip
+# sha256 locally computed
+sha256  40d5e66b77261d83780fe2b38633b8d9f5c9a26718c2b9de1d5877e853e35e96  sam-ba_cdc_linux.zip
+sha256  f9cac240acadbfd8f4f1c0d65132f85427384697bd6337da6444c531138d56ee  doc/license.txt
+sha256  255564ff8953ea95c11a4ab1d56f1edf332298faad209ca80daf745c7ed95124  tcl_lib/boards.tcl
+sha256  74ae62858139cb4e18acc3448483be80ea6b36fdb87260b665f43762ca354ede  applets/sam4c/libraries/libchip_sam4c/include/sam4c/sam4c32e-1.h
diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
index 0d36b0d..4950558 100644
--- a/package/sam-ba/sam-ba.mk
+++ b/package/sam-ba/sam-ba.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SAM_BA_SITE = http://www.atmel.com/dyn/resources/prod_documents
-SAM_BA_VERSION = 2.16
-SAM_BA_SOURCE = sam-ba_$(SAM_BA_VERSION)_linux.zip
+SAM_BA_SITE = http://ww1.microchip.com/downloads/en/DeviceDoc
+SAM_BA_VERSION = 2.18
+SAM_BA_SOURCE = sam-ba_cdc_linux.zip
 SAM_BA_LICENSE = SAM-BA license (sam-ba executable), \
 		BSD-2-Clause like, BSD-4-Clause (TCL and applets code)
 SAM_BA_LICENSE_FILES = doc/license.txt tcl_lib/boards.tcl \
-- 
2.7.4
