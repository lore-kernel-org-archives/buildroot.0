From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Jul 2017 11:39:33 +0200
Subject: [Buildroot] [git commit] package/libglfw: bump version to 3.2.1
Message-ID: <20170715093758.60D7781DF4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1fe23a9b2f0d89e2bdad4773152f119dc373e41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libglfw/libglfw.hash | 2 +-
 package/libglfw/libglfw.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libglfw/libglfw.hash b/package/libglfw/libglfw.hash
index 3226aad..c0ad2af 100644
--- a/package/libglfw/libglfw.hash
+++ b/package/libglfw/libglfw.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	6ac642087682aaf7f8397761a41a99042b2c656498217a1c63ba9706d1eef122	libglfw-3.1.2.tar.gz
+sha256 e10f0de1384d75e6fc210c53e91843f6110d6c4f3afbfb588130713c2f9d8fe8  libglfw-3.2.1.tar.gz
diff --git a/package/libglfw/libglfw.mk b/package/libglfw/libglfw.mk
index 1e42404..b6dde2e 100644
--- a/package/libglfw/libglfw.mk
+++ b/package/libglfw/libglfw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGLFW_VERSION = 3.1.2
+LIBGLFW_VERSION = 3.2.1
 LIBGLFW_SITE = $(call github,glfw,glfw,$(LIBGLFW_VERSION))
 LIBGLFW_INSTALL_STAGING = YES
 LIBGLFW_DEPENDENCIES = libgl xlib_libXcursor xlib_libXext \
