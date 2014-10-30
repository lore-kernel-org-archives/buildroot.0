From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Thu, 30 Oct 2014 10:07:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/nodejs: security bump to version
	0.10.33
Message-ID: <1414660025-16954-1-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This release handles the recent POODLE vulnerability [CVE-2014-3566] by
disabling SSLv2/SSLv3 by default.

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/nodejs/nodejs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 8832ce3..312aaa9 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 0.10.32
+NODEJS_VERSION = 0.10.33
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.gz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs zlib \
-- 
2.1.3
