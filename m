From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 09:16:49 +0200
Subject: [Buildroot] [git commit] package/wpa_supplicant: security bump to
	version 2.3
Message-ID: <20141012072420.90384B1909@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b55f718cbcd763e7219191300ad358d0cb3e288c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2014-3686: wpa_cli and hostapd_cli action script execution vulnerability
(http://w1.fi/security/2014-1/wpacli-action-scripts.txt)

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpa_supplicant/wpa_supplicant.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
