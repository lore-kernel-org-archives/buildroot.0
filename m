From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 13 Apr 2013 21:23:41 -0300
Subject: [Buildroot] [PATCH 4/4] nbd: bump to version 3.3
In-Reply-To: <1365899021-7675-1-git-send-email-gustavo@zacarias.com.ar>
References: <1365899021-7675-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1365899021-7675-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nbd/Config.in | 2 --
 package/nbd/nbd.mk    | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/nbd/Config.in b/package/nbd/Config.in
index 6e92f93..79b34de 100644
--- a/package/nbd/Config.in
+++ b/package/nbd/Config.in
@@ -6,8 +6,6 @@ config BR2_PACKAGE_NBD
 	  NBD is a set of utilities to configure network block devices,
 	  allowing access to remote block devices over TCP/IP network.
 
-	  Depends on glib.
-
 	  http://nbd.sf.net/
 
 comment "nbd requires a toolchain with WCHAR support"
diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
index 7733d7b..8a129f3 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-NBD_VERSION = 3.2
+NBD_VERSION = 3.3
 NBD_SOURCE = nbd-$(NBD_VERSION).tar.bz2
 NBD_SITE = http://downloads.sourceforge.net/project/nbd/nbd/$(NBD_VERSION)
 NBD_CONF_OPT = $(if $(BR2_LARGEFILE),--enable-lfs,--disable-lfs)
-- 
1.8.1.5
