From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat, 18 Jul 2015 23:24:45 +0200
Subject: [Buildroot] [PATCH] modem-manager: bump to 1.4.10
Message-ID: <1437254685-20156-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/modem-manager/modem-manager.hash | 2 +-
 package/modem-manager/modem-manager.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
index 5935cba..e3b6ae6 100644
--- a/package/modem-manager/modem-manager.hash
+++ b/package/modem-manager/modem-manager.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  d951eaffbe513bcde54f90602c6c423a49593f656d6485ba95f6fcb4bc1e8003  ModemManager-1.4.8.tar.xz
+sha256  107ba0b4d0749aebb0347691a39f60891cc6004aeca8b2128d69c50557049a63  ModemManager-1.4.10.tar.xz
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 97dddfe..0e6b36a 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MODEM_MANAGER_VERSION = 1.4.8
+MODEM_MANAGER_VERSION = 1.4.10
 MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
 MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
 MODEM_MANAGER_LICENSE = GPLv2+ (programs, plugins), LGPLv2+ (libmm-glib)
-- 
2.1.0
