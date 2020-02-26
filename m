From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Feb 2020 21:19:31 +0100
Subject: [Buildroot] [git commit branch/next] package/fswebcam: bump to
 latest git version
Message-ID: <20200226202519.751D18EA8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3601a7e08a7c0d0c3520e263b6b5cbf509808a22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump to latest git version.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fswebcam/fswebcam.hash | 2 +-
 package/fswebcam/fswebcam.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/fswebcam/fswebcam.hash b/package/fswebcam/fswebcam.hash
index 28f604547c..3964b21e92 100644
--- a/package/fswebcam/fswebcam.hash
+++ b/package/fswebcam/fswebcam.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  444d6a8a82102e09e935540c64a731021de36db03e1e74181f41ca6f39aa6474  fswebcam-20140113.tar.xz
+sha256  fe178a0f37ee203103eceaaf9a81a8669edb49923250e8a2ec7459543a8175b0  fswebcam-9a995d6a5369ddd158e352766e015dae20982318.tar.gz
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/fswebcam/fswebcam.mk b/package/fswebcam/fswebcam.mk
index 8f823f4d04..5887c0b92b 100644
--- a/package/fswebcam/fswebcam.mk
+++ b/package/fswebcam/fswebcam.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-FSWEBCAM_VERSION = 20140113
-FSWEBCAM_SOURCE = fswebcam-$(FSWEBCAM_VERSION).tar.xz
-FSWEBCAM_SITE = http://www.firestorm.cx/fswebcam/files
+FSWEBCAM_VERSION = 9a995d6a5369ddd158e352766e015dae20982318
+FSWEBCAM_SITE = $(call github,fsphil,fswebcam,$(FSWEBCAM_VERSION))
 FSWEBCAM_LICENSE = GPL-2.0
 FSWEBCAM_LICENSE_FILES = LICENSE
 
