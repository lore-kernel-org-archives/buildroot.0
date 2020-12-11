From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Dec 2020 10:47:18 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/wireless-regdb:
 bump version to 2020.04.29
Message-ID: <20201211100839.C9CCB85F1B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09074290f009696bd2edd5027e54b18fa179816f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c8175568e716d40b10e30df919407e1c6c1843b3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
