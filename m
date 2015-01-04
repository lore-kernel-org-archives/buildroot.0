From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  4 Jan 2015 13:17:30 +0100
Subject: [Buildroot] [PATCH 3/6] package/mesa3d: bump version to 10.4.1
In-Reply-To: <1420373853-20008-1-git-send-email-bernd.kuhls@t-online.de>
References: <1420373853-20008-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1420373853-20008-3-git-send-email-bernd.kuhls@t-online.de>
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
index 4c67205..e2dfadf 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/mesa-announce/2014-December/000130.html
-sha256	98a7dff3a1a6708c79789de8b9a05d8042e867067f70e8f30387c15026233219	MesaLib-10.4.0.tar.bz2
+# From http://lists.freedesktop.org/archives/mesa-announce/2014-December/000132.html
+sha256	91e8b71c8aff4cb92022a09a872b1c5d1ae5bfec8c6c84dbc4221333da5bf1ca	MesaLib-10.4.1.tar.bz2
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 1e39b82..de45fef 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESA3D_VERSION = 10.4.0
+MESA3D_VERSION = 10.4.1
 MESA3D_SOURCE = MesaLib-$(MESA3D_VERSION).tar.bz2
 MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
1.7.10.4
