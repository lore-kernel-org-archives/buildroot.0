From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 10 Nov 2014 10:31:42 -0300
Subject: [Buildroot] [PATCH] wireless-regdb: bump to version 2014.11.07
Message-ID: <1415626302-14068-1-git-send-email-gustavo@zacarias.com.ar>
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
index d234e14..3f19793 100644
--- a/package/wireless-regdb/wireless-regdb.hash
+++ b/package/wireless-regdb/wireless-regdb.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/software/network/wireless-regdb/sha256sums.asc
-sha256	f362e3f6cf616c3120c3104a6d791b7b1145019bb117514844d78cf6655caa93	wireless-regdb-2014.10.07.tar.xz
+sha256	4a6861266026c37d1a6b1bc76b863d731765169465999c2a0028103ba4173beb	wireless-regdb-2014.11.07.tar.xz
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index cb8aaf8..f37b5a6 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRELESS_REGDB_VERSION = 2014.10.07
+WIRELESS_REGDB_VERSION = 2014.11.07
 WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
 WIRELESS_REGDB_SITE = http://kernel.org/pub/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
-- 
2.0.4
