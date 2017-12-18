From: Martin Bark <martin@barkynet.com>
Date: Mon, 18 Dec 2017 18:17:34 +0000
Subject: [Buildroot] [PATCH 1/1] package/nodejs: bump version to 8.9.3
Message-ID: <1513621054-30022-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See https://nodejs.org/en/blog/release/v8.9.3/

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 658f80b..ae50faf 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,2 +1,2 @@
-# From http://nodejs.org/dist/v8.9.1/SHASUMS256.txt
-sha256 ef160c21f60f8aca64145985e01b4044435e381dc16e8f0640ed0223e84f17e0  node-v8.9.1.tar.xz
+# From http://nodejs.org/dist/v8.9.3/SHASUMS256.txt
+sha256 748ddb3baa6b85e6a56e38aacd066586e7581952f84a92bc8152248a9be6b2da  node-v8.9.3.tar.xz
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 9cf26da..4c1deb1 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 8.9.1
+NODEJS_VERSION = 8.9.3
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
-- 
2.7.4
