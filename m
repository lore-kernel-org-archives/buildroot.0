From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 22 Dec 2010 23:47:28 +0100
Subject: [Buildroot] [git commit master 1/1] freetype: bump to version 2.4.4
Message-ID: <20101222232248.1B9FC8E20B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1fdd8100b6d7f5146c62116b44c3175db284265e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See http://www.freetype.org/index2.html#release-freetype-2.4.4

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/freetype/freetype.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index c7e5c32..ad4292f 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -3,7 +3,7 @@
 # freetype
 #
 #############################################################
-FREETYPE_VERSION = 2.3.12
+FREETYPE_VERSION = 2.4.4
 FREETYPE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/freetype
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_INSTALL_STAGING = YES
-- 
1.7.2.2
