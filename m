From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 15 Oct 2011 00:07:35 -0300
Subject: [Buildroot] [PATCH 21/25] libdaemon: style cleanup
In-Reply-To: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
References: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1318648059-30431-21-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
1.7.3.4
