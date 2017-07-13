From: Martin Bark <martin@barkynet.com>
Date: Thu, 13 Jul 2017 13:24:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/nodejs: bump version to 8.1.4
Message-ID: <1499948671-11899-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See https://nodejs.org/en/blog/release/v8.1.4/

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 989616c..93aa6a1 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,2 +1,2 @@
-# From upstream URL: http://nodejs.org/dist/v8.1.2/SHASUMS256.txt
-sha256  ac190c1964ee0c28d4c163c0ccbb47435b2e4bd9b4c065b74a93373105c574b3  node-v8.1.2.tar.xz
+# From upstream URL: http://nodejs.org/dist/v8.1.4/SHASUMS256.txt
+sha256  a83c86445f79749c46fd4f2c4e681a3e5bb51b2bde5dc7aed1dc38e4e242c301  node-v8.1.4.tar.xz
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index fdb856c..43c5ff3 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 8.1.2
+NODEJS_VERSION = 8.1.4
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs zlib \
-- 
2.7.4
