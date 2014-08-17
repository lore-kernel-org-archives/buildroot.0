From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 18 Aug 2014 00:00:29 +0200
Subject: [Buildroot] [PATCH branch/master] package/xbmc: Bump version to 13.2
Message-ID: <1408312830-16761-1-git-send-email-bernd.kuhls@t-online.de>
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
index eaa21c9..bdd634e 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XBMC_VERSION = 13.2rc1-Gotham
+XBMC_VERSION = 13.2-Gotham
 XBMC_SOURCE = $(XBMC_VERSION).tar.gz
 XBMC_SITE = https://github.com/xbmc/xbmc/archive
 XBMC_LICENSE = GPLv2
-- 
1.7.10.4
