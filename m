From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 13 Jul 2017 22:22:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/libglfw: bump version to 3.2.1
Message-ID: <20170713202229.14109-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

License file was renamed:
https://github.com/glfw/glfw/commit/e2ce3026a0ae01ecfeefc5af0b2f834d560303d7

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libglfw/libglfw.hash | 2 +-
 package/libglfw/libglfw.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libglfw/libglfw.hash b/package/libglfw/libglfw.hash
index 3226aad22..c0ad2af1c 100644
--- a/package/libglfw/libglfw.hash
+++ b/package/libglfw/libglfw.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	6ac642087682aaf7f8397761a41a99042b2c656498217a1c63ba9706d1eef122	libglfw-3.1.2.tar.gz
+sha256 e10f0de1384d75e6fc210c53e91843f6110d6c4f3afbfb588130713c2f9d8fe8  libglfw-3.2.1.tar.gz
diff --git a/package/libglfw/libglfw.mk b/package/libglfw/libglfw.mk
index 1e4240435..c288a8ff5 100644
--- a/package/libglfw/libglfw.mk
+++ b/package/libglfw/libglfw.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-LIBGLFW_VERSION = 3.1.2
+LIBGLFW_VERSION = 3.2.1
 LIBGLFW_SITE = $(call github,glfw,glfw,$(LIBGLFW_VERSION))
 LIBGLFW_INSTALL_STAGING = YES
 LIBGLFW_DEPENDENCIES = libgl xlib_libXcursor xlib_libXext \
 	xlib_libXinerama xlib_libXrandr
 LIBGLFW_LICENSE = Zlib
-LIBGLFW_LICENSE_FILES = COPYING.txt
+LIBGLFW_LICENSE_FILES = LICENSE.md
 
 LIBGLFW_CONF_OPTS += \
 	-DGLFW_BUILD_EXAMPLES=OFF \
-- 
2.11.0
