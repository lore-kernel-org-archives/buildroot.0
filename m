From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Dec 2017 12:03:12 +0100
Subject: [Buildroot] [git commit] package: remove the empty trailing
 whitespaces
Message-ID: <20171217110326.61E4283457@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5c7680b89f5e993973142b01e1def30de8edccd2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
