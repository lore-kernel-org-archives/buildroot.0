From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Sun, 8 Jul 2007 14:09:11 +0200 (CEST)
Subject: [Buildroot] missing expat-dirclean target
Message-ID: <0707081407520.26961@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Index: expat.mk
===================================================================
--- expat.mk	(revision 19026)
+++ expat.mk	(working copy)
@@ -70,6 +70,9 @@
 	#rm -f $(STAGING_DIR)/usr/bin/xmlwf  $(TARGET_DIR)/usr/bin/xmlwf
 	-$(MAKE) -C $(EXPAT_DIR) clean

+expat-dirclean:
+	rm -rf $(EXPAT_DIR)
+
 #############################################################
 #
 # Toplevel Makefile options


-- 
Cristian
