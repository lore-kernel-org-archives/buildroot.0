From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jun 2017 21:46:42 +0200
Subject: [Buildroot] [git commit] package/mesa3d: bump version to 17.0.7
Message-ID: <20170606194646.0391582A34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d50e7db378070a5d11400b0312ab7d69be733bf0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d-headers/mesa3d-headers.mk |  2 +-
 package/mesa3d/mesa3d.hash               | 10 +++++-----
 package/mesa3d/mesa3d.mk                 |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index fbde9ec..ccf90db 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 17.0.6
+MESA3D_HEADERS_VERSION = 17.0.7
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index ccd1afe..e540074 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2017-May/000327.html
-md5 77ea38dc0ab899864b06ea2941ac31a4  mesa-17.0.6.tar.xz
-sha1 f348781d5e4342ef5b78572f68ef9749e308dbd7  mesa-17.0.6.tar.xz
-sha256 89ecf3bcd0f18dcca5aaa42bf36bb52a2df33be89889f94aaaad91f7a504a69d  mesa-17.0.6.tar.xz
-sha512 537d28aa694c2d48811d2467e33b3adc841067d5f1cdb7e0809ba100f71869090285bbb246e57e5f0177401a539b44cc32b1ccfcb32a1855c14b011b92d32eaf  mesa-17.0.6.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2017-June/000332.html
+md5 8d088c8f7a099084ac745646ed1ad62b  mesa-17.0.7.tar.xz
+sha1 33eecf0d137ad31bc91d2863447766aa42d2df43  mesa-17.0.7.tar.xz
+sha256 f6d75304a229c8d10443e219d6b6c0c342567dbab5a879ebe7cfa3c9139c4492  mesa-17.0.7.tar.xz
+sha512 378d643cf63ec3ed5fd093c00079fb03375f6a87875d3583a5d4707d3d6b21934194b0f624f4ed261c9a05a2fe3e9f292dcd8466e82cfb95d919459e3eb635ea  mesa-17.0.7.tar.xz
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 1404f84..b010722 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 17.0.6
+MESA3D_VERSION = 17.0.7
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
