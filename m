From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  6 Jan 2018 18:25:31 +0100
Subject: [Buildroot] [PATCH 4/4] package/kodi-peripheral-joystick: bump
 version to v1.3.4
In-Reply-To: <20180106172531.7806-1-bernd.kuhls@t-online.de>
References: <20180106172531.7806-1-bernd.kuhls@t-online.de>
Message-ID: <20180106172531.7806-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash | 2 +-
 package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
index ca2bdc378c..728c3cac53 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 c2025c4ec280b44b5d8bb1c34185a94cc105f66f0b762087804bb7d2d633d999  kodi-peripheral-joystick-v1.3.2.tar.gz
+sha256 9a183e1f92ff2c68816bfa0056c65585a3e1129d924326359d7a5dfbcba6c56a  kodi-peripheral-joystick-v1.3.4.tar.gz
diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
index f0cad13a27..2fadbcc210 100644
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
-- 
2.11.0
