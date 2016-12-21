From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Dec 2016 19:44:32 +0100
Subject: [Buildroot] [PATCH] nodejs: bump to version 6.9.2
Message-ID: <20161221184432.31086-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/Config.in   | 2 +-
 package/nodejs/nodejs.hash | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 832152b..5c4ee12 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -43,7 +43,7 @@ config BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 
 config BR2_PACKAGE_NODEJS_VERSION_STRING
 	string
-	default "6.9.1"		if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
+	default "6.9.2"		if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 	default "0.10.48"
 
 config BR2_PACKAGE_NODEJS_NPM
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index e55bb16..67d0258 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
 # From upstream URL: http://nodejs.org/dist/v0.10.48/SHASUMS256.txt
 sha256  365a93d9acc076a0d93f087d269f376abeebccad599a9dab72f2f6ed96c8ae6e  node-v0.10.48.tar.xz
 
-# From upstream URL: http://nodejs.org/dist/v6.9.1/SHASUMS256.txt
-sha256  0bdd8d1305777cc8cd206129ea494d6c6ce56001868dd80147aff531d6df0729  node-v6.9.1.tar.xz
+# From upstream URL: http://nodejs.org/dist/v6.9.2/SHASUMS256.txt
+sha256  f41b320b37ce23a34dbc597040e71535ea4f6baa2342bc526bb45f5f9aa9c9fb  node-v6.9.2.tar.xz
-- 
2.10.2
