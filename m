From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 30 Mar 2021 21:49:03 +0200
Subject: [Buildroot] [git commit] package/modem-manager: bump version to
 1.16.2
Message-ID: <20210330192413.5454F8A66E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4957e3c129006b67ee19acce4a81f916b8f2d325
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It requires libqmi >= 1.28.0

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/modem-manager/modem-manager.hash | 2 +-
 package/modem-manager/modem-manager.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
index 81a08295f7..3f272acef3 100644
--- a/package/modem-manager/modem-manager.hash
+++ b/package/modem-manager/modem-manager.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  fe1a26ba51b4bda7abd09ad4dadedd87d8b8154809fc9d88e94f75fdfff19295  ModemManager-1.14.8.tar.xz
+sha256  efa9a963499e0885f3f163096d433334143c4937545134ecd682e0157fa591e3  ModemManager-1.16.2.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 47d4eed823..2cc45d266b 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MODEM_MANAGER_VERSION = 1.14.8
+MODEM_MANAGER_VERSION = 1.16.2
 MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
 MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
 MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
