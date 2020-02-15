From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Feb 2020 12:06:45 +0100
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 19.3.4
Message-ID: <20200215105641.03C6C8E0BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be7ee2a08874b94e36ddb46ecb4f11fa82a993c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 667a74b1a8..7d428f2322 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 19.3.3
+MESA3D_HEADERS_VERSION = 19.3.4
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index e14b890e73..3237135b1c 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2020-January/000567.html
-sha256 81ce4810bb25d61300f8104856461f4d49cf7cb794aa70cb572312e370c39f09  mesa-19.3.3.tar.xz
-sha512 1f792fbde71132afd4a43d6abe6a3d640f375e83641c6144c82312774434c9588ffba65a3ba38394947bd753656aa85213b6cd9f745cec0040c0559eb41f0dc9  mesa-19.3.3.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2020-February/000570.html
+sha256 1da467e6ae2799a517e242462331eafd29ae77d9872f3a845df81f7c308e8fe4  mesa-19.3.4.tar.xz
+sha512 2bbb3dc8f1d839f11fe12cc959393cd69607fa6714b2166b80299e0559d2d3b0ac38ed4e15ac3e5f472264eb24536d1901d350f7409f3a7e00d6f4ccbb2312fb  mesa-19.3.4.tar.xz
 
 # License
 sha256 d8d662974fc86e2e640362015e42de3fcc161d435a9f2111ecd8561412feca73  docs/license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index c14716bf15..2a22d2fddc 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 19.3.3
+MESA3D_VERSION = 19.3.4
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
