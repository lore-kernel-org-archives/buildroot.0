From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 May 2016 16:49:13 -0300
Subject: [Buildroot] [PATCH] wireless-regdb: bump to version 2016.05.02
Message-ID: <1462304953-17208-1-git-send-email-gustavo@zacarias.com.ar>
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
index 8685020..44b2e41 100644
--- a/package/wireless-regdb/wireless-regdb.hash
+++ b/package/wireless-regdb/wireless-regdb.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/software/network/wireless-regdb/sha256sums.asc
-sha256	ce957b7f4fe103d8fb4d160d3b39825ad0b0da639b7453d4022d71415b6c9f9f	wireless-regdb-2016.02.08.tar.xz
+sha256	c9674c988a944105148091b74c05c6fa6bd9611b9bbab6b81abfb5e5387bc61e	wireless-regdb-2016.05.02.tar.xz
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index 083ab00..49bcb32 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRELESS_REGDB_VERSION = 2016.02.08
+WIRELESS_REGDB_VERSION = 2016.05.02
 WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
 WIRELESS_REGDB_SITE = http://kernel.org/pub/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
-- 
2.7.3
