From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 13 Aug 2014 07:03:26 +0200
Subject: [Buildroot] [PATCH] package/xbmc: Bump version to 13.2rc1
Message-ID: <1407906206-7513-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xbmc/xbmc.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index a7c8080..eaa21c9 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XBMC_VERSION = 13.2b3-Gotham
+XBMC_VERSION = 13.2rc1-Gotham
 XBMC_SOURCE = $(XBMC_VERSION).tar.gz
 XBMC_SITE = https://github.com/xbmc/xbmc/archive
 XBMC_LICENSE = GPLv2
-- 
1.7.10.4
