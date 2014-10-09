From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  9 Oct 2014 20:32:37 -0300
Subject: [Buildroot] [PATCH 1/2] wireless-regdb: bump to version 2014.10.07
Message-ID: <1412897558-31636-1-git-send-email-gustavo@zacarias.com.ar>
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
index dd9189e..d234e14 100644
--- a/package/wireless-regdb/wireless-regdb.hash
+++ b/package/wireless-regdb/wireless-regdb.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/software/network/wireless-regdb/sha256sums.asc
-sha256	fbebc9217ff19a3480ec24c61bafd0ba771967d6c895845591b0d231c9ab7dc6	wireless-regdb-2014.06.13.tar.xz
+sha256	f362e3f6cf616c3120c3104a6d791b7b1145019bb117514844d78cf6655caa93	wireless-regdb-2014.10.07.tar.xz
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index f4d3195..cb8aaf8 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRELESS_REGDB_VERSION = 2014.06.13
+WIRELESS_REGDB_VERSION = 2014.10.07
 WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
 WIRELESS_REGDB_SITE = http://kernel.org/pub/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
-- 
2.0.4
