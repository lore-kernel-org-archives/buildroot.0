From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 21:53:25 +0100
Subject: [Buildroot] [git commit] package/kodi-peripheral-joystick: bump
 version to 1.7.1-Matrix
Message-ID: <20210308072137.D730381607@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=36c3a64ad8faac06eb29637edfa7342103f60798
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch license file to LICENSE.md.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash | 4 ++--
 package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
index d0cac8e4bb..650cab0f2d 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e83c32380a51ea74bd5f0af74afc747ff5de99167934e2644bc2b3438cd998d0  kodi-peripheral-joystick-1.4.9-Leia.tar.gz
-sha256  2bb807179053b1a7795f9952539a394664847f561a9ffa4ccc36d7bb3cddadf9  debian/copyright
+sha256  4dc63c6c5bdad25881eeba800765d97c53b2583addf28e71bbcd67775452ecdb  kodi-peripheral-joystick-1.7.1-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
index 9cce174da1..0fdd4851cf 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_PERIPHERAL_JOYSTICK_VERSION = 1.4.9-Leia
+KODI_PERIPHERAL_JOYSTICK_VERSION = 1.7.1-Matrix
 KODI_PERIPHERAL_JOYSTICK_SITE = $(call github,xbmc,peripheral.joystick,$(KODI_PERIPHERAL_JOYSTICK_VERSION))
 KODI_PERIPHERAL_JOYSTICK_LICENSE = GPL-2.0+
-KODI_PERIPHERAL_JOYSTICK_LICENSE_FILES = debian/copyright
+KODI_PERIPHERAL_JOYSTICK_LICENSE_FILES = LICENSE.md
 KODI_PERIPHERAL_JOYSTICK_DEPENDENCIES = kodi tinyxml udev
 
 $(eval $(cmake-package))
