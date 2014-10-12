From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 09:15:56 +0200
Subject: [Buildroot] [git commit] package/hostapd: security bump to version
	2.3
Message-ID: <20141012072420.87D5BB1909@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=96ffe2deeceb9774007685fb334f9990c37e695c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2014-3686: wpa_cli and hostapd_cli action script execution vulnerability
(http://w1.fi/security/2014-1/wpacli-action-scripts.txt)

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hostapd/hostapd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
