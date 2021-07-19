From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 19 Jul 2021 04:05:23 -0600
Subject: [Buildroot] [PATCH 1/1] package/nodejs: bump to version 12.22.3
Message-ID: <20210719100523.3553404-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 1e03587715..d94942e7c0 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From https://nodejs.org/dist/v12.22.1/SHASUMS256.txt
-sha256  dd650df7773a6ed3e390320ba51ef33cba6499f0e9397709ea3d1debdcbcb989  node-v12.22.1.tar.xz
+# From https://nodejs.org/dist/v12.22.3/SHASUMS256.txt
+sha256  350211fae3a688f41889680c8efcf689353a2e36b62b9dc2b408340986857190  node-v12.22.3.tar.xz
 
 # Hash for license file
 sha256  221417a7ca275112a5ac54639b36ee3c5184e74631ea1e1b01b701293b655190  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 108fce0926..2731a7c667 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 12.22.1
+NODEJS_VERSION = 12.22.3
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
-- 
2.25.1
