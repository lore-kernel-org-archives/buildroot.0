From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 14 Apr 2013 20:38:36 +0200
Subject: [Buildroot] [git commit] nbd: bump to version 3.3
Message-ID: <20130414184111.D5B729B62E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=586ddf1a9383c3deda90920adeaed5d63183ff38
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/nbd/Config.in |    2 --
 package/nbd/nbd.mk    |    2 +-
 2 files changed, 1 insertions(+), 3 deletions(-)

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
