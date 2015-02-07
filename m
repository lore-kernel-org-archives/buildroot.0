From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Feb 2015 19:05:19 +0100
Subject: [Buildroot] [git commit] package/mesa3d: bump version to 10.4.4
Message-ID: <20150207180626.1CAFF7FA9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b92602fe2f12919ebbd4d8bea61a198a6c9dbe79
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d/mesa3d.hash |    4 ++--
 package/mesa3d/mesa3d.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index b209296..6b00367 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,2 +1,2 @@
-# From http://cgit.freedesktop.org/mesa/mesa/tree/docs/relnotes/10.4.3.html
-sha256	ef6ecc9c2f36c9f78d1662382a69ae961f38f03af3a0c3268e53f351aa1978ad	MesaLib-10.4.3.tar.bz2
+# From http://lists.freedesktop.org/archives/mesa-announce/2015-February/000139.html
+sha256	f18a967e9c4d80e054b2fdff8c130ce6e6d1f8eecfc42c9f354f8628d8b4df1c	MesaLib-10.4.4.tar.bz2
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 8a84de3..eb38a9a 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESA3D_VERSION = 10.4.3
+MESA3D_VERSION = 10.4.4
 MESA3D_SOURCE = MesaLib-$(MESA3D_VERSION).tar.bz2
 MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 MESA3D_LICENSE = MIT, SGI, Khronos
