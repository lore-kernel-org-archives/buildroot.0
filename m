From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Wed, 17 Sep 2014 09:22:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/nodejs: bump to version 0.10.32
Message-ID: <1410938530-5486-1-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/nodejs/nodejs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index ba425bb..1fe6dd7 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 0.10.31
+NODEJS_VERSION = 0.10.32
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.gz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs zlib \
-- 
2.1.0
