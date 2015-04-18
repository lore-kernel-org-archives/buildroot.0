From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Apr 2015 14:40:36 +0200
Subject: [Buildroot] [PATCH 24/32] package/x11r7/xapp_xlsfonts: bump version
	to 1.0.5, add hash
In-Reply-To: <1429360844-12625-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429360844-12625-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429360844-12625-24-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xlsfonts/xapp_xlsfonts.hash |    2 ++
 package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/x11r7/xapp_xlsfonts/xapp_xlsfonts.hash

diff --git a/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.hash b/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.hash
new file mode 100644
index 0000000..f3a2603
--- /dev/null
+++ b/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-April/002580.html
+sha256	40295bec35077cee93be2e4c26cc00268ed6ace779ae6e97766a866c1e3927fa	xlsfonts-1.0.5.tar.bz2
diff --git a/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk b/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
index f642d14..1c42a61 100644
--- a/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
+++ b/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XLSFONTS_VERSION = 1.0.4
+XAPP_XLSFONTS_VERSION = 1.0.5
 XAPP_XLSFONTS_SOURCE = xlsfonts-$(XAPP_XLSFONTS_VERSION).tar.bz2
 XAPP_XLSFONTS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XLSFONTS_LICENSE = MIT
-- 
1.7.10.4
