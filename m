From: Alexander Mukhin <alexander.i.mukhin@gmail.com>
Date: Thu, 14 Sep 2017 18:11:14 +0300
Subject: [Buildroot] [PATCH] hostapd: fix upstream URL
Message-ID: <20170914151114.2054-1-alexander.i.mukhin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hostapd project URL has been changed to w1.fi/hostapd.
The old domain epitest.fi has expired.

Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
---
 package/hostapd/Config.in  | 2 +-
 package/hostapd/hostapd.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
index cec2a123e..40c7015e7 100644
--- a/package/hostapd/Config.in
+++ b/package/hostapd/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_HOSTAPD
 	  IEEE 802.1X/WPA/WPA2/EAP authenticators, RADIUS client,
 	  EAP server and RADIUS authentication server.
 
-	  http://hostap.epitest.fi/
+	  http://w1.fi/hostapd/
 
 if BR2_PACKAGE_HOSTAPD
 
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 40e28ee67..7edcac89d 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HOSTAPD_VERSION = 2.6
-HOSTAPD_SITE = http://hostap.epitest.fi/releases
+HOSTAPD_SITE = http://w1.fi/releases
 HOSTAPD_SUBDIR = hostapd
 HOSTAPD_CONFIG = $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/.config
 HOSTAPD_DEPENDENCIES = host-pkgconf libnl
-- 
2.11.0
