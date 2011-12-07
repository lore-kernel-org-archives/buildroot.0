From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 7 Dec 2011 11:28:19 +0100
Subject: [Buildroot] [PATCH  1/1] bump libosip2  3.3.0 ->3.5.0
Message-ID: <44F7530B252A4144827800C1F9838E11@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump version


diff -rupN buildroot-2010.11/package/libosip2/libosip2.mk
buildroot/package/libosip2/libosip2.mk
--- buildroot-2010.11/package/libosip2/libosip2.mk	2010-11-30
16:52:43.000000000 +0100
+++ buildroot/package/libosip2/libosip2.mk	2011-01-28
18:15:13.000000000 +0100
@@ -3,10 +3,12 @@
 # libosip2
 #
 #############################################################
-LIBOSIP2_VERSION = 3.3.0
-LIBOSIP2_SOURCE = libosip2_$(LIBOSIP2_VERSION).orig.tar.gz
-LIBOSIP2_PATCH = libosip2_$(LIBOSIP2_VERSION)-1.diff.gz
-LIBOSIP2_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/libo/libosip2
+LIBOSIP2_VERSION = 3.5.0
+LIBOSIP2_SOURCE = libosip2-$(LIBOSIP2_VERSION).tar.gz
+#LIBOSIP2_SOURCE = libosip2_$(LIBOSIP2_VERSION).orig.tar.gz
+#LIBOSIP2_PATCH = libosip2_$(LIBOSIP2_VERSION)-1.diff.gz
+#LIBOSIP2_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/libo/libosip2
+LIBOSIP2_SITE = ftp://ftp.gnu.org/gnu/osip/
 LIBOSIP2_INSTALL_STAGING = YES
 
 ifneq ($(LIBOSIP2_PATCH),)



Johan
