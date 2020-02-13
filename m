From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Feb 2020 18:10:07 +0100
Subject: [Buildroot] [git commit] package/modem-manager: bump to version
 1.12.6
Message-ID: <20200213170142.90FE98DE61@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a29bd9775ed8aa455a48ad39be4af038bfdb68c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.freedesktop.org/archives/modemmanager-devel/2020-February/007713.html

Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/modem-manager/modem-manager.hash | 2 +-
 package/modem-manager/modem-manager.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
index ef2fe9c08f..f9d790cd0c 100644
--- a/package/modem-manager/modem-manager.hash
+++ b/package/modem-manager/modem-manager.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  852d61755e0c1a8d0c609b17192d742b324fdd2e513f3ed64b228befb859a95b  ModemManager-1.12.4.tar.xz
+sha256  2eb3353ee5518005c51d429308695c69d8c38cf2fd9102b04f785c03a0cc624c  ModemManager-1.12.6.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 3fc7337eb3..75fc5811db 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MODEM_MANAGER_VERSION = 1.12.4
+MODEM_MANAGER_VERSION = 1.12.6
 MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
 MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
 MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
