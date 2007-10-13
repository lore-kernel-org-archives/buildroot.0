From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Sun, 14 Oct 2007 00:23:14 +0300
Subject: [Buildroot] PATCH: l2tp correct URL
Message-ID: <47113742.3020205@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update l2tp URL, l2tp-rename-func-log.patch has to be removed - it's not needed anymore.


Index: package/l2tp/l2tp.mk
===================================================================
--- package/l2tp/l2tp.mk        (revision 20237)
+++ package/l2tp/l2tp.mk        (working copy)
@@ -5,7 +5,7 @@
 #############################################################
 L2TP_VERSION:=0.70-pre20031121
 L2TP_SOURCE:=l2tpd_$(L2TP_VERSION).orig.tar.gz
-L2TP_PATCH:=l2tpd_$(L2TP_VERSION)-2.1.diff.gz
+L2TP_PATCH:=l2tpd_$(L2TP_VERSION)-2.2.diff.gz
 L2TP_SITE:=ftp://ftp.debian.org/debian/pool/main/l/l2tpd/
 L2TP_DIR:=$(BUILD_DIR)/l2tpd-$(L2TP_VERSION)
 L2TP_CAT:=$(ZCAT)




Best regards,
Ivan
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
