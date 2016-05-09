From: Martin Bark <martin@barkynet.com>
Date: Mon,  9 May 2016 15:18:20 +0100
Subject: [Buildroot] [PATCH 1/2] package/nodejs: bump version to 6.1.0
Message-ID: <1462803501-15901-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See https://nodejs.org/en/blog/release/v6.1.0/

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 .../{6.0.0 => 6.1.0}/0001-gyp-force-link-command-to-use-CXX.patch     | 0
 package/nodejs/Config.in                                              | 2 +-
 package/nodejs/nodejs.hash                                            | 4 ++--
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename package/nodejs/{6.0.0 => 6.1.0}/0001-gyp-force-link-command-to-use-CXX.patch (100%)

diff --git a/package/nodejs/6.0.0/0001-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/6.1.0/0001-gyp-force-link-command-to-use-CXX.patch
similarity index 100%
rename from package/nodejs/6.0.0/0001-gyp-force-link-command-to-use-CXX.patch
rename to package/nodejs/6.1.0/0001-gyp-force-link-command-to-use-CXX.patch
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 850f9b8..6fa0e8d 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -43,7 +43,7 @@ config BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 
 config BR2_PACKAGE_NODEJS_VERSION_STRING
 	string
-	default "6.0.0"		if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
+	default "6.1.0"		if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 	default "0.10.44"
 
 menu "Module Selection"
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 4b15fd7..101b988 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
 # From upstream URL: http://nodejs.org/dist/v0.10.44/SHASUMS256.txt
 sha256  25b2cd910822723e972a3990d5687b7ff48581ad2f77aa1942d99a1b024f434a  node-v0.10.44.tar.xz
 
-# From upstream URL: http://nodejs.org/dist/v6.0.0/SHASUMS256.txt
-sha256  f0e5bdc3cf4af85b8a24bdbebed81e1a9f7fda91cab8a9475737940aa90da617  node-v6.0.0.tar.xz
+# From upstream URL: http://nodejs.org/dist/v6.1.0/SHASUMS256.txt
+sha256  c7940301917232527490a166df78f9d3d58e70e10fd502f73889d936763cfe84  node-v6.1.0.tar.xz
-- 
2.8.2
