From: Martin Bark <martin@barkynet.com>
Date: Mon,  9 May 2016 15:18:21 +0100
Subject: [Buildroot] [PATCH 2/2] package/nodejs: bump version to 0.10.45
In-Reply-To: <1462803501-15901-1-git-send-email-martin@barkynet.com>
References: <1462803501-15901-1-git-send-email-martin@barkynet.com>
Message-ID: <1462803501-15901-2-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See https://nodejs.org/en/blog/release/v0.10.45/

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 .../{0.10.44 => 0.10.45}/0001-remove-python-bz2-dependency.patch      | 0
 .../{0.10.44 => 0.10.45}/0002-gyp-force-link-command-to-use-CXX.patch | 0
 .../{0.10.44 => 0.10.45}/0003-fix-musl-USE-MISC-build-issue.patch     | 0
 .../nodejs/{0.10.44 => 0.10.45}/0004-Fix-support-for-uClibc-ng.patch  | 0
 package/nodejs/Config.in                                              | 2 +-
 package/nodejs/nodejs.hash                                            | 4 ++--
 6 files changed, 3 insertions(+), 3 deletions(-)
 rename package/nodejs/{0.10.44 => 0.10.45}/0001-remove-python-bz2-dependency.patch (100%)
 rename package/nodejs/{0.10.44 => 0.10.45}/0002-gyp-force-link-command-to-use-CXX.patch (100%)
 rename package/nodejs/{0.10.44 => 0.10.45}/0003-fix-musl-USE-MISC-build-issue.patch (100%)
 rename package/nodejs/{0.10.44 => 0.10.45}/0004-Fix-support-for-uClibc-ng.patch (100%)

diff --git a/package/nodejs/0.10.44/0001-remove-python-bz2-dependency.patch b/package/nodejs/0.10.45/0001-remove-python-bz2-dependency.patch
similarity index 100%
rename from package/nodejs/0.10.44/0001-remove-python-bz2-dependency.patch
rename to package/nodejs/0.10.45/0001-remove-python-bz2-dependency.patch
diff --git a/package/nodejs/0.10.44/0002-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/0.10.45/0002-gyp-force-link-command-to-use-CXX.patch
similarity index 100%
rename from package/nodejs/0.10.44/0002-gyp-force-link-command-to-use-CXX.patch
rename to package/nodejs/0.10.45/0002-gyp-force-link-command-to-use-CXX.patch
diff --git a/package/nodejs/0.10.44/0003-fix-musl-USE-MISC-build-issue.patch b/package/nodejs/0.10.45/0003-fix-musl-USE-MISC-build-issue.patch
similarity index 100%
rename from package/nodejs/0.10.44/0003-fix-musl-USE-MISC-build-issue.patch
rename to package/nodejs/0.10.45/0003-fix-musl-USE-MISC-build-issue.patch
diff --git a/package/nodejs/0.10.44/0004-Fix-support-for-uClibc-ng.patch b/package/nodejs/0.10.45/0004-Fix-support-for-uClibc-ng.patch
similarity index 100%
rename from package/nodejs/0.10.44/0004-Fix-support-for-uClibc-ng.patch
rename to package/nodejs/0.10.45/0004-Fix-support-for-uClibc-ng.patch
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 6fa0e8d..70dacc8 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -44,7 +44,7 @@ config BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 config BR2_PACKAGE_NODEJS_VERSION_STRING
 	string
 	default "6.1.0"		if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
-	default "0.10.44"
+	default "0.10.45"
 
 menu "Module Selection"
 
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 101b988..f417df2 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From upstream URL: http://nodejs.org/dist/v0.10.44/SHASUMS256.txt
-sha256  25b2cd910822723e972a3990d5687b7ff48581ad2f77aa1942d99a1b024f434a  node-v0.10.44.tar.xz
+# From upstream URL: http://nodejs.org/dist/v0.10.45/SHASUMS256.txt
+sha256  a71070ea7aece9c94450b45102f2d1be42f0add168dd9c9701e9032d363bd4fa  node-v0.10.45.tar.xz
 
 # From upstream URL: http://nodejs.org/dist/v6.1.0/SHASUMS256.txt
 sha256  c7940301917232527490a166df78f9d3d58e70e10fd502f73889d936763cfe84  node-v6.1.0.tar.xz
-- 
2.8.2
