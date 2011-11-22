From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 22 Nov 2011 10:15:09 +0100
Subject: [Buildroot] [git commit] freetype: security bump to version 2.4.8
Message-ID: <20111122091706.6A6308F5A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f4642c8bae842243f5a98d1d8028ce08d1962612
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump freetype to version 2.4.8 to fix CVE-2011-3439.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/freetype/freetype.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 142a1ec..6eb6b29 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-FREETYPE_VERSION = 2.4.7
+FREETYPE_VERSION = 2.4.8
 FREETYPE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/freetype
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_INSTALL_STAGING = YES
