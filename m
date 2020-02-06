From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  6 Feb 2020 19:19:38 +0100
Subject: [Buildroot] [PATCH 2/4] package/kodi-peripheral-joystick: bump
 version to 1.4.9-Leia
In-Reply-To: <20200206181940.84202-1-bernd.kuhls@t-online.de>
References: <20200206181940.84202-1-bernd.kuhls@t-online.de>
Message-ID: <20200206181940.84202-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switched _LICENSE_FILES to debian/copyright.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-peripheral-joystick/kodi-peripheral-joystick.hash    | 4 ++--
 package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
index af55dc03ec..15397c05cd 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 b6ddefed73582a3dc9bc36a9d40f8309139802ef9cfc130933bd0fe6e569d933  kodi-peripheral-joystick-1.4.8-Leia.tar.gz
-sha256 5f5ee7add3f2c451b387c5a9f39edf33e1cee920871a4863e795d00d27546c33  src/addon.cpp
+sha256 e83c32380a51ea74bd5f0af74afc747ff5de99167934e2644bc2b3438cd998d0  kodi-peripheral-joystick-1.4.9-Leia.tar.gz
+sha256 2bb807179053b1a7795f9952539a394664847f561a9ffa4ccc36d7bb3cddadf9  debian/copyright
diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
index c56cfef43f..9cce174da1 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_PERIPHERAL_JOYSTICK_VERSION = 1.4.8-Leia
+KODI_PERIPHERAL_JOYSTICK_VERSION = 1.4.9-Leia
 KODI_PERIPHERAL_JOYSTICK_SITE = $(call github,xbmc,peripheral.joystick,$(KODI_PERIPHERAL_JOYSTICK_VERSION))
 KODI_PERIPHERAL_JOYSTICK_LICENSE = GPL-2.0+
-KODI_PERIPHERAL_JOYSTICK_LICENSE_FILES = src/addon.cpp
+KODI_PERIPHERAL_JOYSTICK_LICENSE_FILES = debian/copyright
 KODI_PERIPHERAL_JOYSTICK_DEPENDENCIES = kodi tinyxml udev
 
 $(eval $(cmake-package))
-- 
2.20.1
