From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sat, 11 Dec 2010 00:44:30 +0100
Subject: [Buildroot] [PATCH 1/1] bump libconfig to version 1.4.6
Message-ID: <5D84D73AF97C43079AA3F8DBD15187CD@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi


 
diff -rupN package/libconfigorg/libconfig.mk package/libconfig/libconfig.mk
--- package/libconfigorg/libconfig.mk 2010-11-30 16:52:43.000000000 +0100
+++ package/libconfig/libconfig.mk 2010-12-11 00:41:00.000000000 +0100
@@ -3,12 +3,13 @@
 # libconfig
 #
 #############################################################
-LIBCONFIG_VERSION:=1.3
+LIBCONFIG_VERSION:=1.4.6
 LIBCONFIG_SOURCE:=libconfig-$(LIBCONFIG_VERSION).tar.gz
 LIBCONFIG_SITE:=http://www.hyperrealm.com/libconfig/
 LIBCONFIG_AUTORECONF:=NO
 LIBCONFIG_INSTALL_STAGING:=YES
 LIBCONFIG_INSTALL_TARGET:=YES
+LIBCONFIG_LIBTOOL_PATCH:=NO
 
 ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
 LIBCONFIG_CONF_OPT:=--disable-cxx
 
 
 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: br_libconfig.patch
Type: application/octet-stream
Size: 670 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101211/75f1ca17/attachment.obj>
