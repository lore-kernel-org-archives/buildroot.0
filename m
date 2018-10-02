From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  2 Oct 2018 22:05:01 +0200
Subject: [Buildroot] [PATCH v1 1/2] wireless-regdb: bump version to
 2018.09.07
Message-ID: <20181002200502.19372-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/wireless-regdb/wireless-regdb.hash | 2 +-
 package/wireless-regdb/wireless-regdb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wireless-regdb/wireless-regdb.hash b/package/wireless-regdb/wireless-regdb.hash
index 65ae735cb5..aa035d0ef5 100644
--- a/package/wireless-regdb/wireless-regdb.hash
+++ b/package/wireless-regdb/wireless-regdb.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/network/wireless-regdb/sha256sums.asc
-sha256 e1dfbc3b97771373077f430c3c05082fae883145b37db5b2cfd12c56676fbe7b  wireless-regdb-2018.05.31.tar.xz
+sha256 a36b8147f1a3e98e1fd44321a4b8d7ad2f03cac98cdf527ccb1693342f08d65a  wireless-regdb-2018.09.07.tar.xz
 # Locally computed
 sha256 678b0df753c86198fc496d1f1033429bbd57f101472132ee7eaaf9f5e0a7fae1  LICENSE
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index 829374edcf..fcbba055ac 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRELESS_REGDB_VERSION = 2018.05.31
+WIRELESS_REGDB_VERSION = 2018.09.07
 WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
 WIRELESS_REGDB_SITE = http://kernel.org/pub/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
-- 
2.19.0
