From: james.hilliard1 at gmail.com <james.hilliard1@gmail.com>
Date: Sat, 15 Dec 2018 15:54:10 +0800
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: bump to version 18.3.1
Message-ID: <1544860450-31613-1-git-send-email-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/mesa3d/mesa3d.hash | 10 +++++-----
 package/mesa3d/mesa3d.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 563ac62..68ec1ec 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,7 +1,7 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2018-December/000482.html
-md5 2d69eff8fe0c6e89bb793d4fd69b750d  mesa-18.3.0.tar.xz
-sha1 d4ddc4e7aa8e11a41d35b5d51476f867e81056ca  mesa-18.3.0.tar.xz
-sha256 b63f947e735d6ef3dfaa30c789a9adfbae18aea671191eaacde95a18c17fc38a  mesa-18.3.0.tar.xz
-sha512 6643d8a100c50efee7178fe950e7cccad24c3a98538d3a13c7c6570add30a56776b4e5f279e2b0a20c4038e682e9461ca5a4fd4ac23a7f60d2f4a0c972525c42  mesa-18.3.0.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2018-December/000484.html
+md5 d60828056d77bfdbae0970f9b15fb1be  mesa-18.3.1.tar.xz
+sha1 50ba2d37647fea77ea19416e8a6ffed34c313330  mesa-18.3.1.tar.xz
+sha256 5b1f827d28684a25f6657289f8b7d47ac56395988c7ac23e0ec9a62b644bdc63  mesa-18.3.1.tar.xz
+sha512 a68d39158cf1e868d70730d0641a0cfe4c6e5b3cd1bc0c47f54022402aca03503933084f6ddc722bf88c9b6d1281ba5c847ec4fed8092a9b33f90527d08e12db  mesa-18.3.1.tar.xz
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index f3ee69b..2fe46bd 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 18.3.0
+MESA3D_VERSION = 18.3.1
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.7.4
