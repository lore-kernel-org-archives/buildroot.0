From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Jan 2018 20:15:56 +0100
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 17.3.2
Message-ID: <20180110191825.4A39483C88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c425a925b409744a2b0d7446fb1b89a9ac9f9cde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d-headers/mesa3d-headers.mk |  2 +-
 package/mesa3d/mesa3d.hash               | 10 +++++-----
 package/mesa3d/mesa3d.mk                 |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 3de1039..7b50b8f 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 17.3.1
+MESA3D_HEADERS_VERSION = 17.3.2
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index c342f89..f16a390 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2017-December/000385.html
-md5 b4b021279ea21e1eb8a1369afa6f19a0  mesa-17.3.1.tar.xz
-sha1 1bda76199addb01946e5a6cd35e00a05540b7eb0  mesa-17.3.1.tar.xz
-sha256 9ae607e0998a586fb2c866cfc8e45e6f52d1c56cb1b41288253ea83eada824c1  mesa-17.3.1.tar.xz
-sha512 a2bd0123bf2df0db03197001a9e001b25f2609f3c6bf1bae66f3bc50c51d2558b5b77e232e81c1658c3a4dec88eda32a8b5a85c1fedc937a7441476228ef8238  mesa-17.3.1.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2018-January/000388.html
+md5  5c59b779925f504ffd0f13c7dcd29ac6  mesa-17.3.2.tar.xz
+sha1 d3fd1b57a5b853d91150aea8db033e6c995fd9e9  mesa-17.3.2.tar.xz
+sha256 e2844a13f2d6f8f24bee65804a51c42d8dc6ae9c36cff7ee61d0940e796d64c6  mesa-17.3.2.tar.xz
+sha512 46a85f5f5f9a503bc0e3f8c4469ffaa5cec3861070321d5d9cb5805c6d3ea50ae2a5438f012f467cb57d7e3b7c1e67ddabbfbf44e0fabb5856802454c576a5d3  mesa-17.3.2.tar.xz
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
 sha256 a75ee0cec909515ff80a3ec07155b7fb0aafe8051abe1f0e45d5c4c5e2539366  docs/patents.txt
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index bd93dbb..2eadc86 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 17.3.1
+MESA3D_VERSION = 17.3.2
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
