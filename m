From: Eugen Hristev <eugen.hristev@microchip.com>
Date: Fri, 21 Feb 2020 15:39:02 +0200
Subject: [Buildroot] [PATCH] package/fswebcam: bump to latest git version
Message-ID: <20200221133902.21622-1-eugen.hristev@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to latest git version.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---

Hello,

There has not been an official release of fswebcam, but, there are several
patches in there which I really need for development.
So, can we bump this package to latest git rev ?
Or, how can we proceed?
This patch is more of a RFC... but, would be useful.
Let me know if another approach is better.
Thanks,

Eugen

 package/fswebcam/fswebcam.hash | 1 +
 package/fswebcam/fswebcam.mk   | 6 +++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/fswebcam/fswebcam.hash b/package/fswebcam/fswebcam.hash
index 28f604547c..87a688d9e7 100644
--- a/package/fswebcam/fswebcam.hash
+++ b/package/fswebcam/fswebcam.hash
@@ -1,3 +1,4 @@
 # Locally calculated
 sha256  444d6a8a82102e09e935540c64a731021de36db03e1e74181f41ca6f39aa6474  fswebcam-20140113.tar.xz
+sha256  64b0216ebb8f50eb5eff4a005d659fe8c77bc899dc7f297e08b208f312e044c8  fswebcam-9a995d6a5369ddd158e352766e015dae20982318.tar.gz
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/fswebcam/fswebcam.mk b/package/fswebcam/fswebcam.mk
index 8f823f4d04..b1b7e183da 100644
--- a/package/fswebcam/fswebcam.mk
+++ b/package/fswebcam/fswebcam.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-FSWEBCAM_VERSION = 20140113
-FSWEBCAM_SOURCE = fswebcam-$(FSWEBCAM_VERSION).tar.xz
-FSWEBCAM_SITE = http://www.firestorm.cx/fswebcam/files
+FSWEBCAM_VERSION = 9a995d6a5369ddd158e352766e015dae20982318
+FSWEBCAM_SITE = https://github.com/fsphil/fswebcam.git
+FSWEBCAM_SITE_METHOD = git
 FSWEBCAM_LICENSE = GPL-2.0
 FSWEBCAM_LICENSE_FILES = LICENSE
 
-- 
2.20.1
