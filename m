From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:16:00 -0000
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 18.1.6
Message-ID: <20180907111507.B179481384@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c00ab0508ddfcec7c7902d2442d4553179157ab1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d-headers/mesa3d-headers.mk |  2 +-
 package/mesa3d/mesa3d.hash               | 10 +++++-----
 package/mesa3d/mesa3d.mk                 |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index de8a9dc7cf..b94b640147 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 18.1.5
+MESA3D_HEADERS_VERSION = 18.1.6
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index ff336f7d41..4f8eb851d2 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2018-July/000445.html
-md5 622bd23ca8daa83a62938bd33600a580  mesa-18.1.5.tar.xz
-sha1 1ca7d5f5d12c95f8da137be34223229b9f0594fe  mesa-18.1.5.tar.xz
-sha256 69dbe6f1a6660386f5beb85d4fcf003ee23023ed7b9a603de84e9a37e8d98dea  mesa-18.1.5.tar.xz
-sha512 f0bcb903bbf2ff7fc0b4a8fe100ea26ee91c0029b64adaf5fc4877ed7681f325c54b1be8eb0b140bff620da79f30a96375c2e1085e504ebfaf50e57f6da93013  mesa-18.1.5.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2018-August/000451.html
+md5  f798814c0b93ca3c1cf395bb936db3e0  mesa-18.1.6.tar.xz
+sha1 8d4daf725f20404f980b981c9693b58756ba6c48  mesa-18.1.6.tar.xz
+sha256 bb7ce759069801804fcfb8152da3457f76cd7b4e0096e4870ff5adcb5c894289  mesa-18.1.6.tar.xz
+sha512 2966210800215f5ced2720691063a8519b51ebeab9fb1e99bde4b1bd7ccc719d6395a1c29f25c88efe62d1592cf14ceafc163aca349490b1f8cee81070d46fcc  mesa-18.1.6.tar.xz
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
 sha256 3a0cf6c7835f98f86d5579b2cc517f84254da7411f764fb0095a383fb0759771  docs/patents.txt
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 5c01f92e22..194fb98a85 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 18.1.5
+MESA3D_VERSION = 18.1.6
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
