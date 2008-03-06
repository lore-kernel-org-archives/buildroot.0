From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 12:11:01 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ng-spice-rework
Message-ID: <20080306201101.3F347120226@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 12:11:00 -0800 (Thu, 06 Mar 2008)
New Revision: 21260

Log:
fixed ngspice install

Modified:
   trunk/buildroot/package/ng-spice-rework/ng-spice-rework.mk


Changeset:
Modified: trunk/buildroot/package/ng-spice-rework/ng-spice-rework.mk
===================================================================
--- trunk/buildroot/package/ng-spice-rework/ng-spice-rework.mk	2008-03-06 19:48:39 UTC (rev 21259)
+++ trunk/buildroot/package/ng-spice-rework/ng-spice-rework.mk	2008-03-06 20:11:00 UTC (rev 21260)
@@ -9,9 +9,8 @@
 NG_SPICE_REWORK_AUTORECONF = NO
 NG_SPICE_REWORK_INSTALL_STAGING = NO
 NG_SPICE_REWORK_INSTALL_TARGET = YES
+NG_SPICE_REWORK_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-NG-SPICE-REWORK_CONF_OPT = 
-
 NG-SPICE-REWORK_DEPENDENCIES = uclibc 
 
 $(eval $(call AUTOTARGETS,package,ng-spice-rework))
