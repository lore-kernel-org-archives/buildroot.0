From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 11 Jun 2016 16:39:43 -0300
Subject: [Buildroot] [PATCH] wireless-regdb: bump to version 2016.06.10
Message-ID: <1465673983-27652-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wireless-regdb/wireless-regdb.hash | 2 +-
 package/wireless-regdb/wireless-regdb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wireless-regdb/wireless-regdb.hash b/package/wireless-regdb/wireless-regdb.hash
index 44b2e41..b8ca2e7 100644
--- a/package/wireless-regdb/wireless-regdb.hash
+++ b/package/wireless-regdb/wireless-regdb.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/software/network/wireless-regdb/sha256sums.asc
-sha256	c9674c988a944105148091b74c05c6fa6bd9611b9bbab6b81abfb5e5387bc61e	wireless-regdb-2016.05.02.tar.xz
+sha256	cfedf1c3521b3c8f32602f25ed796e96e687c3441a00e7c050fedf7fd4f1b8b7	wireless-regdb-2016.06.10.tar.xz
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index 49bcb32..6ad4258 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRELESS_REGDB_VERSION = 2016.05.02
+WIRELESS_REGDB_VERSION = 2016.06.10
 WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
 WIRELESS_REGDB_SITE = http://kernel.org/pub/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
-- 
2.7.3
