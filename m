From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 28 Oct 2015 01:31:22 +0100
Subject: [Buildroot] [PATCH 1/1] modem-manager: bump to version 1.4.12
Message-ID: <1445992282-21975-1-git-send-email-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/modem-manager/modem-manager.hash | 2 +-
 package/modem-manager/modem-manager.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
index e3b6ae6..585f92a 100644
--- a/package/modem-manager/modem-manager.hash
+++ b/package/modem-manager/modem-manager.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  107ba0b4d0749aebb0347691a39f60891cc6004aeca8b2128d69c50557049a63  ModemManager-1.4.10.tar.xz
+sha256  7ef5035375a953b285a742591df0a65fd442f4641ce4d8f4392a41d6d6bc70b3  ModemManager-1.4.12.tar.xz
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 36c8c0d..f38dee3 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MODEM_MANAGER_VERSION = 1.4.10
+MODEM_MANAGER_VERSION = 1.4.12
 MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
 MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
 MODEM_MANAGER_LICENSE = GPLv2+ (programs, plugins), LGPLv2+ (libmm-glib)
-- 
1.8.0
