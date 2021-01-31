From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jan 2021 11:27:30 +0100
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 20.3.4
Message-ID: <20210131101051.B943B85FDE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fd0796a27a0f04b7ec337d8eeb8a2e72b9a9a2fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.freedesktop.org/archives/mesa-announce/2021-January/000618.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 8a6cbf45e2..6e2f0b5a79 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 20.3.3
+MESA3D_HEADERS_VERSION = 20.3.4
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index a7f7ae9f03..e7b375440d 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2021-January/000616.html
-sha256  f74e212d4838e982a10c203ffa998817d1855c5cf448ae87b58f96edea61d156  mesa-20.3.3.tar.xz
-sha512  77735462f4ccbe865d0cf7e9db47c42f8bc2600b9a030dca11066d29e43f73c18ca0422e6356129fc14ac1b1018ed752ae4ee45bd31ae706fea58f573a14d346  mesa-20.3.3.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2021-January/000618.html
+sha256  dc21a987ec1ff45b278fe4b1419b1719f1968debbb80221480e44180849b4084  mesa-20.3.4.tar.xz
+sha512  81c4d032213b4aef842f1594e0e89bc0045f7ca7ce5f267b62a0f8236eb12ab09c1f780d8b3776b3072f37cd0bd8829f8a1330a749ccf462471b262ef8097477  mesa-20.3.4.tar.xz
 
 # License
 sha256  1361129baa4519b6ed27a1bf4aeee33a58b060bf7bb9b6ea415ecede04e35e46  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index bc277bec5a..5105727e8b 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 20.3.3
+MESA3D_VERSION = 20.3.4
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
