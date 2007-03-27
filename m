From: Francois Visconte <fv@kh3.org>
Date: Tue, 27 Mar 2007 11:18:39 +0200
Subject: [Buildroot] Problem with fakeroot package
Message-ID: <4608E16F.6020608@kh3.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Fakeroot in it's version 1.6.4 is no longer on the debian mirrors.
I updated VERSION to 1.6.5 and it works (no problem about 
fakeroot-doc.patch patch)


Cheers,
Fran?ois Visconte


Index: package/fakeroot/fakeroot.mk
===================================================================
--- package/fakeroot/fakeroot.mk        (r?vision 18253)
+++ package/fakeroot/fakeroot.mk        (copie de travail)
@@ -3,7 +3,7 @@
  # fakeroot
  #
  #############################################################
-FAKEROOT_VERSION:=1.6.4
+FAKEROOT_VERSION:=1.6.5
  FAKEROOT_SOURCE:=fakeroot_$(FAKEROOT_VERSION).tar.gz
  FAKEROOT_SITE:=http://ftp.debian.org/debian/pool/main/f/fakeroot
  FAKEROOT_CAT:=$(ZCAT)
