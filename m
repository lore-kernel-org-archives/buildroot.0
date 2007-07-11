From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 11 Jul 2007 06:55:58 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/bash
Message-ID: <20070711135558.7B337A65C2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-11 06:55:55 -0700 (Wed, 11 Jul 2007)
New Revision: 19060

Log:
Use <package>_VERSION in all <package>.mk instead of <package>_VER

Modified:
   trunk/buildroot/package/bash/bash.mk


Changeset:
Modified: trunk/buildroot/package/bash/bash.mk
===================================================================
--- trunk/buildroot/package/bash/bash.mk	2007-07-11 13:55:21 UTC (rev 19059)
+++ trunk/buildroot/package/bash/bash.mk	2007-07-11 13:55:55 UTC (rev 19060)
@@ -3,11 +3,11 @@
 # bash
 #
 #############################################################
-BASH_VER:=3.2
-BASH_SOURCE:=bash-$(BASH_VER).tar.gz
+BASH_VERSION:=3.2
+BASH_SOURCE:=bash-$(BASH_VERSION).tar.gz
 BASH_SITE:=http://ftp.gnu.org/pub/gnu/bash
 BASH_CAT:=$(ZCAT)
-BASH_DIR:=$(BUILD_DIR)/bash-$(BASH_VER)
+BASH_DIR:=$(BUILD_DIR)/bash-$(BASH_VERSION)
 BASH_BINARY:=bash
 BASH_TARGET_BINARY:=bin/bash
 
