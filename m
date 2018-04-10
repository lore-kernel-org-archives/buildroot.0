From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Apr 2018 21:38:12 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] qt53d: fix typo in
 <pkg>_SOURCES
Message-ID: <20180410205255.E1215815B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=223c160078aba9114b407d15073394059819da09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

The QT53D_SOURCE variable uses mismatch QT5SVG_VERSION variable.

This commit fixes the typo by using the appropriate QT53D_VERSION
variable.

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit caa3f12fd6fa63dbbcdc246c74a069fccc79ba41)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt53d/qt53d.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index 5dac5b0b62..4598da56c6 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -6,7 +6,7 @@
 
 QT53D_VERSION = $(QT5_VERSION)
 QT53D_SITE = $(QT5_SITE)
-QT53D_SOURCE = qt3d-opensource-src-$(QT5SVG_VERSION).tar.xz
+QT53D_SOURCE = qt3d-opensource-src-$(QT53D_VERSION).tar.xz
 QT53D_DEPENDENCIES = qt5base qt5declarative
 QT53D_INSTALL_STAGING = YES
 
