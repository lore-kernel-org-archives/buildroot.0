From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 13 Oct 2014 20:05:26 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/mesa3d: Bump version to 10.3.1
Message-ID: <1413223527-8740-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: no changes
 package/mesa3d/mesa3d.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 844884b..b647f36 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-MESA3D_VERSION = 10.3.0
+MESA3D_VERSION = 10.3.1
 MESA3D_SOURCE = MesaLib-$(MESA3D_VERSION).tar.bz2
-MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/10.3
+MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 MESA3D_LICENSE = MIT, SGI, Khronos
 MESA3D_LICENSE_FILES = docs/license.html
 MESA3D_AUTORECONF = YES
-- 
1.7.10.4
