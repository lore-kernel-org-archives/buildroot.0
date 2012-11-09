From: Alexander Khryukin <alexander@mezon.ru>
Date: Fri,  9 Nov 2012 16:51:27 +0400
Subject: [Buildroot] [PATCH] libarchive version update 3.0.4
Message-ID: <1352465487-23351-1-git-send-email-alexander@mezon.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Alexander Khryukin <alexander@mezon.ru>
---
 package/libarchive/libarchive.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index d25f7f8..b19c725 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -3,7 +3,7 @@
 # libarchive (reusable C library for archive formats)
 #
 #############################################################
-LIBARCHIVE_VERSION = 2.8.5
+LIBARCHIVE_VERSION = 3.0.4
 LIBARCHIVE_SITE = http://libarchive.googlecode.com/files/
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.gz
 LIBARCHIVE_INSTALL_STAGING = YES
-- 
1.7.11.3
