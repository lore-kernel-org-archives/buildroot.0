From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 4 Apr 2020 17:28:05 +0200
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 20.0.4
Message-ID: <20200404151744.4D5228A68D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0936fe3dcf50012422a6067812116cea81e9f58d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 332d979397..077798ac77 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 20.0.3
+MESA3D_HEADERS_VERSION = 20.0.4
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 62ab461c4e..de8e92bc39 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2020-April/000576.html
-sha256 d63aaf2c27143eded2f4f376f18f7a766ad997f8eeb96c357e8ade84e8a237af  mesa-20.0.3.tar.xz
-sha512 e27d147bb85908cac4eb4b0f0505a7c539051805f54e6e50105c9e5c07d3b3b3c8524959b31eb97f8e8f6e5859f46cd257a25275e0671279f12ecd89ee13f7bf  mesa-20.0.3.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2020-April/000577.html
+sha256 c4ed491517a94118a7a611810eeb92645d42ffd82280dcd51be8cc2ba1aabba5  mesa-20.0.4.tar.xz
+sha512 17d8bc3b56779a8e5648d81da9ee97b66bcec015710801edce4e8055fbb314cd9ebc1d112e3035480ba844c7d9ae6b5b1f1eac0cc0817e69e9253a7748451a55  mesa-20.0.4.tar.xz
 
 # License
 sha256  1ddae7da415352a5b5360ff3a9d7ecf23ba81408f62eeecce0011f32e3ef9da6  docs/license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index bede7665ea..111151d342 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 20.0.3
+MESA3D_VERSION = 20.0.4
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
