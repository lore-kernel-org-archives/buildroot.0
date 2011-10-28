From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Oct 2011 14:52:50 +0200
Subject: [Buildroot] [git commit] freetype: security bump to version 2.4.7
Message-ID: <20111028125418.7C8D78F331@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eb8f0522f89c3f679fe73d1acff673110fe38107
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/freetype/freetype.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index fe6e5d6..142a1ec 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -3,11 +3,11 @@
 # freetype
 #
 #############################################################
-FREETYPE_VERSION = 2.4.6
+
+FREETYPE_VERSION = 2.4.7
 FREETYPE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/freetype
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_INSTALL_STAGING = YES
-FREETYPE_INSTALL_TARGET = YES
 FREETYPE_MAKE_OPT = CCexe="$(HOSTCC)"
 FREETYPE_DEPENDENCIES = host-pkg-config $(if $(BR2_PACKAGE_ZLIB),zlib)
 
