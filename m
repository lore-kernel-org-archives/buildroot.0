From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Jan 2016 23:56:47 +0100
Subject: [Buildroot] [PATCH 2/2] package/monkey: bump version to 1.6.8
In-Reply-To: <1453589807-4373-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453589807-4373-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1453589807-4373-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/monkey/monkey.hash | 6 +++---
 package/monkey/monkey.mk   | 6 ++----
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/monkey/monkey.hash b/package/monkey/monkey.hash
index 6c7eada..2f39945 100644
--- a/package/monkey/monkey.hash
+++ b/package/monkey/monkey.hash
@@ -1,3 +1,3 @@
-# md5 from http://monkey-project.com/releases/1.5/monkey-1.5.6.tar.gz.md5, sha256 locally computed:
-md5    9699e4c9ea6ce6b989907c252ae80254 				monkey-1.5.6.tar.gz
-sha256 7c3d845306aa74ee6effd7ab6169d16ac4e6450e564954d0d0baa2d1e9be1a22	monkey-1.5.6.tar.gz
+# md5 from http://monkey-project.com/releases/1.6/monkey-1.6.8.tar.gz.md5, sha256 locally computed:
+md5	aa9b95e16023a7fc062f00a197da059a					monkey-1.6.8.tar.gz
+sha256	936aa276d11dea77cda2703eb5d1b89ede1cf8d44440e1ec029cafb10effb3cf	monkey-1.6.8.tar.gz
diff --git a/package/monkey/monkey.mk b/package/monkey/monkey.mk
index 02c26c9..da2a480 100644
--- a/package/monkey/monkey.mk
+++ b/package/monkey/monkey.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MONKEY_VERSION_MAJOR = 1.5
-MONKEY_VERSION = $(MONKEY_VERSION_MAJOR).6
+MONKEY_VERSION_MAJOR = 1.6
+MONKEY_VERSION = $(MONKEY_VERSION_MAJOR).8
 MONKEY_SITE = http://monkey-project.com/releases/$(MONKEY_VERSION_MAJOR)
 MONKEY_LICENSE = Apache-2.0
 MONKEY_LICENSE_FILES = LICENSE
@@ -17,11 +17,9 @@ MONKEY_LICENSE_FILES = LICENSE
 MONKEY_CONF_OPTS = \
 	--prefix=/usr \
 	--sysconfdir=/etc/monkey \
-	--datadir=/var/www \
 	--mandir=/usr/share/man \
 	--logdir=/var/log \
 	--pidfile=/var/run \
-	--plugdir=/usr/lib/monkey \
 	--malloc-libc
 
 # --uclib-mode is not a typo
-- 
2.7.0.rc3
