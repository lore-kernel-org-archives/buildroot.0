From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 10 Feb 2018 15:33:46 +0100
Subject: [Buildroot] [git commit] qt53d: fix typo in <pkg>_SOURCES
Message-ID: <20180210143407.3D60B88657@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=caa3f12fd6fa63dbbcdc246c74a069fccc79ba41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The QT53D_SOURCE variable uses mismatch QT5SVG_VERSION variable.

This commit fixes the typo by using the appropriate QT53D_VERSION
variable.

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt53d/qt53d.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index 4f37ae7f5d..fcb743db21 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -6,7 +6,7 @@
 
 QT53D_VERSION = $(QT5_VERSION)
 QT53D_SITE = $(QT5_SITE)
-QT53D_SOURCE = qt3d-opensource-src-$(QT5SVG_VERSION).tar.xz
+QT53D_SOURCE = qt3d-opensource-src-$(QT53D_VERSION).tar.xz
 QT53D_DEPENDENCIES = qt5base qt5declarative
 QT53D_INSTALL_STAGING = YES
 
