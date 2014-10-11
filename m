From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Sat, 11 Oct 2014 23:59:07 +0200
Subject: [Buildroot] [PATCH 2/2] package/wpa_supplicant: security bump to
	version 2.3
Message-ID: <1413064747-28640-1-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix CVE-2014-3686: wpa_cli and hostapd_cli action script execution vulnerability
(http://w1.fi/security/2014-1/wpacli-action-scripts.txt)

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/wpa_supplicant/wpa_supplicant.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index f825d86..311262d 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPA_SUPPLICANT_VERSION = 2.2
+WPA_SUPPLICANT_VERSION = 2.3
 WPA_SUPPLICANT_SITE = http://hostap.epitest.fi/releases
 WPA_SUPPLICANT_LICENSE = GPLv2/BSD-3c
 WPA_SUPPLICANT_LICENSE_FILES = README
-- 
2.1.2
