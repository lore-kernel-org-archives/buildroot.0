From: Jordi Llonch <jordi.llonch@rochsystems.com>
Date: Tue,  5 Aug 2014 07:07:26 +0000
Subject: [Buildroot] [PATCH 1/1] nodejs: updated to 0.10.30
Message-ID: <1407222446-11231-1-git-send-email-jordi.llonch@rochsystems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jordi Llonch <jordi.llonch@rochsystems.com>
---
 package/nodejs/nodejs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index a85384e..d59fb57 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 0.10.12
+NODEJS_VERSION = 0.10.30
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.gz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs \
-- 
1.9.1
