From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Sun, 14 Oct 2007 01:09:49 +0300
Subject: [Buildroot] PATCH: correct ncftp version
Message-ID: <4711422D.4070008@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Correct ncftp version to download&compile ok:

Index: package/ncftp/ncftp.mk
===================================================================
--- package/ncftp/ncftp.mk      (revision 20237)
+++ package/ncftp/ncftp.mk      (working copy)
@@ -3,7 +3,7 @@
 # ncftp client
 #
 #############################################################
-NCFTP_VERSION:=3.2.0
+NCFTP_VERSION:=3.2.1
 NCFTP_SOURCE:=ncftp-$(NCFTP_VERSION)-src.tar.bz2
 NCFTP_SITE:=ftp://ftp.ncftp.com/ncftp
 NCFTP_DIR:=$(BUILD_DIR)/ncftp-$(NCFTP_VERSION)


Best regards,
Ivan
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
