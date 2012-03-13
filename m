From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 13 Mar 2012 13:09:07 +0100
Subject: [Buildroot] [git commit] freetype: security bump to version 2.4.9
Message-ID: <20120313120914.3347290D5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fbc242d78803a940f771d19f08e6a6959a4e7608
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump freetype to version 2.4.9 to fix:
CVE-2012-1126, CVE-2012-1127, CVE-2012-1128, CVE-2012-1129,
CVE-2012-1130, CVE-2012-1131, CVE-2012-1132, CVE-2012-1133,
CVE-2012-1134, CVE-2012-1135, CVE-2012-1136, CVE-2012-1137,
CVE-2012-1138, CVE-2012-1139, CVE-2012-1140, CVE-2012-1141,
CVE-2012-1142, CVE-2012-1143, and CVE 2012-1144.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/freetype/freetype.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 32099da..ded10d2 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-FREETYPE_VERSION = 2.4.8
+FREETYPE_VERSION = 2.4.9
 FREETYPE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/freetype
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_INSTALL_STAGING = YES
