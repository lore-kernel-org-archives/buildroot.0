From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Jan 2017 11:41:04 +0100
Subject: [Buildroot] [git commit] nodejs: bump to version 6.9.4
Message-ID: <20170109104338.9C5E8819CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=66e13a04ec2021fd1aa96a4f7de8788c066a1ffd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../{6.9.2 => 6.9.4}/0001-gyp-force-link-command-to-use-CXX.patch     | 0
 .../0002-inspector-don-t-build-when-ssl-support-is-disabled.patch     | 0
 package/nodejs/Config.in                                              | 2 +-
 package/nodejs/nodejs.hash                                            | 4 ++--
 4 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/6.9.2/0001-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/6.9.4/0001-gyp-force-link-command-to-use-CXX.patch
similarity index 100%
rename from package/nodejs/6.9.2/0001-gyp-force-link-command-to-use-CXX.patch
rename to package/nodejs/6.9.4/0001-gyp-force-link-command-to-use-CXX.patch
diff --git a/package/nodejs/6.9.2/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch b/package/nodejs/6.9.4/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch
similarity index 100%
rename from package/nodejs/6.9.2/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch
rename to package/nodejs/6.9.4/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 5c4ee12..d2262be 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -43,7 +43,7 @@ config BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 
 config BR2_PACKAGE_NODEJS_VERSION_STRING
 	string
-	default "6.9.2"		if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
+	default "6.9.4"		if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 	default "0.10.48"
 
 config BR2_PACKAGE_NODEJS_NPM
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 67d0258..8c8c5a3 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
 # From upstream URL: http://nodejs.org/dist/v0.10.48/SHASUMS256.txt
 sha256  365a93d9acc076a0d93f087d269f376abeebccad599a9dab72f2f6ed96c8ae6e  node-v0.10.48.tar.xz
 
-# From upstream URL: http://nodejs.org/dist/v6.9.2/SHASUMS256.txt
-sha256  f41b320b37ce23a34dbc597040e71535ea4f6baa2342bc526bb45f5f9aa9c9fb  node-v6.9.2.tar.xz
+# From upstream URL: http://nodejs.org/dist/v6.9.4/SHASUMS256.txt
+sha256  c51d7c61db40455d57428abcadc7eb0f0a08a8878cb1d8ea3c1e211c54532c35  node-v6.9.4.tar.xz
