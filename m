From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 7 Sep 2011 21:34:48 +0200
Subject: [Buildroot] [git commit] freetype: bump to 2.4.6
Message-ID: <20110907194909.ACE308CA38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d2f84e1623183aabc63f84c7105bf958c0a90914
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Security update.

Signed-off-by: Frederic Bassaler <frederic.bassaler@gmail.com>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
 FREETYPE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/freetype
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_INSTALL_STAGING = YES
-- 
1.7.3.4
