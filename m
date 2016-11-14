From: Patrick Devlin <cloudyparts@icloud.com>
Date: Mon, 14 Nov 2016 11:58:50 -0500
Subject: [Buildroot] [PATCH 1/1] package/nodejs: bump version to 6.9.1
Message-ID: <1479142730-21743-1-git-send-email-cloudyparts@icloud.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://nodejs.org/en/blog/release/v6.9.1/

The patches from 6.7.0 have been copied to 6.9.1.

Signed-off-by: Patrick Devlin <cloudyparts@icloud.com>
---
 .../{6.7.0 => 6.9.1}/0001-gyp-force-link-command-to-use-CXX.patch     | 0
 .../0002-inspector-don-t-build-when-ssl-support-is-disabled.patch     | 0
 package/nodejs/Config.in                                              | 2 +-
 package/nodejs/nodejs.hash                                            | 4 ++--
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename package/nodejs/{6.7.0 => 6.9.1}/0001-gyp-force-link-command-to-use-CXX.patch (100%)
 rename package/nodejs/{6.7.0 => 6.9.1}/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch (100%)

diff --git a/package/nodejs/6.7.0/0001-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/6.9.1/0001-gyp-force-link-command-to-use-CXX.patch
similarity index 100%
rename from package/nodejs/6.7.0/0001-gyp-force-link-command-to-use-CXX.patch
rename to package/nodejs/6.9.1/0001-gyp-force-link-command-to-use-CXX.patch
diff --git a/package/nodejs/6.7.0/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch b/package/nodejs/6.9.1/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch
similarity index 100%
rename from package/nodejs/6.7.0/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch
rename to package/nodejs/6.9.1/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 976be50..a47ba37 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -43,7 +43,7 @@ config BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 
 config BR2_PACKAGE_NODEJS_VERSION_STRING
 	string
-	default "6.7.0"		if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
+	default "6.9.1"		if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 	default "0.10.47"
 
 config BR2_PACKAGE_NODEJS_NPM
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index f334a47..5df79af 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
 # From upstream URL: http://nodejs.org/dist/v0.10.47/SHASUMS256.txt
 sha256  335bdf4db702885a8acaf2c9f241c70cabd62497361da81aca65c8e8a8e7ff09  node-v0.10.47.tar.xz
 
-# From upstream URL: http://nodejs.org/dist/v6.7.0/SHASUMS256.txt
-sha256  ceb028324aab1ee8c7ea6a62026f036f3ea71f5ef5212593d0f833f999dd3be5  node-v6.7.0.tar.xz
+# From upstream URL: http://nodejs.org/dist/v6.9.1/SHASUMS256.txt
+sha256  0bdd8d1305777cc8cd206129ea494d6c6ce56001868dd80147aff531d6df0729  node-v6.9.1.tar.xz
-- 
1.9.1
