From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Sat, 30 Aug 2014 01:01:23 +0200
Subject: [Buildroot] [PATCH 2/2] package/libao: bump to version 1.2.0
Message-ID: <1409353283-19123-1-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/libao/libao.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libao/libao.mk b/package/libao/libao.mk
index 3f7d166..e966ef2 100644
--- a/package/libao/libao.mk
+++ b/package/libao/libao.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBAO_VERSION = 1.1.0
+LIBAO_VERSION = 1.2.0
 LIBAO_SITE = http://downloads.xiph.org/releases/ao
 LIBAO_DEPENDENCIES = host-pkgconf
 LIBAO_INSTALL_STAGING = YES
-- 
2.1.0
