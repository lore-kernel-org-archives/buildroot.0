From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 14 Nov 2019 22:21:22 +0100
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 19.2.4
Message-ID: <20191114211504.29F318EF58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9cf56183a9ebfe54222cb75815012566c200a496
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Quoting
https://lists.freedesktop.org/archives/mesa-announce/2019-November/000555.html
"This is an emergency release, to fix a critical bug found in the
 19.2.3 release which causes incomplete rendering on all mesa drivers."

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index ad622ccb8a..47f3b039e0 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 19.2.3
+MESA3D_HEADERS_VERSION = 19.2.4
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 11ad50158c..89b0a13196 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2019-November/000553.html
-sha256 5ee6e42504fe41dcc9a6eba26982656a675b2550a640946f463927ed7f1c5047  mesa-19.2.3.tar.xz
-sha512 a64a6b508c28a61b9f5a50f639d0cdca2546caa2118c2478100e3535961d76bf3877357d4a7ddd7dc1d3dfc617883c8ee188915523b003aed8db03e0d5e1c007  mesa-19.2.3.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2019-November/000555.html
+sha256 09000a0f7dbbd82e193b81a8f1bf0c118eab7ca975c0329181968596e548e30f  mesa-19.2.4.tar.xz
+sha512 e8a0e90460f3153d730f8fb13f2c912a9826c05d2af9e22dc575bcd8885bf6a33c0af1c6659e81701ff097a132df88eead208e89dceb552b9da809ab543fa479  mesa-19.2.4.tar.xz
 
 # License
 sha256 d8d662974fc86e2e640362015e42de3fcc161d435a9f2111ecd8561412feca73  docs/license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 972a2e8847..6e7fa7692c 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 19.2.3
+MESA3D_VERSION = 19.2.4
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
