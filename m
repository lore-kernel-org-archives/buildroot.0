From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 15 Jul 2012 10:47:42 -0300
Subject: [Buildroot] [PATCH 3/6] freetype: bump to version 2.4.10
In-Reply-To: <1342360065-10106-1-git-send-email-gustavo@zacarias.com.ar>
References: <1342360065-10106-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1342360065-10106-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/freetype/freetype.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index ded10d2..f351fd2 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-FREETYPE_VERSION = 2.4.9
+FREETYPE_VERSION = 2.4.10
 FREETYPE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/freetype
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_INSTALL_STAGING = YES
-- 
1.7.8.6
