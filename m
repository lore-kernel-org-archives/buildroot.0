From: Mark Jackson <mpfj-list@mimc.co.uk>
Date: Wed, 12 Sep 2012 10:30:11 +0100
Subject: [Buildroot] [PATCH] wpa_supplicant: add license information
Message-ID: <50505623.7000903@mimc.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mark Jackson <mpfj@newflow.co.uk>
---
 package/wpa_supplicant/wpa_supplicant.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 9d957ea..34c5a0b 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -6,6 +6,8 @@

 WPA_SUPPLICANT_VERSION = 1.0
 WPA_SUPPLICANT_SITE = http://hostap.epitest.fi/releases
+WPA_SUPPLICANT_LICENSE = GPLv2
+WPA_SUPPLICANT_LICENSE_FILES = COPYING
 WPA_SUPPLICANT_CONFIG = $(WPA_SUPPLICANT_DIR)/wpa_supplicant/.config
 WPA_SUPPLICANT_SUBDIR = wpa_supplicant
 WPA_SUPPLICANT_DBUS_SERVICE = fi.epitest.hostap.WPASupplicant
-- 
1.7.9.5
