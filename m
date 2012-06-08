From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  8 Jun 2012 12:30:43 -0300
Subject: [Buildroot] [PATCH 4/7] zlib: bump to version 1.2.7
In-Reply-To: <1339169446-26972-1-git-send-email-gustavo@zacarias.com.ar>
References: <1339169446-26972-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1339169446-26972-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/zlib/zlib.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index eca98b8..8f7a18e 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-ZLIB_VERSION = 1.2.6
+ZLIB_VERSION = 1.2.7
 ZLIB_SOURCE =zlib-$(ZLIB_VERSION).tar.bz2
 ZLIB_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libpng
 ZLIB_INSTALL_STAGING = YES
-- 
1.7.3.4
