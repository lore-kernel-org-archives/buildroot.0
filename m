From: Benedict, Michael <MBenedict@twacs.com>
Date: Tue, 3 Apr 2007 09:43:54 -0500
Subject: [Buildroot] version updates (trivial patch inlined)
Message-ID: <CF7E46FCFF66AD478BB72724345289EC2795A1@twx-exch01.twacs.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These packages went 404 for me.  I grabbed the latest for valgrind and
fakeroot, but did not change the samba version.  I do not know which is
preferred (newer or stable version).  If there is a better way to
distribute these updates, let me know.
	Cheers,
		Michael

Index: package/valgrind/valgrind.mk
===================================================================
--- package/valgrind/valgrind.mk        (revision 18312)
+++ package/valgrind/valgrind.mk        (working copy)
@@ -4,7 +4,7 @@
 #
 #############################################################

-VALGRIND_VERSION=3.2.1
+VALGRIND_VERSION=3.2.3
 VALGRIND_SITE:=http://valgrind.org/downloads/
 VALGRIND_DIR:=$(BUILD_DIR)/valgrind-$(VALGRIND_VERSION)
 VALGRIND_SOURCE:=valgrind-$(VALGRIND_VERSION).tar.bz2
Index: package/fakeroot/fakeroot.mk
===================================================================
--- package/fakeroot/fakeroot.mk        (revision 18312)
+++ package/fakeroot/fakeroot.mk        (working copy)
@@ -3,7 +3,7 @@
 # fakeroot
 #
 #############################################################
-FAKEROOT_VERSION:=1.6.4
+FAKEROOT_VERSION:=1.6.5
 FAKEROOT_SOURCE:=fakeroot_$(FAKEROOT_VERSION).tar.gz
 FAKEROOT_SITE:=http://ftp.debian.org/debian/pool/main/f/fakeroot
 FAKEROOT_CAT:=$(ZCAT)
Index: package/samba/samba.mk
===================================================================
--- package/samba/samba.mk      (revision 18312)
+++ package/samba/samba.mk      (working copy)
@@ -5,7 +5,7 @@
 #############################################################
 SAMBA_VER:=3.0.23d
 SAMBA_SOURCE:=samba-$(SAMBA_VER).tar.gz
-SAMBA_SITE:=ftp://us1.samba.org/pub/samba/
+SAMBA_SITE:=http://us3.samba.org/samba/ftp/old-versions/
 SAMBA_DIR:=$(BUILD_DIR)/samba-$(SAMBA_VER)/source
 SAMBA_CAT:=$(ZCAT)
 SAMBA_BINARY:=bin/smbd
