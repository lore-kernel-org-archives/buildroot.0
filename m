From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 31 Jan 2016 00:24:13 +0100
Subject: [Buildroot] [PATCH 1/1] package/knock: bump version
Message-ID: <1454196253-15434-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/knock/knock.hash | 2 +-
 package/knock/knock.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/knock/knock.hash b/package/knock/knock.hash
index ae152db..3599e43 100644
--- a/package/knock/knock.hash
+++ b/package/knock/knock.hash
@@ -1,2 +1,2 @@
 # locally computed hash
-sha256 9938479c321066424f74c61f6bee46dfd355a828263dc89561a1ece3f56578a4 knock-0.7.tar.gz
+sha256	940a8de61b4b3530560805c3b9310a077c28c99173c2ccb07ff96720b0e93c58	knock-258a27e5a47809f97c2b9f2751a88c2f94aae891.tar.gz
diff --git a/package/knock/knock.mk b/package/knock/knock.mk
index 28db1eb..2ab8d1b 100644
--- a/package/knock/knock.mk
+++ b/package/knock/knock.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-KNOCK_VERSION = 0.7
-KNOCK_SITE = http://www.zeroflux.org/proj/knock/files
+KNOCK_VERSION = 258a27e5a47809f97c2b9f2751a88c2f94aae891
+KNOCK_SITE = $(call github,jvinet,knock,$(KNOCK_VERSION))
+KNOCK_AUTORECONF = YES
 KNOCK_LICENSE = GPLv2+
 KNOCK_LICENSE_FILES = COPYING
 KNOCK_DEPENDENCIES = libpcap
-- 
2.7.0.rc3
