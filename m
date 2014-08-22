From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 22 Aug 2014 22:24:41 +0200
Subject: [Buildroot] [PATCH 2/3] modem-manager: bump to 1.4.0
In-Reply-To: <1408739082-18284-1-git-send-email-yegorslists@googlemail.com>
References: <1408739082-18284-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1408739082-18284-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/modem-manager/modem-manager.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index cc495f7..691504e 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MODEM_MANAGER_VERSION = 1.2.0
+MODEM_MANAGER_VERSION = 1.4.0
 MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
 MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
 MODEM_MANAGER_LICENSE = GPLv2+ (programs, plugins), LGPLv2+ (libmm-glib)
-- 
1.8.3.2
