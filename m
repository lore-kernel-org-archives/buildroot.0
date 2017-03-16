From: Martin Bark <martin@barkynet.com>
Date: Thu, 16 Mar 2017 10:28:30 +0000
Subject: [Buildroot] [PATCH 1/1] package/nodejs: bump version to 7.7.3
Message-ID: <1489660110-8914-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See https://nodejs.org/en/blog/release/v7.7.3/

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index f0a4968..e4f3815 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,2 +1,2 @@
-# From upstream URL: http://nodejs.org/dist/v7.7.2/SHASUMS256.txt
-sha256  e7448d8e44d32c2c63347c822508cf5c87b9662c07db290056fec66d37c4f584  node-v7.7.2.tar.xz
+# From upstream URL: http://nodejs.org/dist/v7.7.3/SHASUMS256.txt
+sha256  5441daf11f743b5508ddf31a16b4f268835fbceb59ef709b44e85b03fece0edf  node-v7.7.3.tar.xz
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 0db97e8..ad0b26d 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 7.7.2
+NODEJS_VERSION = 7.7.3
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs zlib \
-- 
2.7.4
