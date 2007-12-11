From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Tue, 11 Dec 2007 12:13:15 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fusion
Message-ID: <20071211201315.A677D12802E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2007-12-11 12:13:13 -0800 (Tue, 11 Dec 2007)
New Revision: 20640

Log:
remove extra brace for clean target

Modified:
   trunk/buildroot/package/fusion/fusion.mk


Changeset:
Modified: trunk/buildroot/package/fusion/fusion.mk
===================================================================
--- trunk/buildroot/package/fusion/fusion.mk	2007-12-11 20:11:19 UTC (rev 20639)
+++ trunk/buildroot/package/fusion/fusion.mk	2007-12-11 20:13:13 UTC (rev 20640)
@@ -28,7 +28,7 @@
 linux-fusion: $(LINUX_FUSION_DIR)/$(LINUX_FUSION) $(LINUX_FUSION_HEADER)
 
 linux-fusion-clean:
-	rm -f $(LINUX_FUSION_DIR)/$(LINUX_FUSION))
+	rm -f $(LINUX_FUSION_DIR)/$(LINUX_FUSION)
 
 #############################################################
 #
