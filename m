From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 28 Jul 2011 09:21:07 +0200
Subject: [Buildroot] [git commit] util-linux: fix sub option typos
Message-ID: <20110728072518.437848B556@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=49086f19fe49c976a4d925de838007281e7e8588
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/util-linux/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index c0e15e7..5d95466 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -93,7 +93,7 @@ config BR2_PACKAGE_UTIL_LINUX_LAST
 	default n
 
 config BR2_PACKAGE_UTIL_LINUX_MESG
-	bool "build \"kill\""
+	bool "build \"mesg\""
 	default n
 
 config BR2_PACKAGE_UTIL_LINUX_PARTX
@@ -113,7 +113,7 @@ config BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS
 	default n
 
 config BR2_PACKAGE_UTIL_LINUX_WRITE
-	bool "build \"addpart, delpart, partx\""
+	bool "build \"write\""
 	default n
 
 endif
-- 
1.7.3.4
