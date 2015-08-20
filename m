From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 20 Aug 2015 20:02:47 +0200
Subject: [Buildroot] [PATCH/next 3/4] package/kodi: bump to version
	15.1-Isengard
In-Reply-To: <1440093768-18254-1-git-send-email-bernd.kuhls@t-online.de>
References: <1440093768-18254-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1440093768-18254-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/kodi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 6399ff1..d91073f 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VERSION = 15.0-Isengard
+KODI_VERSION = 15.1-Isengard
 KODI_SITE = $(call github,xbmc,xbmc,$(KODI_VERSION))
 KODI_LICENSE = GPLv2
 KODI_LICENSE_FILES = LICENSE.GPL
-- 
2.1.4
