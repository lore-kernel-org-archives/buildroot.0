From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 16 Sep 2017 16:26:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/openntpd: bump version to 6.2p2
Message-ID: <20170916142647.24935-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/openntpd/openntpd.hash | 4 ++--
 package/openntpd/openntpd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openntpd/openntpd.hash b/package/openntpd/openntpd.hash
index 7f5d3e3f63..1a73e8dc0b 100644
--- a/package/openntpd/openntpd.hash
+++ b/package/openntpd/openntpd.hash
@@ -1,2 +1,2 @@
-# From http://www.openntpd.org/txt/release-6.0p1.txt
-sha256	b1ab80094788912adb12b33cb1f251cc58db39294c1b5c6376972f5f7ba577e8	openntpd-6.0p1.tar.gz
+# Locally computed
+sha256 5808a4137b008a4db20907e1a482f474734b120f254e3c5feb90db15e0820fb2  openntpd-6.2p2.tar.gz
diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
index 021a39355e..0c39ec5dd6 100644
--- a/package/openntpd/openntpd.mk
+++ b/package/openntpd/openntpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENNTPD_VERSION = 6.0p1
+OPENNTPD_VERSION = 6.2p2
 OPENNTPD_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenNTPD
 OPENNTPD_LICENSE = MIT-like, BSD-2-Clause, BSD-3-Clause
 OPENNTPD_LICENSE_FILES = COPYING
-- 
2.11.0
