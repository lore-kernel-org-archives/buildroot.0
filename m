From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 May 2014 22:47:08 +0200
Subject: [Buildroot] [git commit] fontconfig: bump to version 2.11.1
Message-ID: <20140601083246.B70B89C779@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8785a4723de9db293364faffd3de6d99d3a0bf3e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes misinstallation of xfont_font-bh-ttf-1.0.3/42-luxi-mono.conf to
'target at baseconfigdir@/conf.avail/42-luxi-mono.conf'
instead of proper place in the target directory (because of buggy
fontconfig.pc file).

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fontconfig/fontconfig.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
