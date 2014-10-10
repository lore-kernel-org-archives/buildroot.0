From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Fri, 10 Oct 2014 17:01:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/wpa_supplicant: bump to version 2.3
Message-ID: <1412953288-8939-1-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
