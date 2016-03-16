From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 16 Mar 2016 16:43:15 +0100
Subject: [Buildroot] [PATCH 2/2] modem-manager: bump to version 1.4.14
In-Reply-To: <1458142995-23540-1-git-send-email-yegorslists@googlemail.com>
References: <1458142995-23540-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1458142995-23540-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/modem-manager/modem-manager.hash | 2 +-
 package/modem-manager/modem-manager.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
index 585f92a..5299c84 100644
--- a/package/modem-manager/modem-manager.hash
+++ b/package/modem-manager/modem-manager.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  7ef5035375a953b285a742591df0a65fd442f4641ce4d8f4392a41d6d6bc70b3  ModemManager-1.4.12.tar.xz
+sha256  abe6cdd515a774bcba3afdcdb1e504569801e79282ccdf26099f33cbb8731ba2  ModemManager-1.4.14.tar.xz
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 451752c..6d91afc 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MODEM_MANAGER_VERSION = 1.4.12
+MODEM_MANAGER_VERSION = 1.4.14
 MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
 MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
 MODEM_MANAGER_LICENSE = GPLv2+ (programs, plugins), LGPLv2+ (libmm-glib)
-- 
2.1.4
