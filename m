From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Nov 2019 22:46:05 +0100
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 19.2.3
Message-ID: <20191106214033.74E958E89D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0aa6cf0fe1de3446fb77defef929ac7bf47c4cea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 73d455cb4a..ad622ccb8a 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 19.2.2
+MESA3D_HEADERS_VERSION = 19.2.3
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index d478c51a22..11ad50158c 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2019-October/000551.html
-sha256 7e4f0e2678bfcf3b94f533078b514f37943378a4a8604e477c888ec8a2904394  mesa-19.2.2.tar.xz
-sha512 a3269052c2dfb5404180d1aebd68f5b9b0cc136d634ba89fed3f60fcc9b279072e09ee2db9b485375d39e886209053841df920c9d0b975e0de2825e3da4164a5  mesa-19.2.2.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2019-November/000553.html
+sha256 5ee6e42504fe41dcc9a6eba26982656a675b2550a640946f463927ed7f1c5047  mesa-19.2.3.tar.xz
+sha512 a64a6b508c28a61b9f5a50f639d0cdca2546caa2118c2478100e3535961d76bf3877357d4a7ddd7dc1d3dfc617883c8ee188915523b003aed8db03e0d5e1c007  mesa-19.2.3.tar.xz
 
 # License
 sha256 d8d662974fc86e2e640362015e42de3fcc161d435a9f2111ecd8561412feca73  docs/license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 3d470baa66..972a2e8847 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 19.2.2
+MESA3D_VERSION = 19.2.3
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
