From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Nov 2017 09:32:23 +0100
Subject: [Buildroot] [git commit branch/next] package/{mesa3d,
 mesa3d-headers}: bump version to 17.2.6
Message-ID: <20171127082503.AE67081472@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ddfa001948ab877b71d19f74b68bab7a3061cb7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d-headers/mesa3d-headers.mk |  2 +-
 package/mesa3d/mesa3d.hash               | 10 +++++-----
 package/mesa3d/mesa3d.mk                 |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index a944353..87fbb2f 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 17.2.5
+MESA3D_HEADERS_VERSION = 17.2.6
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index baadc49..5779258 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,7 +1,7 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2017-November/000374.html
-md5 ba649f82a066f710aa23655254a83eb8  mesa-17.2.5.tar.xz
-sha1 1509bd00f32ee42128f29b63b4aaf26bf9abb63e  mesa-17.2.5.tar.xz
-sha256 7f7f914b7b9ea0b15f2d9d01a4375e311b0e90e55683b8e8a67ce8691eb1070f  mesa-17.2.5.tar.xz
-sha512 c4b0f7f48b0b57fdf610de3d61e127774f8223e755acfde6cf2649818eec985e8f925abf8a15d530ecdb882cb8d7268fd01e5d94c8ac6934551b8a74272353c7  mesa-17.2.5.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2017-November/000378.html
+md5 862f2b7e2a08554570b192a89f723b6f  mesa-17.2.6.tar.xz
+sha1 03003f7d5966ef842d169020e95bcbdf92add055  mesa-17.2.6.tar.xz
+sha256 6ad85224620330be26ab68c8fc78381b12b38b610ade2db8716b38faaa8f30de  mesa-17.2.6.tar.xz
+sha512 739645d963da2ff79fa0f2bfcc4948516c4f0a768f9d21f98eff049edc88218847afd3786003ccf7b10deec585f4f1d7f70fcc5e5f6e33186ebbb86cd8cb0202  mesa-17.2.6.tar.xz
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index fb94185..6c8e86f 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 17.2.5
+MESA3D_VERSION = 17.2.6
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
