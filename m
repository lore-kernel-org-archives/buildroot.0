From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Oct 2019 23:26:45 +0200
Subject: [Buildroot] [git commit] package/modem-manager: bump to version
 1.10.6
Message-ID: <20191014214037.259378E078@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ab55a28e162380d30a8e959f31292a6bb65c3ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/modem-manager/modem-manager.hash | 2 +-
 package/modem-manager/modem-manager.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
index 8cc85b1a3c..29ef47b036 100644
--- a/package/modem-manager/modem-manager.hash
+++ b/package/modem-manager/modem-manager.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  fa556bb4ba1f1478e709b71151b4de8f7d136d80e51c64e887fc1fd8926cdc70  ModemManager-1.10.4.tar.xz
+sha256  3c2ca73782215664141042422759899ca9846440fc26d6223c7cf7ea4dd3c996  ModemManager-1.10.6.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index d1234adb76..dde841b80a 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MODEM_MANAGER_VERSION = 1.10.4
+MODEM_MANAGER_VERSION = 1.10.6
 MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
 MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
 MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
