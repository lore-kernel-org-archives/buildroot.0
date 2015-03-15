From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 15 Mar 2015 12:19:18 +0100
Subject: [Buildroot] [PATCH 09/14] package/x11r7/xfont_font-util: bump
	version to 1.3.1
In-Reply-To: <1426418363-22738-1-git-send-email-bernd.kuhls@t-online.de>
References: <1426418363-22738-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1426418363-22738-9-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xfont_font-util/xfont_font-util.hash |    3 +++
 package/x11r7/xfont_font-util/xfont_font-util.mk   |    2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 package/x11r7/xfont_font-util/xfont_font-util.hash

diff --git a/package/x11r7/xfont_font-util/xfont_font-util.hash b/package/x11r7/xfont_font-util/xfont_font-util.hash
new file mode 100644
index 0000000..04ada91
--- /dev/null
+++ b/package/x11r7/xfont_font-util/xfont_font-util.hash
@@ -0,0 +1,3 @@
+# From http://lists.x.org/archives/xorg-announce/2015-March/002546.html
+sha1	0b16add3637c64b0bbaf1dd223b71b0421100c20				font-util-1.3.1.tar.bz2
+sha256	aa7ebdb0715106dd255082f2310dbaa2cd7e225957c2a77d719720c7cc92b921	font-util-1.3.1.tar.bz2
diff --git a/package/x11r7/xfont_font-util/xfont_font-util.mk b/package/x11r7/xfont_font-util/xfont_font-util.mk
index 946bb02..1c43d6a 100644
--- a/package/x11r7/xfont_font-util/xfont_font-util.mk
+++ b/package/x11r7/xfont_font-util/xfont_font-util.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_UTIL_VERSION = 1.3.0
+XFONT_FONT_UTIL_VERSION = 1.3.1
 XFONT_FONT_UTIL_SOURCE = font-util-$(XFONT_FONT_UTIL_VERSION).tar.bz2
 XFONT_FONT_UTIL_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_UTIL_LICENSE = MIT/BSD-2c
-- 
1.7.10.4
