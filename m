From: Aleksander Morgado <aleksander@aleksander.es>
Date: Thu, 12 Dec 2019 15:01:47 +0100
Subject: [Buildroot] [PATCH v2] modem-manager: bump to version 1.12.2
Message-ID: <20191212140147.2972668-1-aleksander@aleksander.es>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
---

Hey!

This new v2 patch drops the patch that was modifying the link order of some libraries, because the correct fix was already included in the 1.12.2 release.

Cheers!

---
 package/modem-manager/modem-manager.hash | 2 +-
 package/modem-manager/modem-manager.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
index b1fef98fe2..a3925bb4a2 100644
--- a/package/modem-manager/modem-manager.hash
+++ b/package/modem-manager/modem-manager.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  3daca86164145fffb589939433f596c13fa077c9a187c0d5820fdd5b4e4a6424  ModemManager-1.12.0.tar.xz
+sha256  4f76d2bdd0ed6780837cdde886eaf535f9770f9daa1ff92e63658d06aa5d25ea  ModemManager-1.12.2.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index b5aa7914f6..2f198a355a 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-MODEM_MANAGER_VERSION = 1.12.0
+MODEM_MANAGER_VERSION = 1.12.2
 MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
 MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
 MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
--
2.24.0
