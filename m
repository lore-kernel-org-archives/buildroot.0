From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 11 Jun 2014 19:41:46 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/eudev: Bump version to 1.7
In-Reply-To: <1402508508-437-1-git-send-email-bernd.kuhls@t-online.de>
References: <1402508508-437-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1402508508-437-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/eudev/eudev.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index fc9c7d9..5f1525c 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EUDEV_VERSION = v1.6
+EUDEV_VERSION = v1.7
 EUDEV_SITE = $(call github,gentoo,eudev,$(EUDEV_VERSION))
 EUDEV_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)
 EUDEV_LICENSE_FILES = COPYING
-- 
1.7.10.4
