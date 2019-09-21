From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Sep 2019 15:50:50 +0200
Subject: [Buildroot] [git commit] package/kf5: fix _LICENSE_FILE ->
 _LICENSE_FILES typos
Message-ID: <20190921134732.3690B8EDFC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a6c594b8dc0579c50893a176affe63cd34002eb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes WARNINGs in make legal-info of the kind:
    WARNING: kf5-extra-cmake-modules-5.47.0: cannot save license
    (KF5_EXTRA_CMAKE_MODULES_LICENSE_FILES not defined)

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.mk | 2 +-
 package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.mk         | 2 +-
 package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.mk     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.mk b/package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.mk
index 7b96e1f1bb..3c4281b960 100644
--- a/package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.mk
+++ b/package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.mk
@@ -8,7 +8,7 @@ KF5_EXTRA_CMAKE_MODULES_VERSION = $(KF5_VERSION)
 KF5_EXTRA_CMAKE_MODULES_SITE = $(KF5_SITE)
 KF5_EXTRA_CMAKE_MODULES_SOURCE = extra-cmake-modules-$(KF5_EXTRA_CMAKE_MODULES_VERSION).tar.xz
 KF5_EXTRA_CMAKE_MODULES_LICENSE = BSD-3-Clause
-KF5_EXTRA_CMAKE_MODULES_LICENSE_FILE = COPYING-CMAKE-SCRIPTS
+KF5_EXTRA_CMAKE_MODULES_LICENSE_FILES = COPYING-CMAKE-SCRIPTS
 
 KF5_EXTRA_CMAKE_MODULES_DEPENDENCIES = host-pkgconf
 KF5_EXTRA_CMAKE_MODULES_INSTALL_STAGING = YES
diff --git a/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.mk b/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.mk
index 20fbc102c6..2a782b35e1 100644
--- a/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.mk
+++ b/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.mk
@@ -8,7 +8,7 @@ KF5_MODEMMANAGER_QT_VERSION = $(KF5_VERSION)
 KF5_MODEMMANAGER_QT_SITE = $(KF5_SITE)
 KF5_MODEMMANAGER_QT_SOURCE = modemmanager-qt-$(KF5_MODEMMANAGER_QT_VERSION).tar.xz
 KF5_MODEMMANAGER_QT_LICENSE = LGPL-2.1+
-KF5_MODEMMANAGER_QT_LICENSE_FILE = COPYING.LIB
+KF5_MODEMMANAGER_QT_LICENSE_FILES = COPYING.LIB
 
 KF5_MODEMMANAGER_QT_DEPENDENCIES = kf5-extra-cmake-modules modem-manager qt5base
 KF5_MODEMMANAGER_QT_INSTALL_STAGING = YES
diff --git a/package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.mk b/package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.mk
index 52e70e3c41..c383f98e9b 100644
--- a/package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.mk
+++ b/package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.mk
@@ -8,7 +8,7 @@ KF5_NETWORKMANAGER_QT_VERSION = $(KF5_VERSION)
 KF5_NETWORKMANAGER_QT_SITE = $(KF5_SITE)
 KF5_NETWORKMANAGER_QT_SOURCE = networkmanager-qt-$(KF5_NETWORKMANAGER_QT_VERSION).tar.xz
 KF5_NETWORKMANAGER_QT_LICENSE = LGPL-2.1+
-KF5_NETWORKMANAGER_QT_LICENSE_FILE = COPYING.LIB
+KF5_NETWORKMANAGER_QT_LICENSE_FILES = COPYING.LIB
 
 KF5_NETWORKMANAGER_QT_DEPENDENCIES = kf5-extra-cmake-modules network-manager qt5base
 KF5_NETWORKMANAGER_QT_INSTALL_STAGING = YES
