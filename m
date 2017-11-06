From: Martin Bark <martin@barkynet.com>
Date: Mon,  6 Nov 2017 10:20:49 +0000
Subject: [Buildroot] [PATCH 1/1] package/nodejs: bump version to 9.0.0
Message-ID: <20171106102049.14681-1-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See https://nodejs.org/en/blog/release/v9.0.0/

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 9367c543be..14dde1162b 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,2 +1,2 @@
-# From http://nodejs.org/dist/v8.8.1/SHASUMS256.txt
-sha256 5ce2c47ab779992db49942f757a01cc5131db5cef4e0dd270e48151b0887b57a  node-v8.8.1.tar.xz
+# From http://nodejs.org/dist/v9.0.0/SHASUMS256.txt
+sha256 5b52bd6a90a611a42e11a908022ccfc1c2e77dcc70bfe38054a18dc57a3d5fa5  node-v9.0.0.tar.xz
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index a29f5726cc..f3e532b4ed 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 8.8.1
+NODEJS_VERSION = 9.0.0
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
-- 
2.15.0
