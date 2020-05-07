From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 May 2020 23:29:37 +0200
Subject: [Buildroot] [git commit branch/next] package/modem-manager: bump
 version to 1.12.8
Message-ID: <20200507211418.1699290F28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4be485fab964dcecd3cfc18b3b346610ea4bb849
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://lists.freedesktop.org/archives/modemmanager-devel/2020-March/007729.html

Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/modem-manager/modem-manager.hash | 2 +-
 package/modem-manager/modem-manager.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
index f9d790cd0c..2fb10368c8 100644
--- a/package/modem-manager/modem-manager.hash
+++ b/package/modem-manager/modem-manager.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  2eb3353ee5518005c51d429308695c69d8c38cf2fd9102b04f785c03a0cc624c  ModemManager-1.12.6.tar.xz
+sha256  68b53d0615ba0d3e2bbf386ed029dfe644a6a30a79ab8d85523527bb4e713aff  ModemManager-1.12.8.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 75fc5811db..78cffe1f9c 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MODEM_MANAGER_VERSION = 1.12.6
+MODEM_MANAGER_VERSION = 1.12.8
 MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
 MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
 MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
