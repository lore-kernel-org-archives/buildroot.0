From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 Sep 2015 10:47:11 +0200
Subject: [Buildroot] [git commit] package/{mesa3d,
	mesa3d-headers}: bump version to 10.6.6
Message-ID: <20150906092939.1671081DF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4613cdbc1c06d03a1c0ceb2c5665c435b5de152e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d-headers/mesa3d-headers.mk |    2 +-
 package/mesa3d/mesa3d.hash               |    4 ++--
 package/mesa3d/mesa3d.mk                 |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 85666cc..2eaa515 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 10.6.4
+MESA3D_HEADERS_VERSION = 10.6.6
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_HEADERS_VERSION)
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 453ee41..d957357 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/mesa-announce/2015-August/000166.html
-sha256	8f5ac103f0f503de2f7a985b0df349bd4ecdfe7f51c714be146fa5a9a3c07b77	mesa-10.6.4.tar.xz
+# From http://cgit.freedesktop.org/mesa/mesa/commit/?id=f39bc1c828e14b8e8d71ea02e4c21ea7397a1ab4
+sha256	570f2154b7340ff5db61ff103bc6e85165b8958798b78a50fa2df488e98e5778	mesa-10.6.6.tar.xz
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 3c5c9eb..2242360 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 10.6.4
+MESA3D_VERSION = 10.6.6
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 MESA3D_LICENSE = MIT, SGI, Khronos
