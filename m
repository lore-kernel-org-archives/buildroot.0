From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 17:47:08 +0200
Subject: [Buildroot] [git commit] package/gptfdisk: bump to version 1.0.4
Message-ID: <20190622154813.00DAA8293F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=417c23514301b3e4e24497580b05588ca9449230
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gptfdisk/gptfdisk.hash | 9 +++++----
 package/gptfdisk/gptfdisk.mk   | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/gptfdisk/gptfdisk.hash b/package/gptfdisk/gptfdisk.hash
index d55797c05a..0e52d9917f 100644
--- a/package/gptfdisk/gptfdisk.hash
+++ b/package/gptfdisk/gptfdisk.hash
@@ -1,5 +1,6 @@
-# From http://sourceforge.net/projects/gptfdisk/files/gptfdisk/1.0.3/
-md5 07b625a583b66c8c5840be5923f3e3fe  gptfdisk-1.0.3.tar.gz
-sha1 9a74bbe7805d562316e92417f71e4b03155308e6  gptfdisk-1.0.3.tar.gz
+# From http://sourceforge.net/projects/gptfdisk/files/gptfdisk/1.0.4/
+md5 5ecc3c44913bb6b53d3708d1ac7ac295  gptfdisk-1.0.4.tar.gz
+sha1 4c2d60bedd4eac1014727e3b126de96966205410  gptfdisk-1.0.4.tar.gz
 # Locally computed
-sha256 89fd5aec35c409d610a36cb49c65b442058565ed84042f767bba614b8fc91b5c  gptfdisk-1.0.3.tar.gz
+sha256 b663391a6876f19a3cd901d862423a16e2b5ceaa2f4a3b9bb681e64b9c7ba78d  gptfdisk-1.0.4.tar.gz
+sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
index b669e22aa8..afe4a72886 100644
--- a/package/gptfdisk/gptfdisk.mk
+++ b/package/gptfdisk/gptfdisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GPTFDISK_VERSION = 1.0.3
+GPTFDISK_VERSION = 1.0.4
 GPTFDISK_SITE = http://downloads.sourceforge.net/sourceforge/gptfdisk
 GPTFDISK_LICENSE = GPL-2.0+
 GPTFDISK_LICENSE_FILES = COPYING
