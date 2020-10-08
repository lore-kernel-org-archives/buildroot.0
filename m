From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Oct 2020 23:26:23 +0200
Subject: [Buildroot] [git commit] package/qt5/qt5remoteobjects: fix license
 files
Message-ID: <20201008211536.B86848EFFA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef5e67416ae951b4e3a31dc534df46a6223be7f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no LICENSE.FDL

Fixes:
 - http://autobuild.buildroot.org/results/486563913e0fd4add2350f3c352db94ed86bce55

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5remoteobjects/qt5remoteobjects.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5remoteobjects/qt5remoteobjects.mk b/package/qt5/qt5remoteobjects/qt5remoteobjects.mk
index 4b03a09d7f..a6b5f0954c 100644
--- a/package/qt5/qt5remoteobjects/qt5remoteobjects.mk
+++ b/package/qt5/qt5remoteobjects/qt5remoteobjects.mk
@@ -10,7 +10,7 @@ QT5REMOTEOBJECTS_SOURCE = qtremoteobjects-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5REMO
 QT5REMOTEOBJECTS_DEPENDENCIES = qt5base
 QT5REMOTEOBJECTS_INSTALL_STAGING = YES
 QT5REMOTEOBJECTS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception (tools), GFDL-1.3 (docs)
-QT5REMOTEOBJECTS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
+QT5REMOTEOBJECTS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3
 
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
 QT5REMOTEOBJECTS_DEPENDENCIES += qt5declarative
