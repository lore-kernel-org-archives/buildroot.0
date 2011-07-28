From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 28 Jul 2011 17:58:50 +0200
Subject: [Buildroot] [git commit] util-linux: libblkid needs liibuuid
Message-ID: <20110728160116.A04678B557@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=43d198c051556f66ec3bb6226415dce822e7a0c4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/util-linux/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 5d95466..4bb614a 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -33,6 +33,7 @@ config BR2_PACKAGE_UTIL_LINUX_UUIDD
 	default y
 
 config BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	bool "build libblkid and blkid utilities"
 	default y
 
-- 
1.7.3.4
