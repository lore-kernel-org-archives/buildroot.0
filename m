From: Frederic Bassaler <frederic.bassaler@gmail.com>
Date: Thu, 11 Aug 2011 15:11:03 +0200
Subject: [Buildroot] [PATCH] freetype: bump to 2.4.6
Message-ID: <20110811151103.20c552cb@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Security update.

Signed-off-by: Frederic Bassaler <frederic.bassaler@gmail.com>
---
 package/freetype/freetype.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index ad4292f..90ba373 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -3,7 +3,7 @@
 # freetype
 #
 #############################################################
-FREETYPE_VERSION = 2.4.4
+FREETYPE_VERSION = 2.4.6
 FREETYPE_SITE =
http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/freetype
FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
FREETYPE_INSTALL_STAGING = YES
-- 
1.7.2.3
