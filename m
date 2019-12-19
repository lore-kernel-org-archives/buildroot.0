From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 19 Dec 2019 23:01:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/minissdpd: bump to version
 1.5-20190824
Message-ID: <20191219220120.1280847-1-fontaine.fabrice@gmail.com>
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
index a1729d6855..695f652b32 100644
--- a/package/minissdpd/minissdpd.hash
+++ b/package/minissdpd/minissdpd.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	bba94209b40755b32022db9450ee3f4446896a16912915fbb292001a7f8087b0	minissdpd-1.5.20180223.tar.gz
-sha256	8801b32567ec20015c7d31668602a3a7f4a4785b7e17468360146b6003713cba	LICENSE
+sha256	07feea19dfa7d79d144e0f4a19a859a21cdb58445b77dc2d6222f2434e0ac92c	minissdpd-1.5.20190824.tar.gz
+sha256	00c8368dd1574b025df65f24f61c32d1297ff9b6dc695fda964b1b1efc7a53d3	LICENSE
diff --git a/package/minissdpd/minissdpd.mk b/package/minissdpd/minissdpd.mk
index d97eece680..55973752c0 100644
--- a/package/minissdpd/minissdpd.mk
+++ b/package/minissdpd/minissdpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINISSDPD_VERSION = 1.5.20180223
+MINISSDPD_VERSION = 1.5.20190824
 MINISSDPD_SITE = http://miniupnp.free.fr/files
 MINISSDPD_LICENSE = BSD-3-Clause
 MINISSDPD_LICENSE_FILES = LICENSE
-- 
2.24.0
