From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  4 Mar 2008 03:36:23 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libpng
Message-ID: <20080304113623.E69C512C7B0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-04 03:36:23 -0800 (Tue, 04 Mar 2008)
New Revision: 21159

Log:
libpng: bump version



Modified:
   trunk/buildroot/package/libpng/libpng.mk


Changeset:
Modified: trunk/buildroot/package/libpng/libpng.mk
===================================================================
--- trunk/buildroot/package/libpng/libpng.mk	2008-03-04 11:36:20 UTC (rev 21158)
+++ trunk/buildroot/package/libpng/libpng.mk	2008-03-04 11:36:23 UTC (rev 21159)
@@ -21,7 +21,7 @@
 # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
 # USA
 
-LIBPNG_VERSION:=1.2.16
+LIBPNG_VERSION:=1.2.25
 LIBPNG_DIR:=$(BUILD_DIR)/libpng-$(LIBPNG_VERSION)
 LIBPNG_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libpng
 LIBPNG_SOURCE:=libpng-$(LIBPNG_VERSION).tar.bz2
