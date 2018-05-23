From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Oufella?= <jerome.oufella@savoirfairelinux.com>
Date: Wed, 23 May 2018 09:46:08 -0400
Subject: [Buildroot] [PATCH 1/1] qt-webkit-kiosk: bump to version
 1.99.7-4-ga7720e5
Message-ID: <20180523134608.11936-1-jerome.oufella@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This brings localstorage support in the app, plus a fix for the build
issue logged at [1].

[1] http://autobuild.buildroot.net/results/f29fa8ef055fe0d41db5944974272530d02ecd29/

Signed-off-by: J?r?me Oufella <jerome.oufella@savoirfairelinux.com>
---
 package/qt-webkit-kiosk/qt-webkit-kiosk.hash | 2 +-
 package/qt-webkit-kiosk/qt-webkit-kiosk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt-webkit-kiosk/qt-webkit-kiosk.hash b/package/qt-webkit-kiosk/qt-webkit-kiosk.hash
index 8097c88c9d..666cb6ce55 100644
--- a/package/qt-webkit-kiosk/qt-webkit-kiosk.hash
+++ b/package/qt-webkit-kiosk/qt-webkit-kiosk.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 ec05f5bcb202265202a6f3ff74372516ce9beb82206ff67ca2b1b6fcb586ecd2  qt-webkit-kiosk-34efddb0bf0c36c8652f90dcd001db123f286f04.tar.gz
+sha256 07fbc3f5053f55e4ef6566a15b42b74895314b48a0dfd46f0984f96f0fbb3e02  qt-webkit-kiosk-a7720e50f2bd70aad99e0b465f5c4a57aca48127.tar.gz
diff --git a/package/qt-webkit-kiosk/qt-webkit-kiosk.mk b/package/qt-webkit-kiosk/qt-webkit-kiosk.mk
index c279cbe7ce..a714fca9c9 100644
--- a/package/qt-webkit-kiosk/qt-webkit-kiosk.mk
+++ b/package/qt-webkit-kiosk/qt-webkit-kiosk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT_WEBKIT_KIOSK_VERSION = 34efddb0bf0c36c8652f90dcd001db123f286f04
+QT_WEBKIT_KIOSK_VERSION = a7720e50f2bd70aad99e0b465f5c4a57aca48127
 QT_WEBKIT_KIOSK_SITE = https://github.com/sergey-dryabzhinsky/qt-webkit-kiosk.git
 QT_WEBKIT_KIOSK_SITE_METHOD = git
 QT_WEBKIT_KIOSK_DEPENDENCIES = qt5webkit qt5multimedia
-- 
2.14.3
