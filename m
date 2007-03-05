From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  5 Mar 2007 03:06:59 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fakeroot
Message-ID: <20070305110659.27A27485DB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-03-05 03:06:58 -0800 (Mon, 05 Mar 2007)
New Revision: 18007

Log:
Bump version. Closes #1241, #1243 and #1248

Modified:
   trunk/buildroot/package/fakeroot/fakeroot-doc.patch
   trunk/buildroot/package/fakeroot/fakeroot.mk


Changeset:
Modified: trunk/buildroot/package/fakeroot/fakeroot-doc.patch
===================================================================
--- trunk/buildroot/package/fakeroot/fakeroot-doc.patch	2007-03-05 04:04:14 UTC (rev 18006)
+++ trunk/buildroot/package/fakeroot/fakeroot-doc.patch	2007-03-05 11:06:58 UTC (rev 18007)
@@ -9,9 +9,9 @@
  libcommunicate_la_SOURCES = communicate.c
 --- fakeroot/Makefile.in.orig	2006-04-19 11:50:43.000000000 -0600
 +++ fakeroot/Makefile.in	2006-04-19 11:51:21.000000000 -0600
-@@ -214,7 +214,7 @@
- target_os = @target_os@
- target_vendor = @target_vendor@
+@@ -230,7 +230,7 @@
+ top_builddir = @top_builddir@
+ top_srcdir = @top_srcdir@
  AUTOMAKE_OPTIONS = foreign
 -SUBDIRS = scripts doc test
 +SUBDIRS = scripts test

Modified: trunk/buildroot/package/fakeroot/fakeroot.mk
===================================================================
--- trunk/buildroot/package/fakeroot/fakeroot.mk	2007-03-05 04:04:14 UTC (rev 18006)
+++ trunk/buildroot/package/fakeroot/fakeroot.mk	2007-03-05 11:06:58 UTC (rev 18007)
@@ -3,7 +3,7 @@
 # fakeroot
 #
 #############################################################
-FAKEROOT_VERSION:=1.5.12
+FAKEROOT_VERSION:=1.6.4
 FAKEROOT_SOURCE:=fakeroot_$(FAKEROOT_VERSION).tar.gz
 FAKEROOT_SITE:=http://ftp.debian.org/debian/pool/main/f/fakeroot
 FAKEROOT_CAT:=$(ZCAT)
