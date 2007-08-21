From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 21 Aug 2007 12:13:15 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sed
Message-ID: <20070821191315.9189DA5D41@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-21 12:13:14 -0700 (Tue, 21 Aug 2007)
New Revision: 19626

Log:
- remove a superfluous semicolon


Modified:
   trunk/buildroot/package/sed/sed.mk


Changeset:
Modified: trunk/buildroot/package/sed/sed.mk
===================================================================
--- trunk/buildroot/package/sed/sed.mk	2007-08-21 18:30:54 UTC (rev 19625)
+++ trunk/buildroot/package/sed/sed.mk	2007-08-21 19:13:14 UTC (rev 19626)
@@ -34,7 +34,7 @@
 #############################################################
 $(SED_DIR1)/.unpacked: $(DL_DIR)/$(SED_SOURCE)
 	mkdir -p $(TOOL_BUILD_DIR)
-	mkdir -p $(HOST_SED_DIR)/bin;
+	mkdir -p $(HOST_SED_DIR)/bin
 	$(SED_CAT) $(DL_DIR)/$(SED_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(SED_DIR1) package/sed/ configure.patch
 	touch $(SED_DIR1)/.unpacked
