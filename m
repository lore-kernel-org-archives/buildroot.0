From: Martin Bark <martin@barkynet.com>
Date: Tue, 30 Jan 2018 19:48:55 +0000
Subject: [Buildroot] [PATCH 2/2] package/nodejs: bump version to 8.9.4
In-Reply-To: <1517341735-18465-1-git-send-email-martin@barkynet.com>
References: <1517341735-18465-1-git-send-email-martin@barkynet.com>
Message-ID: <1517341735-18465-2-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See https://nodejs.org/en/blog/release/v8.9.4/

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index ae50faf..107a24f 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,2 +1,2 @@
-# From http://nodejs.org/dist/v8.9.3/SHASUMS256.txt
-sha256 748ddb3baa6b85e6a56e38aacd066586e7581952f84a92bc8152248a9be6b2da  node-v8.9.3.tar.xz
+# From http://nodejs.org/dist/v8.9.4/SHASUMS256.txt
+sha256 6cdcde9c9c1ca9f450a0b24eafa229ca759e576daa0fae892ce74d541ecdc86f  node-v8.9.4.tar.xz
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 4c1deb1..a72b9a7 100644
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
-- 
2.7.4
