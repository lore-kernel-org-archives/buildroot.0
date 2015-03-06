From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri,  6 Mar 2015 05:46:26 +0100
Subject: [Buildroot] [PATCH 2/2] modem-manager: bump to version 1.4.4
In-Reply-To: <1425617186-14203-1-git-send-email-petr.vorel@gmail.com>
References: <1425617186-14203-1-git-send-email-petr.vorel@gmail.com>
Message-ID: <1425617186-14203-2-git-send-email-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/modem-manager/modem-manager.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 349517d..a6e1b36 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MODEM_MANAGER_VERSION = 1.4.2
+MODEM_MANAGER_VERSION = 1.4.4
 MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
 MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
 MODEM_MANAGER_LICENSE = GPLv2+ (programs, plugins), LGPLv2+ (libmm-glib)
-- 
2.1.4
