From: andersen at uclibc.org <andersen@uclibc.org>
Date: Sat,  3 Feb 2007 15:09:05 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/rxvt
Message-ID: <20070203230905.C1A6648632@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-02-03 15:09:04 -0800 (Sat, 03 Feb 2007)
New Revision: 17746

Log:
bump version


Modified:
   trunk/buildroot/package/rxvt/rxvt.mk


Changeset:
Modified: trunk/buildroot/package/rxvt/rxvt.mk
===================================================================
--- trunk/buildroot/package/rxvt/rxvt.mk	2007-02-03 21:07:43 UTC (rev 17745)
+++ trunk/buildroot/package/rxvt/rxvt.mk	2007-02-03 23:09:04 UTC (rev 17746)
@@ -20,7 +20,7 @@
 # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
 # USA
 
-RXVT_VERSION:=2.6.4
+RXVT_VERSION:=2.7.5
 RXVT_SOURCE:=rxvt-$(RXVT_VERSION).tar.gz
 RXVT_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/rxvt
 RXVT_CAT:=$(ZCAT)
@@ -52,7 +52,6 @@
 		--x-libraries=$(STAGING_DIR)/usr/X11R6/lib \
 		--disable-resources \
 		--disable-memset \
-		--enable-xgetdefault \
 	);
 	touch $(RXVT_DIR)/.configured
 
