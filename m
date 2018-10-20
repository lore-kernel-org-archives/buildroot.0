From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Oct 2018 14:17:23 +0200
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 18.2.3
Message-ID: <20181020121553.1735983B77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e0a3e71adde53f32d467b00b0196f46225828a1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d-headers/mesa3d-headers.mk |  2 +-
 package/mesa3d/mesa3d.hash               | 10 +++++-----
 package/mesa3d/mesa3d.mk                 |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index aa25891f9e..c3eaaac3d8 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 18.2.2
+MESA3D_HEADERS_VERSION = 18.2.3
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index b440162f0b..5f894a771e 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,7 +1,7 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2018-October/000466.html
-md5 5931dd76a7533c7c5e702a4e5c00d3bb  mesa-18.2.2.tar.xz
-sha1 4abcb04c7fa261c60775a826a39ae0b28ab3856b  mesa-18.2.2.tar.xz
-sha256 c3ba82b12a89d3d9fed2bdd96b4702dbb7ab675034650a8b1b718320daf073c4  mesa-18.2.2.tar.xz
-sha512 35c27f0673abd35d0581db34b6ad646058523dd826ff751df718e1f9d6a996409a0c5b313fbbf177058d9610a53d646f858fb86537e3ea1000df5edbddcf043a  mesa-18.2.2.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2018-October/000468.html
+md5 3ad402144c2da93f09910dd2e0fc4017  mesa-18.2.3.tar.xz
+sha1 84c037e8ac53c210e3d74ae010241f781251b72c  mesa-18.2.3.tar.xz
+sha256 e2bf83c17e1abdecb1ee81af22652e27e9aa38f963e95e60f34275cc0376304f  mesa-18.2.3.tar.xz
+sha512 20f512b1f3835b1c78b1f05f2e2125dc3437b61b8857e7ec62e0f9ac3be2ccb5b7ebe7e18f444da1117bc100d75e4b03cd2a0180f0f0b1cf760714b43bc7a664  mesa-18.2.3.tar.xz
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 23de2eb592..82a66b6d9b 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 18.2.2
+MESA3D_VERSION = 18.2.3
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
