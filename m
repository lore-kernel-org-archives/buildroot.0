From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Feb 2015 16:47:00 +0100
Subject: [Buildroot] [git commit branch/next] package/mesa3d: bump to
	version 10.4.5
Message-ID: <20150221154705.D2DB180417@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=36644b02aa185d777b92c642207686fb83d918ed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/mesa3d.hash |    4 ++--
 package/mesa3d/mesa3d.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 6b00367..677781f 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/mesa-announce/2015-February/000139.html
-sha256	f18a967e9c4d80e054b2fdff8c130ce6e6d1f8eecfc42c9f354f8628d8b4df1c	MesaLib-10.4.4.tar.bz2
+# From http://cgit.freedesktop.org/mesa/mesa/commit/?h=10.4&id=41bdeda10210b8f1d358c04b25af2fbfe3335531
+sha256	bf60000700a9d58e3aca2bfeee7e781053b0d839e61a95b1883e05a2dee247a0	MesaLib-10.4.5.tar.bz2
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index eb38a9a..c2d9d54 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESA3D_VERSION = 10.4.4
+MESA3D_VERSION = 10.4.5
 MESA3D_SOURCE = MesaLib-$(MESA3D_VERSION).tar.bz2
 MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 MESA3D_LICENSE = MIT, SGI, Khronos
