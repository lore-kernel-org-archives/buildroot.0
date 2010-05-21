From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sat, 22 May 2010 00:58:24 +0200
Subject: [Buildroot] [PATCH]  bump mpg123  version  0.66 -> 1.12.0
Message-ID: <5946B10D2D6647049A74AF6855353C82@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

diff -rupN buildroot-2010.05-rc2/package/multimedia/mpg123/mpg123.mk
buildroot/package/multimedia/mpg123/mpg123.mk
--- buildroot-2010.05-rc2/package/multimedia/mpg123/mpg123.mk 2010-05-11
21:15:07.000000000 +0200
+++ buildroot/package/multimedia/mpg123/mpg123.mk 2010-05-21
18:51:01.000000000 +0200
@@ -3,10 +3,12 @@
 # mpg123
 #
 #############################################################
-MPG123_VERSION = 0.66
+MPG123_VERSION = 1.12.0
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE =
http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/mpg123
 
+MPG123_LIBTOOL_PATCH = NO
+
 MPG123_CPU = $(if $(BR2_SOFT_FLOAT),generic_nofpu,generic)
 
 ifeq ($(BR2_i386),y)
 
 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100522/266a3c00/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: br_mpg123.patch
Type: application/octet-stream
Size: 692 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100522/266a3c00/attachment.obj>
