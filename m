From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@openwide.fr>
Date: Tue,  7 May 2013 18:46:43 +0200
Subject: [Buildroot] [PATCH 1/2] libtool : bump to version 2.4.2
Message-ID: <1367945204-11287-1-git-send-email-jeremy.rosen@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
---
 package/libtool/libtool.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index 6f0b904..25cd89d 100644
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
1.7.10.4
