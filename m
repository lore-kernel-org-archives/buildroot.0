From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 30 May 2014 00:31:32 +0200
Subject: [Buildroot] [PATCH] fontconfig: bump to version 2.11.1
Message-ID: <1401402692-12744-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes misinstallation of xfont_font-bh-ttf-1.0.3/42-luxi-mono.conf to
'target at baseconfigdir@/conf.avail/42-luxi-mono.conf'
instead of proper place in the target directory (because of buggy
fontconfig.pc file).

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/fontconfig/fontconfig.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index f6b238a..a4128be 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FONTCONFIG_VERSION = 2.11.0
+FONTCONFIG_VERSION = 2.11.1
 FONTCONFIG_SITE = http://fontconfig.org/release
 FONTCONFIG_INSTALL_STAGING = YES
 FONTCONFIG_DEPENDENCIES = freetype expat host-pkgconf
-- 
1.8.1.4
