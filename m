From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 15:17:45 +0100
Subject: [Buildroot] [git commit] package/kodi-peripheral-joystick: bump
 version to v1.3.4
Message-ID: <20180107144905.B11BC802F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f1b91e4cafc6e8f9f514bd97b6b17401d2ea2dc6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash | 2 +-
 package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
index ca2bdc3..728c3ca 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 c2025c4ec280b44b5d8bb1c34185a94cc105f66f0b762087804bb7d2d633d999  kodi-peripheral-joystick-v1.3.2.tar.gz
+sha256 9a183e1f92ff2c68816bfa0056c65585a3e1129d924326359d7a5dfbcba6c56a  kodi-peripheral-joystick-v1.3.4.tar.gz
diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
index f0cad13..2fadbcc 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PERIPHERAL_JOYSTICK_VERSION = v1.3.2
+KODI_PERIPHERAL_JOYSTICK_VERSION = v1.3.4
 KODI_PERIPHERAL_JOYSTICK_SITE = $(call github,xbmc,peripheral.joystick,$(KODI_PERIPHERAL_JOYSTICK_VERSION))
 KODI_PERIPHERAL_JOYSTICK_LICENSE = GPL-2.0+
 KODI_PERIPHERAL_JOYSTICK_LICENSE_FILES = src/addon.cpp
