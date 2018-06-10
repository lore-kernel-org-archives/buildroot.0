From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 Jun 2018 11:30:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/wireless-regdb: bump version to
 2018.05.31
Message-ID: <20180610093048.29478-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added license hash, updated project URL, old site is dead.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/wireless-regdb/Config.in           | 2 +-
 package/wireless-regdb/wireless-regdb.hash | 4 +++-
 package/wireless-regdb/wireless-regdb.mk   | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/wireless-regdb/Config.in b/package/wireless-regdb/Config.in
index d9c7b8d2d1..0c9896deb9 100644
--- a/package/wireless-regdb/Config.in
+++ b/package/wireless-regdb/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_WIRELESS_REGDB
 	  Wireless regulatory database for CRDA. The database lists the
 	  allowed radio frequencies for each local jurisdiction.
 
-	  http://linuxwireless.org/en/developers/Regulatory
+	  https://wireless.wiki.kernel.org/en/developers/regulatory/wireless-regdb
diff --git a/package/wireless-regdb/wireless-regdb.hash b/package/wireless-regdb/wireless-regdb.hash
index 4163609d17..65ae735cb5 100644
--- a/package/wireless-regdb/wireless-regdb.hash
+++ b/package/wireless-regdb/wireless-regdb.hash
@@ -1,2 +1,4 @@
 # From https://www.kernel.org/pub/software/network/wireless-regdb/sha256sums.asc
-sha256	371eafa3b26ece916ef83aca02c4bed2e54099eb5b8c6d22d3a4358dce6535b9	wireless-regdb-2017.03.07.tar.xz
+sha256 e1dfbc3b97771373077f430c3c05082fae883145b37db5b2cfd12c56676fbe7b  wireless-regdb-2018.05.31.tar.xz
+# Locally computed
+sha256 678b0df753c86198fc496d1f1033429bbd57f101472132ee7eaaf9f5e0a7fae1  LICENSE
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index 9d7a375461..e9283a00e2 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRELESS_REGDB_VERSION = 2017.03.07
+WIRELESS_REGDB_VERSION = 2018.05.31
 WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
 WIRELESS_REGDB_SITE = http://kernel.org/pub/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
-- 
2.17.1
