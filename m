From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 20:24:04 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/{mesa3d,
 mesa3d-headers}: bump version to 20.3.5
Message-ID: <20210426175946.E749B83958@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=abf996ba5cd968207018f73f2af5f33e7b8f26c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Bugfix release, fixing various issues:
https://lists.freedesktop.org/archives/mesa-announce/2021-March/000623.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 6e2f0b5a79..5deea5f977 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 20.3.4
+MESA3D_HEADERS_VERSION = 20.3.5
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index e7b375440d..3d357582f3 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2021-January/000618.html
-sha256  dc21a987ec1ff45b278fe4b1419b1719f1968debbb80221480e44180849b4084  mesa-20.3.4.tar.xz
-sha512  81c4d032213b4aef842f1594e0e89bc0045f7ca7ce5f267b62a0f8236eb12ab09c1f780d8b3776b3072f37cd0bd8829f8a1330a749ccf462471b262ef8097477  mesa-20.3.4.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2021-March/000623.html
+sha256  909a72df63dfa3c0844ccf44a26ac028d148297ed333ab51560893923d7691ce  mesa-20.3.5.tar.xz
+sha512  481e710ed80d8f215a8d541cfe51b960862c2403c2b9e7e6932c8236b8decb5d478871d6c73559d6d795ada143803764f3a93b2329588c80f62e2e5ec98c78a9  mesa-20.3.5.tar.xz
 
 # License
 sha256  1361129baa4519b6ed27a1bf4aeee33a58b060bf7bb9b6ea415ecede04e35e46  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 5105727e8b..c9a7214aaa 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 20.3.4
+MESA3D_VERSION = 20.3.5
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
