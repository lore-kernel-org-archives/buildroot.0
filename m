From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 23 Jul 2014 06:40:17 +0200
Subject: [Buildroot] [PATCH v15 1/9] xbmc: Bump version to 13.2b2
In-Reply-To: <1406090425-5925-1-git-send-email-bernd.kuhls@t-online.de>
References: <1406090425-5925-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1406090425-5925-2-git-send-email-bernd.kuhls@t-online.de>
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
index 45be990..2a38114 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XBMC_VERSION = 13.1-Gotham
+XBMC_VERSION = 13.2b2-Gotham
 XBMC_SOURCE = $(XBMC_VERSION).tar.gz
 XBMC_SITE = https://github.com/xbmc/xbmc/archive
 XBMC_LICENSE = GPLv2
-- 
1.7.10.4
