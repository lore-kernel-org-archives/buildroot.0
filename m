From: Alexander Mukhin <alexander.i.mukhin@gmail.com>
Date: Wed, 18 Oct 2017 12:34:06 +0300
Subject: [Buildroot] [PATCH] wpa_supplicant: fix upstream URL
In-Reply-To: <87d15nxr0o.fsf@dell.be.48ers.dk>
References: <87d15nxr0o.fsf@dell.be.48ers.dk>
Message-ID: <20171018093406.1264-1-alexander.i.mukhin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

wpa_supplicant project URL has been changed to w1.fi/wpa_supplicant.
The old domain epitest.fi has expired.

Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
---
 package/wpa_supplicant/Config.in         | 2 +-
 package/wpa_supplicant/wpa_supplicant.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index 0f629169e6..4b810bf1a8 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_WPA_SUPPLICANT
 	help
 	  WPA supplicant for secure wireless networks
 
-	  http://hostap.epitest.fi/wpa_supplicant/
+	  http://w1.fi/wpa_supplicant/
 
 if BR2_PACKAGE_WPA_SUPPLICANT
 
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index e32c2557c8..da757aaab0 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 WPA_SUPPLICANT_VERSION = 2.6
-WPA_SUPPLICANT_SITE = http://hostap.epitest.fi/releases
+WPA_SUPPLICANT_SITE = http://w1.fi/releases
 WPA_SUPPLICANT_PATCH = \
 	http://w1.fi/security/2017-1/rebased-v2.6-0001-hostapd-Avoid-key-reinstallation-in-FT-handshake.patch \
 	http://w1.fi/security/2017-1/rebased-v2.6-0002-Prevent-reinstallation-of-an-already-in-use-group-ke.patch \
-- 
2.11.0
