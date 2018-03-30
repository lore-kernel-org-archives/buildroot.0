From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 23:12:27 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/nodejs: bump
 version to 8.10.0
Message-ID: <20180330213159.4E1C283EBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=444201fd1c286f722cbd1182a17bc090d8532222
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

See https://nodejs.org/en/blog/release/v8.10.0/

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit df33aae5f59eaaf40e800acdfefc83e57216ffe8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 107a24f7bf..4adef79dca 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,2 +1,2 @@
-# From http://nodejs.org/dist/v8.9.4/SHASUMS256.txt
-sha256 6cdcde9c9c1ca9f450a0b24eafa229ca759e576daa0fae892ce74d541ecdc86f  node-v8.9.4.tar.xz
+# From http://nodejs.org/dist/v8.10.0/SHASUMS256.txt
+sha256 b72d4e71618d6bcbd039b487b51fa7543631a4ac3331d7caf69bdf55b5b2901a  node-v8.10.0.tar.xz
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index a72b9a704f..e1dd11cef5 100644
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
