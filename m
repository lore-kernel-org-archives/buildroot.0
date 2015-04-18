From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Apr 2015 16:29:41 +0200
Subject: [Buildroot] [PATCH 13/61] package/x11r7/xapp_fonttosfnt: bump
	version to 1.0.4, add hash
In-Reply-To: <1429367429-11771-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429367429-11771-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429367429-11771-13-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash |    2 ++
 package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash

diff --git a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash
new file mode 100644
index 0000000..e76c5c8
--- /dev/null
+++ b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2008-May/000543.html
+sha1	a609fba513947e5267c924f85774c0e44a076a7d	fonttosfnt-1.0.4.tar.bz2
diff --git a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
index f935e54..1571a3b 100644
--- a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
+++ b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_FONTTOSFNT_VERSION = 1.0.3
+XAPP_FONTTOSFNT_VERSION = 1.0.4
 XAPP_FONTTOSFNT_SOURCE = fonttosfnt-$(XAPP_FONTTOSFNT_VERSION).tar.bz2
 XAPP_FONTTOSFNT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_FONTTOSFNT_LICENSE = MIT
-- 
1.7.10.4
