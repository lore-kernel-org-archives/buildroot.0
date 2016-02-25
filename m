From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 22:29:14 +0100
Subject: [Buildroot] [git commit] wpa_supplicant: correct legal info
Message-ID: <20160225213612.77FBB7F92A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1bd0c377b2b97823d3ec661680f8b2a6a5bbec8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

wpa_supplicant is licensed under BSD-3c only and not dual licensed.

Quoting from COPYING file
 This software was previously distributed under BSD/GPL v2 dual license
 terms that allowed either of those license alternatives to be
 selected. As of February 11, 2012, the project has chosen to use only
 the BSD license option for future distribution. As such, the GPL v2
 license option is no longer used.

Reviewed-by: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wpa_supplicant/wpa_supplicant.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index e3f1434..ba1180d 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -6,7 +6,7 @@
 
 WPA_SUPPLICANT_VERSION = 2.5
 WPA_SUPPLICANT_SITE = http://hostap.epitest.fi/releases
-WPA_SUPPLICANT_LICENSE = GPLv2/BSD-3c
+WPA_SUPPLICANT_LICENSE = BSD-3c
 WPA_SUPPLICANT_LICENSE_FILES = README
 WPA_SUPPLICANT_CONFIG = $(WPA_SUPPLICANT_DIR)/wpa_supplicant/.config
 WPA_SUPPLICANT_SUBDIR = wpa_supplicant
