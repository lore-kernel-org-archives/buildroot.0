From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump font-winitzki-cyrillic to 1.0.1
Message-ID: <20100308133713.166B0776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=cdca8d6a23cb590fe81cbc396237e7cd29fb17fb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 .../x11r7/xfont_font-winitzki-cyrillic/Config.in   |    2 +-
 .../xfont_font-winitzki-cyrillic.mk                |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xfont_font-winitzki-cyrillic/Config.in b/package/x11r7/xfont_font-winitzki-cyrillic/Config.in
index f88e93f..4d321df 100644
--- a/package/x11r7/xfont_font-winitzki-cyrillic/Config.in
+++ b/package/x11r7/xfont_font-winitzki-cyrillic/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_WINITZKI_CYRILLIC
 	bool "font-winitzki-cyrillic"
 	help
-	  font-winitzki-cyrillic 1.0.0
+	  font-winitzki-cyrillic 1.0.1
 	  No description available
diff --git a/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk b/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
index 1a062fe..4578236 100644
--- a/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
+++ b/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_WINITZKI_CYRILLIC_VERSION = 1.0.0
+XFONT_FONT_WINITZKI_CYRILLIC_VERSION = 1.0.1
 XFONT_FONT_WINITZKI_CYRILLIC_SOURCE = font-winitzki-cyrillic-$(XFONT_FONT_WINITZKI_CYRILLIC_VERSION).tar.bz2
 XFONT_FONT_WINITZKI_CYRILLIC_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_WINITZKI_CYRILLIC_AUTORECONF = NO
-- 
1.6.3.3
