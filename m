From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu, 24 Apr 2008 11:13:03 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/java/jamvm
Message-ID: <20080424181303.1285B3C7E0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-04-24 11:13:02 -0700 (Thu, 24 Apr 2008)
New Revision: 21849

Log:
remove unused JAMVM_DIR_PREFIX

Modified:
   trunk/buildroot/package/java/jamvm/jamvm.mk


Changeset:
Modified: trunk/buildroot/package/java/jamvm/jamvm.mk
===================================================================
--- trunk/buildroot/package/java/jamvm/jamvm.mk	2008-04-24 16:56:06 UTC (rev 21848)
+++ trunk/buildroot/package/java/jamvm/jamvm.mk	2008-04-24 18:13:02 UTC (rev 21849)
@@ -11,7 +11,6 @@
 JAMVM_INSTALL_TARGET = YES
 JAMVM_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install
 JAMVM_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
-JAMVM_DIR_PREFIX = package/java
 
 JAMVM_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		glib_cv_uscore=no ac_cv_func_strtod=yes \
