From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 7 Dec 2011 11:28:35 +0100
Subject: [Buildroot] [PATCH  1/1] bump libexosip2  3.3.0 ->3.5.0
Message-ID: <C664C86092A24376B3835DBB065BE8AE@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump version

diff -rupN buildroot-2011.11/package/libeXosip2/libeXosip2.mk
buildroot-2011.11js/package/libeXosip2/libeXosip2.mk
--- buildroot-2011.11/package/libeXosip2/libeXosip2.mk	2011-12-01
00:08:44.000000000 +0100
+++ buildroot-2011.11js/package/libeXosip2/libeXosip2.mk	2011-12-03
20:20:00.000000000 +0100
@@ -3,7 +3,7 @@
 # libeXosip2
 #
 #############################################################
-LIBEXOSIP2_VERSION = 3.3.0
+LIBEXOSIP2_VERSION = 3.5.0
 LIBEXOSIP2_SOURCE = libexosip2_$(LIBEXOSIP2_VERSION).orig.tar.gz
 LIBEXOSIP2_PATCH = libexosip2_$(LIBEXOSIP2_VERSION)-1.diff.gz
 LIBEXOSIP2_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/libe/libexosip2



johan
