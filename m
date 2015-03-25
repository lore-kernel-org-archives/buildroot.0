From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 25 Mar 2015 21:41:16 +0100
Subject: [Buildroot] [PATCH] modem-manager: bump to 1.4.6
Message-ID: <1427316076-7701-1-git-send-email-yegorslists@googlemail.com>
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
index 20376b2..7ee5dc8 100644
--- a/package/modem-manager/modem-manager.hash
+++ b/package/modem-manager/modem-manager.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  1bf88861259772dc81e864e2faccfff0590d41676451a128c5f4e73550dd14d8  ModemManager-1.4.4.tar.xz
+sha256  0cedabf46310f8c56630b116944f54ee64369c76c2f35f5f460ca19a8bb5a5cd  ModemManager-1.4.6.tar.xz
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index a6e1b36..e8aefb4 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MODEM_MANAGER_VERSION = 1.4.4
+MODEM_MANAGER_VERSION = 1.4.6
 MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
 MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
 MODEM_MANAGER_LICENSE = GPLv2+ (programs, plugins), LGPLv2+ (libmm-glib)
-- 
2.1.0
