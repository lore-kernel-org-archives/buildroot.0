From: Martin Bark <martin@barkynet.com>
Date: Fri,  3 Jun 2016 11:41:17 +0100
Subject: [Buildroot] [PATCH 2/2] package/nodejs: bump version to 6.2.1
In-Reply-To: <1464950477-3122-1-git-send-email-martin@barkynet.com>
References: <1464950477-3122-1-git-send-email-martin@barkynet.com>
Message-ID: <1464950477-3122-2-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See https://nodejs.org/en/blog/release/v6.2.1/

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 .../{6.1.0 => 6.2.1}/0001-gyp-force-link-command-to-use-CXX.patch     | 0
 package/nodejs/Config.in                                              | 2 +-
 package/nodejs/nodejs.hash                                            | 4 ++--
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename package/nodejs/{6.1.0 => 6.2.1}/0001-gyp-force-link-command-to-use-CXX.patch (100%)

diff --git a/package/nodejs/6.1.0/0001-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/6.2.1/0001-gyp-force-link-command-to-use-CXX.patch
similarity index 100%
rename from package/nodejs/6.1.0/0001-gyp-force-link-command-to-use-CXX.patch
rename to package/nodejs/6.2.1/0001-gyp-force-link-command-to-use-CXX.patch
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 70dacc8..432792f 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -43,7 +43,7 @@ config BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 
 config BR2_PACKAGE_NODEJS_VERSION_STRING
 	string
-	default "6.1.0"		if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
+	default "6.2.1"		if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 	default "0.10.45"
 
 menu "Module Selection"
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index f417df2..9fce2f5 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
 # From upstream URL: http://nodejs.org/dist/v0.10.45/SHASUMS256.txt
 sha256  a71070ea7aece9c94450b45102f2d1be42f0add168dd9c9701e9032d363bd4fa  node-v0.10.45.tar.xz
 
-# From upstream URL: http://nodejs.org/dist/v6.1.0/SHASUMS256.txt
-sha256  c7940301917232527490a166df78f9d3d58e70e10fd502f73889d936763cfe84  node-v6.1.0.tar.xz
+# From upstream URL: http://nodejs.org/dist/v6.2.1/SHASUMS256.txt
+sha256  dbaeb8fb68a599e5164b17c74f66d24f424ee4ab3a25d8de8a3c6808e5b42bfb  node-v6.2.1.tar.xz
-- 
2.7.4
