From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Mar 2017 22:19:07 +0100
Subject: [Buildroot] [git commit] wireless-regdb: bump to version 2017.03.07
Message-ID: <20170309211941.56B1D82564@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=391d10e55e84854f8a1a33f8c04986fda7828ba1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wireless-regdb/wireless-regdb.hash | 2 +-
 package/wireless-regdb/wireless-regdb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wireless-regdb/wireless-regdb.hash b/package/wireless-regdb/wireless-regdb.hash
index b8ca2e7..4163609 100644
--- a/package/wireless-regdb/wireless-regdb.hash
+++ b/package/wireless-regdb/wireless-regdb.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/software/network/wireless-regdb/sha256sums.asc
-sha256	cfedf1c3521b3c8f32602f25ed796e96e687c3441a00e7c050fedf7fd4f1b8b7	wireless-regdb-2016.06.10.tar.xz
+sha256	371eafa3b26ece916ef83aca02c4bed2e54099eb5b8c6d22d3a4358dce6535b9	wireless-regdb-2017.03.07.tar.xz
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index 6ad4258..9d7a375 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRELESS_REGDB_VERSION = 2016.06.10
+WIRELESS_REGDB_VERSION = 2017.03.07
 WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
 WIRELESS_REGDB_SITE = http://kernel.org/pub/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
