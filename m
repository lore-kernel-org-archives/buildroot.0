From: Mark Jackson <mpfj-list@mimc.co.uk>
Date: Wed, 12 Sep 2012 11:32:30 +0100
Subject: [Buildroot] [PATCH v2] wpa_supplicant: add license information
Message-ID: <505064BE.6030109@mimc.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

v2 - license type is GPLv2/BSD-3c as pointed out by Baruch Siach

Signed-off-by: Mark Jackson <mpfj@newflow.co.uk>
---
 package/wpa_supplicant/wpa_supplicant.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 9d957ea..d8c916b 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -6,6 +6,8 @@

 WPA_SUPPLICANT_VERSION = 1.0
 WPA_SUPPLICANT_SITE = http://hostap.epitest.fi/releases
+WPA_SUPPLICANT_LICENSE = GPLv2/BSD-3c
+WPA_SUPPLICANT_LICENSE_FILES = README
 WPA_SUPPLICANT_CONFIG = $(WPA_SUPPLICANT_DIR)/wpa_supplicant/.config
 WPA_SUPPLICANT_SUBDIR = wpa_supplicant
 WPA_SUPPLICANT_DBUS_SERVICE = fi.epitest.hostap.WPASupplicant
-- 
1.7.9.5
