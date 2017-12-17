From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Sun, 17 Dec 2017 11:13:50 +0100
Subject: [Buildroot] [PATCH 1/1] package: remove the empty trailing
 whitespaces
Message-ID: <1513505630-12964-1-git-send-email-jerzy.m.grzegorek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
---
 package/aufs-util/Config.in | 2 +-
 package/dash/Config.in      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/aufs-util/Config.in b/package/aufs-util/Config.in
index 89b1f42..a426343 100644
--- a/package/aufs-util/Config.in
+++ b/package/aufs-util/Config.in
@@ -28,7 +28,7 @@ config BR2_PACKAGE_AUFS_UTIL_VERSION
 	  Usually, the sha1 of the cset you want to use; avoid using a
 	  branch name as this yields non-reproducible builds.
 
-	  See the following resources to see what versions are 
+	  See the following resources to see what versions are
 	  available:
 
 	  https://sourceforge.net/p/aufs/aufs-util/ci/master/tree/
diff --git a/package/dash/Config.in b/package/dash/Config.in
index 00cacf8..884b818 100644
--- a/package/dash/Config.in
+++ b/package/dash/Config.in
@@ -6,6 +6,6 @@ config BR2_PACKAGE_DASH
 	  DASH is a POSIX-compliant implementation of /bin/sh that aims to be
 	  as small as possible. It does this without sacrificing speed where
 	  possible. In fact, it is significantly faster than bash (the GNU
-	  Bourne-Again SHell) for most tasks. 
+	  Bourne-Again SHell) for most tasks.
 
 	  http://gondor.apana.org.au/~herbert/dash
-- 
1.9.1
