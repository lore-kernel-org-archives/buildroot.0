From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Oct 2018 15:22:45 +0200
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 18.2.2
Message-ID: <20181006132154.5E4B68D9C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=94050786cbf8b5439c93c994764efb7603ca4796
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d-headers/mesa3d-headers.mk |  2 +-
 package/mesa3d/mesa3d.hash               | 10 +++++-----
 package/mesa3d/mesa3d.mk                 |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index c4217be5c7..aa25891f9e 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 18.2.1
+MESA3D_HEADERS_VERSION = 18.2.2
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 3f8130fc7d..b440162f0b 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,7 +1,7 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2018-September/000463.html
-md5 66afbc1dddcaa4c7dabf5c5ee187c73b  mesa-18.2.1.tar.xz
-sha1 cfcaf550ab0915033bd27cc7a5968764510dbfc1  mesa-18.2.1.tar.xz
-sha256 9636dc6f3d188abdcca02da97cedd73640d9035224efd5db724187d062c81056  mesa-18.2.1.tar.xz
-sha512 d249bdf79aad36db9a8d291b3a1a100d283893ac741f58f85ae7e5c90ca25c37f80a5fa6fc57945ffeb0b67b788e7ea146543ec790b22f144578fc4c1525b84d  mesa-18.2.1.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2018-October/000466.html
+md5 5931dd76a7533c7c5e702a4e5c00d3bb  mesa-18.2.2.tar.xz
+sha1 4abcb04c7fa261c60775a826a39ae0b28ab3856b  mesa-18.2.2.tar.xz
+sha256 c3ba82b12a89d3d9fed2bdd96b4702dbb7ab675034650a8b1b718320daf073c4  mesa-18.2.2.tar.xz
+sha512 35c27f0673abd35d0581db34b6ad646058523dd826ff751df718e1f9d6a996409a0c5b313fbbf177058d9610a53d646f858fb86537e3ea1000df5edbddcf043a  mesa-18.2.2.tar.xz
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 4de36eae46..23de2eb592 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 18.2.1
+MESA3D_VERSION = 18.2.2
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
