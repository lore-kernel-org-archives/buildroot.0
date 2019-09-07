From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Sep 2019 23:15:55 +0200
Subject: [Buildroot] [git commit] package/libglfw: bump version to 3.3
Message-ID: <20190907211229.5ED678D3E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1edd9fa36b0ca2245cde54c42516e51f3d90d872
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License file was renamed and whitespace was removed:
https://github.com/glfw/glfw/commits/master/LICENSE.md

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libglfw/libglfw.hash | 4 ++--
 package/libglfw/libglfw.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libglfw/libglfw.hash b/package/libglfw/libglfw.hash
index 39d6c26139..6796b81368 100644
--- a/package/libglfw/libglfw.hash
+++ b/package/libglfw/libglfw.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 e10f0de1384d75e6fc210c53e91843f6110d6c4f3afbfb588130713c2f9d8fe8  libglfw-3.2.1.tar.gz
-sha256 8d85c2fc8de8f3b8c0906e317a2d6423268ef4291a3682d94ac910f65389a441  COPYING.txt
+sha256 81bf5fde487676a8af55cb317830703086bb534c53968d71936e7b48ee5a0f3e  libglfw-3.3.tar.gz
+sha256 8ea14fdc7efee7fe53c79101b97049bd547dc6686cfa05df4f0686146a561423  LICENSE.md
diff --git a/package/libglfw/libglfw.mk b/package/libglfw/libglfw.mk
index b6dde2e9d6..aac5b1799d 100644
--- a/package/libglfw/libglfw.mk
+++ b/package/libglfw/libglfw.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-LIBGLFW_VERSION = 3.2.1
+LIBGLFW_VERSION = 3.3
 LIBGLFW_SITE = $(call github,glfw,glfw,$(LIBGLFW_VERSION))
 LIBGLFW_INSTALL_STAGING = YES
 LIBGLFW_DEPENDENCIES = libgl xlib_libXcursor xlib_libXext \
 	xlib_libXinerama xlib_libXrandr
 LIBGLFW_LICENSE = Zlib
-LIBGLFW_LICENSE_FILES = COPYING.txt
+LIBGLFW_LICENSE_FILES = LICENSE.md
 
 LIBGLFW_CONF_OPTS += \
 	-DGLFW_BUILD_EXAMPLES=OFF \
