From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Jan 2018 22:50:40 +0100
Subject: [Buildroot] [git commit] package/nodejs: bump version to 8.9.4
Message-ID: <20180130215615.6C82B86038@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d6a491bc6ba40f39557ea8c4be732da199b83691
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See https://nodejs.org/en/blog/release/v8.9.4/

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index ae50faf982..107a24f7bf 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,2 +1,2 @@
-# From http://nodejs.org/dist/v8.9.3/SHASUMS256.txt
-sha256 748ddb3baa6b85e6a56e38aacd066586e7581952f84a92bc8152248a9be6b2da  node-v8.9.3.tar.xz
+# From http://nodejs.org/dist/v8.9.4/SHASUMS256.txt
+sha256 6cdcde9c9c1ca9f450a0b24eafa229ca759e576daa0fae892ce74d541ecdc86f  node-v8.9.4.tar.xz
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 4c1deb1be3..a72b9a704f 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 8.9.3
+NODEJS_VERSION = 8.9.4
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
