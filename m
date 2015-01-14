From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 14 Jan 2015 22:50:23 +0100
Subject: [Buildroot] [PATCH 1/3] modem-manager: bump to 1.4.2
Message-ID: <1421272225-5076-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash file.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/modem-manager/modem-manager.hash | 2 ++
 package/modem-manager/modem-manager.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/modem-manager/modem-manager.hash

diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
new file mode 100644
index 0000000..eae148f
--- /dev/null
+++ b/package/modem-manager/modem-manager.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  07d332fbe6f45f788f740810951e04042aaf023bd5ecf8ef0b3a06e37703585d  ModemManager-1.4.2.tar.xz
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 1c554a2..349517d 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MODEM_MANAGER_VERSION = 1.4.0
+MODEM_MANAGER_VERSION = 1.4.2
 MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
 MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
 MODEM_MANAGER_LICENSE = GPLv2+ (programs, plugins), LGPLv2+ (libmm-glib)
-- 
2.1.0
