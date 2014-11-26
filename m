From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Nov 2014 16:13:59 +0100
Subject: [Buildroot] [git commit] liboping: bump to version 1.8.0
Message-ID: <20141201104838.585867FDA9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cfb3af459c60c7dfb6a881ef6a79771565ac0d32
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/liboping/Config.in     |    2 +-
 package/liboping/liboping.hash |    4 ++--
 package/liboping/liboping.mk   |    4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/liboping/Config.in b/package/liboping/Config.in
index ffdebbd..65e7c88 100644
--- a/package/liboping/Config.in
+++ b/package/liboping/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_LIBOPING
 	  liboping is a C library to generate ICMP echo requests,
 	  better known as "ping packets".
 
-	  http://verplant.org/liboping/
+	  http://noping.cc/
 
 comment "liboping needs a toolchain w/ IPv6"
 	depends on !BR2_INET_IPV6
diff --git a/package/liboping/liboping.hash b/package/liboping/liboping.hash
index 5987d7a..536f6ae 100644
--- a/package/liboping/liboping.hash
+++ b/package/liboping/liboping.hash
@@ -1,2 +1,2 @@
-# From http://verplant.org/liboping/#download
-sha256	25cf9417fe84d70c4b1bd97f1f92e597ccdc1ec2da3b7eb311f33f5e7033a70e	liboping-1.7.0.tar.gz
+# From http://noping.cc/#download
+sha256	824792ae7fc5e9569bacc4167b89de31f6ba8476de44760f0bc272682e894b41	liboping-1.8.0.tar.gz
diff --git a/package/liboping/liboping.mk b/package/liboping/liboping.mk
index bb02616..aeaaa8a 100644
--- a/package/liboping/liboping.mk
+++ b/package/liboping/liboping.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBOPING_VERSION = 1.7.0
-LIBOPING_SITE = http://verplant.org/liboping/files
+LIBOPING_VERSION = 1.8.0
+LIBOPING_SITE = http://noping.cc/files
 LIBOPING_INSTALL_STAGING = YES
 LIBOPING_DEPENDENCIES = $(if $(BR2_PACKAGE_NCURSES),ncurses)
 LIBOPING_CONF_OPTS = --without-perl-bindings
