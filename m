From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Apr 2016 19:24:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi-addon-xvdr: mark as deprecated
Message-ID: <1461518645-4761-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

According to the github project page:
https://github.com/pipelka/xbmc-addon-xvdr
this package is discontinued.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-addon-xvdr/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kodi-addon-xvdr/Config.in b/package/kodi-addon-xvdr/Config.in
index 6e713af..14f4074 100644
--- a/package/kodi-addon-xvdr/Config.in
+++ b/package/kodi-addon-xvdr/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_KODI_ADDON_XVDR
 	bool "kodi-addon-xvdr"
+	depends on BR2_DEPRECATED_SINCE_2016_05
 	help
 	  This is a PVR add-on for Kodi to add VDR (http://tvdr.de/)
 	  as a TV/PVR Backend to Kodi.
-- 
2.8.0.rc3
