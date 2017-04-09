From: Martin Bark <martin@barkynet.com>
Date: Sun,  9 Apr 2017 19:31:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/nodejs: bump version to 7.8.0
Message-ID: <1491762670-24016-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See https://nodejs.org/en/blog/release/v7.8.0/

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index e4f3815..c5e7d14 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,2 +1,2 @@
-# From upstream URL: http://nodejs.org/dist/v7.7.3/SHASUMS256.txt
-sha256  5441daf11f743b5508ddf31a16b4f268835fbceb59ef709b44e85b03fece0edf  node-v7.7.3.tar.xz
+# From upstream URL: http://nodejs.org/dist/v7.8.0/SHASUMS256.txt
+sha256  6821aaee58bbc8bc8d08fec6989a42278b725a21382500dc20fd9d9f71398f02  node-v7.8.0.tar.xz
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index ad0b26d..24672ed 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 7.7.3
+NODEJS_VERSION = 7.8.0
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs zlib \
-- 
2.7.4
