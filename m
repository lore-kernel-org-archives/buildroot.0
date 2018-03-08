From: Martin Bark <martin@barkynet.com>
Date: Thu,  8 Mar 2018 16:16:38 +0000
Subject: [Buildroot] [PATCH 1/4] package/nodejs: bump version to 8.10.0
Message-ID: <1520525801-23577-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See https://nodejs.org/en/blog/release/v8.10.0/

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 107a24f..4adef79 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,2 +1,2 @@
-# From http://nodejs.org/dist/v8.9.4/SHASUMS256.txt
-sha256 6cdcde9c9c1ca9f450a0b24eafa229ca759e576daa0fae892ce74d541ecdc86f  node-v8.9.4.tar.xz
+# From http://nodejs.org/dist/v8.10.0/SHASUMS256.txt
+sha256 b72d4e71618d6bcbd039b487b51fa7543631a4ac3331d7caf69bdf55b5b2901a  node-v8.10.0.tar.xz
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index a72b9a7..e1dd11c 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 8.9.4
+NODEJS_VERSION = 8.10.0
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
-- 
2.7.4
