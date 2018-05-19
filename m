From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 May 2018 21:50:14 +0200
Subject: [Buildroot] [git commit branch/next] package/{mesa3d,
 mesa3d-headers}: bump version to 18.0.4
Message-ID: <20180519194932.8804580824@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f18ca0e7bb0e522846296139cdf0f8039d7dca1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

See:
https://lists.freedesktop.org/archives/mesa-dev/2018-May/195215.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d-headers/mesa3d-headers.mk |  2 +-
 package/mesa3d/mesa3d.hash               | 10 +++++-----
 package/mesa3d/mesa3d.mk                 |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 5a8e3f9b84..18c98a7f9e 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 18.0.3
+MESA3D_HEADERS_VERSION = 18.0.4
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 983c0e65e5..9b9f01703c 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2018-May/000426.html
-md5 b260580a26b71a5e52c608e3fe6d08a6  mesa-18.0.3.tar.xz
-sha1 2c12c9f69eb7ba787dd1245b53bb98ceb08362d3  mesa-18.0.3.tar.xz
-sha256 099d9667327a76a61741a533f95067d76ea71a656e66b91507b3c0caf1d49e30  mesa-18.0.3.tar.xz
-sha512 decd050bab049d17bcde3f832d4da0ffdb80f147c99377a162739bbe72fd6fd32b51e56e6fc66895b8c30fc19a1815bae164b21aa557816c3998ad18c1ffca2d  mesa-18.0.3.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2018-May/000429.html
+md5 ef525adaff7f31bedd4c5134bc313da9  mesa-18.0.4.tar.xz
+sha1 4bbee07d8eb42625f215f49d39a657fabdc2f29d  mesa-18.0.4.tar.xz
+sha256 1f3bcfe7cef0a5c20dae2b41df5d7e0a985e06be0183fa4d43b6068fcba2920f  mesa-18.0.4.tar.xz
+sha512 f9a14be46c209661ceb318add1611481445d13b47e95c7a5d2a5e5ecfdd5d2c3fa9c2b16b30035bbb8d61ccc7cb65bfa6698ac8b040273e5ab045a951a67752c  mesa-18.0.3.tar.xz
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
 sha256 a75ee0cec909515ff80a3ec07155b7fb0aafe8051abe1f0e45d5c4c5e2539366  docs/patents.txt
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index d897c0d4c2..1b2fca1f90 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 18.0.3
+MESA3D_VERSION = 18.0.4
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
