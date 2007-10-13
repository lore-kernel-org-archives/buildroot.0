From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Sun, 14 Oct 2007 01:28:54 +0300
Subject: [Buildroot] PATCH: quagga - correct version
Message-ID: <471146A6.4090906@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Correct quagga version:

Index: package/quagga/quagga.mk
===================================================================
--- package/quagga/quagga.mk    (revision 20237)
+++ package/quagga/quagga.mk    (working copy)
@@ -3,7 +3,7 @@
 # quagga suite
 #
 #############################################################
-QUAGGA_VERSION:=0.99.8
+QUAGGA_VERSION:=0.99.9
 QUAGGA_SOURCE:=quagga-$(QUAGGA_VERSION).tar.gz
 QUAGGA_SITE:=http://www.quagga.net/download
 QUAGGA_DIR:=$(BUILD_DIR)/quagga-$(QUAGGA_VERSION)


Best regards,
Ivan
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
