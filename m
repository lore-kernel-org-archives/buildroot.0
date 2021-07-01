From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  1 Jul 2021 07:01:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 21.1.4
Message-ID: <20210701050152.3239-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
- 21.1.2
  https://lists.freedesktop.org/archives/mesa-announce/2021-June/000632.html
- 21.1.3
  https://lists.freedesktop.org/archives/mesa-announce/2021-June/000633.html
- 21.1.4
  https://lists.freedesktop.org/archives/mesa-announce/2021-June/000635.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 960bd83344..4b3b6a0989 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 21.1.1
+MESA3D_HEADERS_VERSION = 21.1.4
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 9548f8d170..fa83e2a2b5 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2021-May/000631.html
-sha256  eec25ea379054e8911bc5de816aeb50f581b5b708414725003d2f00386b38dd2  mesa-21.1.1.tar.xz
-sha512  79d0e2b0e1e590e7f36a082df3584010a553af0b3060bd2d3a7ace700ac7a8d1b7734ba67f2e193dd441434eeec74a16e0dbcbf8c15061b5dd5d6a1feca73d62  mesa-21.1.1.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2021-June/000635.html
+sha256 1f177f44098164b65731c5ded4c928fd58b14f6c9d2087aa0e37bc79bf79e90b  mesa-21.1.4.tar.xz
+sha512 1f4e2d8ba2c3c02bad5468687752d7e87d6e79c4a0e6ec4b2741a57fb270d18ae4712aaa07a9e09a2d3348540f5a26cdbe05464cd52adb8df1e2e28a581b2b53  mesa-21.1.4.tar.xz
 
 # License
 sha256  998437f3f75f0c542046f83c1cb349408122268168fb13eb4ae6967aa18b7d98  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index a30b4aff31..8e1b813da2 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 21.1.1
+MESA3D_VERSION = 21.1.4
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.30.2
