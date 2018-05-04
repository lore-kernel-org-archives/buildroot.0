From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  4 May 2018 22:09:17 +0200
Subject: [Buildroot] [PATCH 1/1] minissdpd: bump to version 1.5.20180223
Message-ID: <20180504200917.11905-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update hash of license file (update in year)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/minissdpd/minissdpd.hash | 4 ++--
 package/minissdpd/minissdpd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/minissdpd/minissdpd.hash b/package/minissdpd/minissdpd.hash
index dd166775be..a1729d6855 100644
--- a/package/minissdpd/minissdpd.hash
+++ b/package/minissdpd/minissdpd.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	dfd637b185731e1acb412a86faa9718eb93c04ca08280541a6d22d14d1fb890f	minissdpd-1.5.tar.gz
-sha256	c432d6ee83deb6a0c105a2c3ebd11e3855ab91498b0847a8657e68ce8e4491a5	LICENSE
+sha256	bba94209b40755b32022db9450ee3f4446896a16912915fbb292001a7f8087b0	minissdpd-1.5.20180223.tar.gz
+sha256	8801b32567ec20015c7d31668602a3a7f4a4785b7e17468360146b6003713cba	LICENSE
diff --git a/package/minissdpd/minissdpd.mk b/package/minissdpd/minissdpd.mk
index f3f383b17f..31d942eac5 100644
--- a/package/minissdpd/minissdpd.mk
+++ b/package/minissdpd/minissdpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINISSDPD_VERSION = 1.5
+MINISSDPD_VERSION = 1.5.20180223
 MINISSDPD_SITE = http://miniupnp.free.fr/files
 MINISSDPD_LICENSE = BSD-3-Clause
 MINISSDPD_LICENSE_FILES = LICENSE
-- 
2.14.1
