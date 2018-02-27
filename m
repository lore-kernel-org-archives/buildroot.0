From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Feb 2018 20:37:13 +0100
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 17.3.6
Message-ID: <20180227193746.8D2338132E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ab743e6a18880f5d972fde523e13d44ee71a13d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release note of this emergency release:
https://lists.freedesktop.org/archives/mesa-announce/2018-February/000403.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d-headers/mesa3d-headers.mk |  2 +-
 package/mesa3d/mesa3d.hash               | 10 +++++-----
 package/mesa3d/mesa3d.mk                 |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 4c1353ac7a..4eb57b3ad4 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 17.3.5
+MESA3D_HEADERS_VERSION = 17.3.6
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index cb4041172a..a61fe02b6d 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2018-February/000401.html
-md5 bf73288c33cf12abe62045c25e2196b4  mesa-17.3.5.tar.xz
-sha1 5168471ad19945a2f76a14c842b8273e4c29aba4  mesa-17.3.5.tar.xz
-sha256 eb9228fc8aaa71e0205c1481c5b157752ebaec9b646b030d27478e25a6d7936a  mesa-17.3.5.tar.xz
-sha512 39ada2480aa12c42bbff6a1b5c957f99934193d19eb5f44e102ef8302d26f777cee63af1140aa8623bbc1ebd6d69e172cecca798780b8eb594f2ebbb217afd29  mesa-17.3.5.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2018-February/000403.html
+md5 ba66ae0f09b9b84482268608557cd175  mesa-17.3.6.tar.xz
+sha1 eff29cb8c284a813977d4201dd646d949b1d8fc4  mesa-17.3.6.tar.xz
+sha256 e5915680d44ac9d05defdec529db7459ac9edd441c9845266eff2e2d3e57fbf8  mesa-17.3.6.tar.xz
+sha512 5164ed5a1d3d25031b712a9f443f0e467a29b2bca0a1aa11324ed5c10279411979c9c7482825053926a813e76c58b78a3439c7c81fcd51a7808f53977080828f  mesa-17.3.6.tar.xz
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
 sha256 a75ee0cec909515ff80a3ec07155b7fb0aafe8051abe1f0e45d5c4c5e2539366  docs/patents.txt
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 7e46681ab7..5f4832c0f0 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 17.3.5
+MESA3D_VERSION = 17.3.6
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
