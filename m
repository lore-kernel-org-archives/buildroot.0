From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Sun, 14 Oct 2007 00:33:01 +0300
Subject: [Buildroot] PATCH: libcgicc correct URL
Message-ID: <4711398D.2040009@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Provide correct URL for libcgicc:

Index: package/libcgicc/libcgicc.mk
===================================================================
--- package/libcgicc/libcgicc.mk        (revision 20237)
+++ package/libcgicc/libcgicc.mk        (working copy)
@@ -6,7 +6,7 @@

 LIBCGICC_VERSION=3.2.3
 LIBCGICC_DIR=$(BUILD_DIR)/cgicc-$(LIBCGICC_VERSION)
-LIBCGICC_SITE=http://www.cgicc.org/files
+LIBCGICC_SITE=http://ftp.gnu.org/gnu/cgicc/
 LIBCGICC_SOURCE=cgicc-$(LIBCGICC_VERSION).tar.bz2
 LIBCGICC_CAT:=$(BZCAT)



Best regards,
Ivan
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
