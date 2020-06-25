From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 25 Jun 2020 23:25:20 +0200
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 20.1.2
Message-ID: <20200626211137.C1FF7860D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2fc3d65cda06f47d3559e4c6cbf086f8da46896b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 246abbd033..6e8c9be2c0 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 20.1.1
+MESA3D_HEADERS_VERSION = 20.1.2
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 73dcf6ad81..9fdf30e013 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2020-June/000587.html
-sha256  3ea6e46ea7881c656f7b4724639eaa4672d4e0e0b70869651e8f955ebae3d476  mesa-20.1.1.tar.xz
-sha512  a8ae02915305488e5e0d8c104da73df1cdd61ab0b5c5d27a6851c418d25a2c9beeea9cddf93a341afa63cec52d356fe68b194c8c36e78c26f66fa884fc27f147  mesa-20.1.1.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2020-June/000589.html
+sha256  283dff72814c8a80ce1ff8271e3f055895d26f4da3f4362acc49193e635780cb  mesa-20.1.2.tar.xz
+sha512  467fc6a1cbfc1bc140ba2e6e90a14bd8d15d979b92ba14d084018b6cf22b172767575f5127c6edb5c3bdf12fe6696b27d9975826b3fbb5ad5909d258fc3b8433  mesa-20.1.2.tar.xz
 
 # License
 sha256  1ddae7da415352a5b5360ff3a9d7ecf23ba81408f62eeecce0011f32e3ef9da6  docs/license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 4e083979cc..9eb0993f02 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 20.1.1
+MESA3D_VERSION = 20.1.2
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
