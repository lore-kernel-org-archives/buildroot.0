From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 25 Jun 2020 21:24:45 +0200
Subject: [Buildroot] [PATCH v1] package/wireless-regdb: bump version to
 2020.04.29
Message-ID: <20200625192445.18349-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/wireless-regdb/wireless-regdb.hash | 4 ++--
 package/wireless-regdb/wireless-regdb.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireless-regdb/wireless-regdb.hash b/package/wireless-regdb/wireless-regdb.hash
index d6cb72ee79..9271073fd9 100644
--- a/package/wireless-regdb/wireless-regdb.hash
+++ b/package/wireless-regdb/wireless-regdb.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/network/wireless-regdb/sha256sums.asc
-sha256 cd917ed86b63ce8d93947979f1f18948f03a4ac0ad89ec25227b36ac00dc54bf  wireless-regdb-2019.06.03.tar.xz
+sha256  89fd031aed5977c219a71501e144375a10e7c90d1005d5d086ea7972886a2c7a  wireless-regdb-2020.04.29.tar.xz
 # Locally computed
-sha256 678b0df753c86198fc496d1f1033429bbd57f101472132ee7eaaf9f5e0a7fae1  LICENSE
+sha256  678b0df753c86198fc496d1f1033429bbd57f101472132ee7eaaf9f5e0a7fae1  LICENSE
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index 31b62e36e1..52a0e0cffc 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRELESS_REGDB_VERSION = 2019.06.03
+WIRELESS_REGDB_VERSION = 2020.04.29
 WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
 WIRELESS_REGDB_SITE = $(BR2_KERNEL_MIRROR)/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
-- 
2.27.0
