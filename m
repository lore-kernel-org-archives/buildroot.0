From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Oufella?= <jerome.oufella@savoirfairelinux.com>
Date: Thu, 24 Aug 2017 16:50:07 -0400
Subject: [Buildroot] [PATCH] qt-webkit-kiosk: bump to version
	1.99.6-8-g26e3085
Message-ID: <20170824205007.2329-1-jerome.oufella@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This bumps the package from 1.99.3 to 1.99.6 (stability fixes), plus a
few documentation changes and a fix for the build issue logged at [1].

[1] http://autobuild.buildroot.net/results/9ac/9acb15f955b8af31a3beeb0bd84c4b0db495e354/

Signed-off-by: J?r?me Oufella <jerome.oufella@savoirfairelinux.com>
---
 package/qt-webkit-kiosk/qt-webkit-kiosk.hash | 2 +-
 package/qt-webkit-kiosk/qt-webkit-kiosk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt-webkit-kiosk/qt-webkit-kiosk.hash b/package/qt-webkit-kiosk/qt-webkit-kiosk.hash
index f40d7c7126..8097c88c9d 100644
--- a/package/qt-webkit-kiosk/qt-webkit-kiosk.hash
+++ b/package/qt-webkit-kiosk/qt-webkit-kiosk.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 4c6269421515d482f20a2d39897ce75f7ccec6341ecafd47436c9e8c30bcc75f  qt-webkit-kiosk-7fe40a350abfbe5ec194e7c6c740f7099e8704cd.tar.gz
+sha256 ec05f5bcb202265202a6f3ff74372516ce9beb82206ff67ca2b1b6fcb586ecd2  qt-webkit-kiosk-34efddb0bf0c36c8652f90dcd001db123f286f04.tar.gz
diff --git a/package/qt-webkit-kiosk/qt-webkit-kiosk.mk b/package/qt-webkit-kiosk/qt-webkit-kiosk.mk
index 341c20a4a0..c279cbe7ce 100644
--- a/package/qt-webkit-kiosk/qt-webkit-kiosk.mk
+++ b/package/qt-webkit-kiosk/qt-webkit-kiosk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT_WEBKIT_KIOSK_VERSION = 7fe40a350abfbe5ec194e7c6c740f7099e8704cd
+QT_WEBKIT_KIOSK_VERSION = 34efddb0bf0c36c8652f90dcd001db123f286f04
 QT_WEBKIT_KIOSK_SITE = https://github.com/sergey-dryabzhinsky/qt-webkit-kiosk.git
 QT_WEBKIT_KIOSK_SITE_METHOD = git
 QT_WEBKIT_KIOSK_DEPENDENCIES = qt5webkit qt5multimedia
-- 
2.13.5
