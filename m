From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Oct 2014 09:37:36 +0200
Subject: [Buildroot] [git commit] package/mesa3d: Bump version to 10.3.1
Message-ID: <20141014074531.06379B2CE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d2bb10e322bc0629e39b7aec3b3d7858c74ea32f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d/mesa3d.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
