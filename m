From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 29 Jul 2015 08:21:48 -0300
Subject: [Buildroot] [PATCH] wireless-regdb: bump to version 2015.07.20
Message-ID: <1438168908-24743-1-git-send-email-gustavo@zacarias.com.ar>
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
index 250f4d8..f02c1c3 100644
--- a/package/wireless-regdb/wireless-regdb.hash
+++ b/package/wireless-regdb/wireless-regdb.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/software/network/wireless-regdb/sha256sums.asc
-sha256	69306cfd5ae97ae5f905e0e1e167b6ac8d28e49b58880621ad0024b59f4f8564	wireless-regdb-2015.06.05.tar.xz
+sha256	edac88b58f23f0a7d73aa2b21520d04019f30e3e604b0a60ca0a6af16044bdf2	wireless-regdb-2015.07.20.tar.xz
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index 92068a6..fe76882 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRELESS_REGDB_VERSION = 2015.06.05
+WIRELESS_REGDB_VERSION = 2015.07.20
 WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
 WIRELESS_REGDB_SITE = http://kernel.org/pub/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
-- 
2.3.6
