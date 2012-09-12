From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 12 Sep 2012 23:32:58 +0200
Subject: [Buildroot] [git commit] wpa_supplicant: add license information
Message-ID: <20120912213355.6489E99603@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c8573284cd9ee0f93cd9740fd6472d09357ffb91
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

v2 - license type is GPLv2/BSD-3c as pointed out by Baruch Siach

Signed-off-by: Mark Jackson <mpfj@newflow.co.uk>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/wpa_supplicant/wpa_supplicant.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
