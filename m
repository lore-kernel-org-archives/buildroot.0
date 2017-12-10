From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 Dec 2017 20:57:14 +0100
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 17.3.0
Message-ID: <20171210195454.3DEC380FCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a77f665f3d4ec22cfb42469f0e518d7e23b19501
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixed path for current license hash and added another one.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d-headers/mesa3d-headers.mk |  2 +-
 package/mesa3d/mesa3d.hash               | 13 +++++++------
 package/mesa3d/mesa3d.mk                 |  2 +-
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 87fbb2f..4311f98 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 17.2.6
+MESA3D_HEADERS_VERSION = 17.3.0
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 5779258..0931012 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,7 +1,8 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2017-November/000378.html
-md5 862f2b7e2a08554570b192a89f723b6f  mesa-17.2.6.tar.xz
-sha1 03003f7d5966ef842d169020e95bcbdf92add055  mesa-17.2.6.tar.xz
-sha256 6ad85224620330be26ab68c8fc78381b12b38b610ade2db8716b38faaa8f30de  mesa-17.2.6.tar.xz
-sha512 739645d963da2ff79fa0f2bfcc4948516c4f0a768f9d21f98eff049edc88218847afd3786003ccf7b10deec585f4f1d7f70fcc5e5f6e33186ebbb86cd8cb0202  mesa-17.2.6.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2017-December/000380.html
+md5 7f69ae6aa9c54a990c4d65e29b17f07d  mesa-17.3.0.tar.xz
+sha1 98f6a1f50dd0cc18f2d63d170ff4b2569fd72bcd  mesa-17.3.0.tar.xz
+sha256 29a0a3a6c39990d491a1a58ed5c692e596b3bfc6c01d0b45e0b787116c50c6d9  mesa-17.3.0.tar.xz
+sha512 b0a616ce9a534a19c42eb0a626a178c6a7171aae1989351ea7c2a9e775a7478758b805dbfb754056720b1ef0454c3d3beb64aa59543be27f249ce97efae8e47e  mesa-17.3.0.tar.xz
 # License
-sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  license.html
+sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
+sha256 a75ee0cec909515ff80a3ec07155b7fb0aafe8051abe1f0e45d5c4c5e2539366  docs/patents.txt
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 6c8e86f..5efa9f4 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 17.2.6
+MESA3D_VERSION = 17.3.0
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
