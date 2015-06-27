From: Martin Bark <martin@barkynet.com>
Date: Sat, 27 Jun 2015 03:01:33 +0100
Subject: [Buildroot] [v2 1/6] package/nodejs: Bump version to 0.10.39
Message-ID: <1435370498-25473-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>

---
Changed v1 -> v2
  - No changes, added in v2

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 792ebc1..bc1f15f 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,2 +1,2 @@
-# From upstream URL: http://nodejs.org/dist/v0.10.38/SHASUMS256.txt
-sha256	513da8ed5e48abefdfab664f1cabc160238d314a0481148804aff8fc6552b78b  node-v0.10.38.tar.gz
+# From upstream URL: http://nodejs.org/dist/v0.10.39/SHASUMS256.txt
+sha256	68f8d8f9515c4e77e2a06034b742e19e9848c1fee5bcadedc1d68f3e4302df37  node-v0.10.39.tar.gz
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 5ee7714..4293c70 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 0.10.38
+NODEJS_VERSION = 0.10.39
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.gz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs zlib \
-- 
2.1.4
