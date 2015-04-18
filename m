From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Apr 2015 21:53:48 +0200
Subject: [Buildroot] [PATCH 03/35] package/x11r7/xdata_xcursor-themes: bump
	version to 1.0.4, add hash
In-Reply-To: <1429386860-16631-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429386860-16631-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429386860-16631-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.hash |    2 ++
 package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.hash

diff --git a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.hash b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.hash
new file mode 100644
index 0000000..e59c848
--- /dev/null
+++ b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2013-July/002271.html
+sha256	e3fd2c05b9df0d88a3d1192c02143295744685f4f9a03db116e206698331bb86	xcursor-themes-1.0.4.tar.bz2
diff --git a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
index 8f3e681..a2987a0 100644
--- a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
+++ b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDATA_XCURSOR_THEMES_VERSION = 1.0.3
+XDATA_XCURSOR_THEMES_VERSION = 1.0.4
 XDATA_XCURSOR_THEMES_SOURCE = xcursor-themes-$(XDATA_XCURSOR_THEMES_VERSION).tar.bz2
 XDATA_XCURSOR_THEMES_SITE = http://xorg.freedesktop.org/releases/individual/data
 XDATA_XCURSOR_THEMES_LICENSE = MIT
-- 
1.7.10.4
