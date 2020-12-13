From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Dec 2020 14:49:11 +0100
Subject: [Buildroot] [git commit] package/qt5/qt5coap: bump version to
 5.15.2 (and fix download)
Message-ID: <20201213133307.6359180F77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6cfbd51d98d1b5fc7326ba0b0cc376f2f7c5ce59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- bump version to 5.15.2
- change download url to original site

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5coap/qt5coap.hash | 2 +-
 package/qt5/qt5coap/qt5coap.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5coap/qt5coap.hash b/package/qt5/qt5coap/qt5coap.hash
index 29d9595ce5..54e78023dc 100644
--- a/package/qt5/qt5coap/qt5coap.hash
+++ b/package/qt5/qt5coap/qt5coap.hash
@@ -1,5 +1,5 @@
 # Hash locally calculated
-sha256  f2addd89e94fb3945fc6ee6db795b0736cd3396760b31e04c01cd02558c53e07  qt5coap-5.15.1.tar.gz
+sha256  44c4782a40a29ccee3241d8cf08f368230dff5b1bed9ca0d58bc8e70c38f5003  qt5coap-5.15.2.tar.gz
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5coap/qt5coap.mk b/package/qt5/qt5coap/qt5coap.mk
index c1666f2e8c..24de869120 100644
--- a/package/qt5/qt5coap/qt5coap.mk
+++ b/package/qt5/qt5coap/qt5coap.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 QT5COAP_VERSION = $(QT5_VERSION)
-QT5COAP_SITE = $(call github,qt,qtcoap,v$(QT5_VERSION))
+QT5COAP_SITE = https://code.qt.io/cgit/qt/qtcoap.git
+QT5COAP_SITE_METHOD = git
 QT5COAP_INSTALL_STAGING = YES
 QT5COAP_LICENSE = GPL-3.0, GFDL-1.3
 QT5COAP_LICENSE_FILES = LICENSE.GPL3 LICENSE.FDL
