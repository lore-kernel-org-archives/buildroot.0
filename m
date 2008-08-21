From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 21 Aug 2008 06:10:27 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ace_of_penguins
Message-ID: <20080821131027.48EEA3C650@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-21 06:10:27 -0700 (Thu, 21 Aug 2008)
New Revision: 23152

Log:
ace_of_penguins: remove redundant configure settings

Reported by Hartleys.

Modified:
   trunk/buildroot/package/ace_of_penguins/ace_of_penguins.mk


Changeset:
Modified: trunk/buildroot/package/ace_of_penguins/ace_of_penguins.mk
===================================================================
--- trunk/buildroot/package/ace_of_penguins/ace_of_penguins.mk	2008-08-21 12:52:45 UTC (rev 23151)
+++ trunk/buildroot/package/ace_of_penguins/ace_of_penguins.mk	2008-08-21 13:10:27 UTC (rev 23152)
@@ -11,10 +11,6 @@
 ACE_OF_PENGUINS_STAGING = NO
 ACE_OF_PENGUINS_TARGET = YES
 
-ACE_OF_PENGUINS_CONF_OPT = --target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) --build=$(GNU_HOST_NAME) \
-		--prefix=/usr --sysconfdir=/etc
-
 ACE_OF_PENGUINS_DEPENDENCIES = uclibc libpng $(XSERVER)
 
 $(eval $(call AUTOTARGETS,package,ace_of_penguins))
\ No newline at end of file
