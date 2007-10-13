From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Sun, 14 Oct 2007 00:51:42 +0300
Subject: [Buildroot] PATCH: lvm2 - correct patch version
Message-ID: <47113DEE.1070700@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make lvm2 download&compile correctly:

Index: package/lvm2/lvm2.mk
===================================================================
--- package/lvm2/lvm2.mk        (revision 20237)
+++ package/lvm2/lvm2.mk        (working copy)
@@ -24,7 +24,7 @@
 # USA

 LVM2_BASEVER=2.02
-LVM2_PATCH=26
+LVM2_PATCH=28
 LVM2_VERSION=$(LVM2_BASEVER).$(LVM2_PATCH)
 LVM2_SOURCE:=LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE:=ftp://sources.redhat.com/pub/lvm2


Best regards,
Ivan
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
