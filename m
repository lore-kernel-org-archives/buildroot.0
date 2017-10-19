From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Oct 2017 17:01:18 +0200
Subject: [Buildroot] [git commit branch/2017.08.x] hostapd: fix upstream URL
Message-ID: <20171019145445.EB1F88109C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d9e8fe08d7a274a7cfff5ecb4772b71767dd1c56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

hostapd project URL has been changed to w1.fi/hostapd.
The old domain epitest.fi has expired.

Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 8a2396b90aeb411a856335d976a427eed6e115bc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hostapd/Config.in  | 2 +-
 package/hostapd/hostapd.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
index 62fbb66..1609d0d 100644
--- a/package/hostapd/Config.in
+++ b/package/hostapd/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_HOSTAPD
 	  IEEE 802.1X/WPA/WPA2/EAP authenticators, RADIUS client,
 	  EAP server and RADIUS authentication server.
 
-	  http://hostap.epitest.fi/
+	  http://w1.fi/hostapd/
 
 if BR2_PACKAGE_HOSTAPD
 
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index dc28d13..9745d1f 100644
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
