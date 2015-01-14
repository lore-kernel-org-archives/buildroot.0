From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 14 Jan 2015 21:43:04 +0100
Subject: [Buildroot] [PATCH 1/3] package/mesa3d: bump version to 10.4.2
Message-ID: <1421268186-6702-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/mesa3d.hash |    4 ++--
 package/mesa3d/mesa3d.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index e2dfadf..df309b5 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/mesa-announce/2014-December/000132.html
-sha256	91e8b71c8aff4cb92022a09a872b1c5d1ae5bfec8c6c84dbc4221333da5bf1ca	MesaLib-10.4.1.tar.bz2
+# From http://mesa3d.org/relnotes/10.4.2.html
+sha256	08a119937d9f2aa2f66dd5de97baffc2a6e675f549e40e699a31f5485d15327f	MesaLib-10.4.2.tar.bz2
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index de45fef..f6f6b0f 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESA3D_VERSION = 10.4.1
+MESA3D_VERSION = 10.4.2
 MESA3D_SOURCE = MesaLib-$(MESA3D_VERSION).tar.bz2
 MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
1.7.10.4
