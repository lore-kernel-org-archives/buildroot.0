From: Alexander Khryukin <alexander@mezon.ru>
Date: Fri,  9 Nov 2012 16:38:52 +0400
Subject: [Buildroot] [PATCH] libtool version update 2.4.2
Message-ID: <1352464732-22984-1-git-send-email-alexander@mezon.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Alexander Khryukin <alexander@mezon.ru>
---
 package/libtool/libtool.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index 4b9657c..ae7a4b8 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -3,7 +3,7 @@
 # libtool
 #
 #############################################################
-LIBTOOL_VERSION = 2.2.10
+LIBTOOL_VERSION = 2.4.2
 LIBTOOL_SOURCE = libtool-$(LIBTOOL_VERSION).tar.gz
 LIBTOOL_SITE = $(BR2_GNU_MIRROR)/libtool
 LIBTOOL_INSTALL_STAGING = YES
-- 
1.7.11.3
