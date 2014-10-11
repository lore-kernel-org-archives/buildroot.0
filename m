From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Sat, 11 Oct 2014 23:56:33 +0200
Subject: [Buildroot] [PATCH 1/2] package/hostapd: security bump to version
	2.3
Message-ID: <1413064597-28476-1-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix CVE-2014-3686: wpa_cli and hostapd_cli action script execution vulnerability
(http://w1.fi/security/2014-1/wpacli-action-scripts.txt)

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/hostapd/hostapd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 90f2e96..dec9ef8 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HOSTAPD_VERSION = 2.2
+HOSTAPD_VERSION = 2.3
 HOSTAPD_SITE = http://hostap.epitest.fi/releases
 HOSTAPD_SUBDIR = hostapd
 HOSTAPD_CONFIG = $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/.config
-- 
2.1.2
