From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Sun, 14 Oct 2007 00:55:04 +0300
Subject: [Buildroot] PATCH: mdadm - correct patch version
Message-ID: <47113EB8.4040608@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mdadm - correct patch version, download&compile - ok:

Index: package/mdadm/mdadm.mk
===================================================================
--- package/mdadm/mdadm.mk      (revision 20237)
+++ package/mdadm/mdadm.mk      (working copy)
@@ -5,7 +5,7 @@
 #############################################################
 MDADM_VERSION:=2.6.2
 MDADM_SOURCE:=mdadm_$(MDADM_VERSION).orig.tar.gz
-MDADM_PATCH:=mdadm_$(MDADM_VERSION)-1.diff.gz
+MDADM_PATCH:=mdadm_$(MDADM_VERSION)-2.diff.gz
 MDADM_CAT:=$(ZCAT)
 MDADM_SITE:=http://ftp.debian.org/debian/pool/main/m/mdadm
 MDADM_DIR:=$(BUILD_DIR)/mdadm-$(MDADM_VERSION)


Best regards,
Ivan
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
