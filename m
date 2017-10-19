From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Oct 2017 17:01:52 +0200
Subject: [Buildroot] [git commit branch/2017.08.x] wpa_supplicant: fix
	upstream URL
Message-ID: <20171019145446.24DD68109C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=41ee6daba0bf669597b95be8eebe1cda290fe313
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

wpa_supplicant project URL has been changed to w1.fi/wpa_supplicant.
The old domain epitest.fi has expired.

Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 38e36cd0e1ec55743766e48564d952e38ff40113)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpa_supplicant/Config.in         | 2 +-
 package/wpa_supplicant/wpa_supplicant.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index 0f62916..4b810bf 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_WPA_SUPPLICANT
 	help
 	  WPA supplicant for secure wireless networks
 
-	  http://hostap.epitest.fi/wpa_supplicant/
+	  http://w1.fi/wpa_supplicant/
 
 if BR2_PACKAGE_WPA_SUPPLICANT
 
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index e32c255..da757aa 100644
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
