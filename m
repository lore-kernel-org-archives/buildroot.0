From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 14:20:59 +0100
Subject: [Buildroot] [git commit] package/x11r7/xfont_font-util: bump
	version to 1.3.1
Message-ID: <20150315132246.D7BD2807CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6866c35838ed29ccdd8442c2161580c7a9eaffd4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xfont_font-util/xfont_font-util.hash |    3 +++
 package/x11r7/xfont_font-util/xfont_font-util.mk   |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

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
