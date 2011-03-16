From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Wed, 16 Mar 2011 10:46:49 +0100
Subject: [Buildroot] [PATCH] socat: bump to version 2.0.0-b4
Message-ID: <4D808709.3040604@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Index: b/package/socat/socat.mk
===================================================================
--- a/package/socat/socat.mk	2011-03-09 14:30:39.000000000 +0100
+++ b/package/socat/socat.mk	2011-03-09 14:37:23.000000000 +0100
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SOCAT_VERSION = 2.0.0-b2
+SOCAT_VERSION = 2.0.0-b4
 SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
 SOCAT_SITE = http://www.dest-unreach.org/socat/download/
 SOCAT_CONF_ENV = sc_cv_termios_ispeed=no \
