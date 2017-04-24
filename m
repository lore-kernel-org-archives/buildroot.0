From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Apr 2017 22:24:40 +0200
Subject: [Buildroot] [PATCH-2017.02.x] nodejs: bump 6.x version to 6.10.2
Message-ID: <20170424202440.22731-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

6.10.2 is the latest release in the LTS series, fixing a number of issues:

https://nodejs.org/en/blog/release/v6.10.2/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/Config.in   | 2 +-
 package/nodejs/nodejs.hash | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index b8c45f5dc..ad5ca050b 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -43,7 +43,7 @@ config BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 
 config BR2_PACKAGE_NODEJS_VERSION_STRING
 	string
-	default "6.9.4"		if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
+	default "6.10.2"		if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 	default "0.10.48"
 
 config BR2_PACKAGE_NODEJS_NPM
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 8c8c5a3c2..4c63f5894 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
 # From upstream URL: http://nodejs.org/dist/v0.10.48/SHASUMS256.txt
 sha256  365a93d9acc076a0d93f087d269f376abeebccad599a9dab72f2f6ed96c8ae6e  node-v0.10.48.tar.xz
 
-# From upstream URL: http://nodejs.org/dist/v6.9.4/SHASUMS256.txt
-sha256  c51d7c61db40455d57428abcadc7eb0f0a08a8878cb1d8ea3c1e211c54532c35  node-v6.9.4.tar.xz
+# From upstream URL: http://nodejs.org/dist/v6.10.2/SHASUMS256.txt
+sha256  80aa11333da99813973a99646e2113c6be5b63f665c0731ed14ecb94cbe846b6  node-v6.10.2.tar.xz
-- 
2.11.0
