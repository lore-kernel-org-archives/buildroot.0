From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Apr 2021 22:45:06 +0200
Subject: [Buildroot] [git commit] package/luv: bump to version 1.40.0-0
Message-ID: <20210419202513.957B283AE1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=718b6c224aa8bb400ab0f24d89ff2719fa6ef00a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also fix spacing to use 2 spaces in the hash file.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luv/luv.hash | 4 ++--
 package/luv/luv.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luv/luv.hash b/package/luv/luv.hash
index 7e902bd081..58385cf4f4 100644
--- a/package/luv/luv.hash
+++ b/package/luv/luv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 f2e7eb372574f25c6978c1dc74280d22efdcd7df2dda4a286c7fe7dceda26445  luv-1.36.0-0.tar.gz
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
+sha256  24473a081c3928eec2a352369cbafda97059574f4a4276861274473e7c7d17a0  luv-1.40.0-0.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/luv/luv.mk b/package/luv/luv.mk
index a63baf3228..08968c3f90 100644
--- a/package/luv/luv.mk
+++ b/package/luv/luv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUV_VERSION = 1.36.0-0
+LUV_VERSION = 1.40.0-0
 LUV_SITE = https://github.com/luvit/luv/releases/download/$(LUV_VERSION)
 LUV_LICENSE = Apache-2.0
 LUV_LICENSE_FILES = LICENSE.txt
