From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 15 Oct 2011 23:23:02 +0200
Subject: [Buildroot] [git commit] libdaemon: style cleanup
Message-ID: <20111015213701.88FD48D520@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=69037a484728d1f284fe71df13af6b157c695133
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libdaemon/libdaemon.mk |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/package/libdaemon/libdaemon.mk b/package/libdaemon/libdaemon.mk
index 2bfd38b..c04537a 100644
--- a/package/libdaemon/libdaemon.mk
+++ b/package/libdaemon/libdaemon.mk
@@ -5,13 +5,10 @@
 #############################################################
 
 LIBDAEMON_VERSION = 0.14
-LIBDAEMON_SOURCE = libdaemon-$(LIBDAEMON_VERSION).tar.gz
-LIBDAEMON_SITE = http://0pointer.de/lennart/projects/libdaemon/
-LIBDAEMON_AUTORECONF = NO
+LIBDAEMON_SITE = http://0pointer.de/lennart/projects/libdaemon
 LIBDAEMON_INSTALL_STAGING = YES
 LIBDAEMON_CONF_ENV = ac_cv_func_setpgrp_void=no
 LIBDAEMON_CONF_OPT = --disable-lynx
-
 LIBDAEMON_DEPENDENCIES = host-pkg-config
 
 $(eval $(call AUTOTARGETS))
