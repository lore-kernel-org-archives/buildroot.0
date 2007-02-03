From: andersen at uclibc.org <andersen@uclibc.org>
Date: Sat,  3 Feb 2007 10:47:50 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libpng
Message-ID: <20070203184750.075F74861B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-02-03 10:47:50 -0800 (Sat, 03 Feb 2007)
New Revision: 17742

Log:
new stable upstream version


Modified:
   trunk/buildroot/package/libpng/libpng.mk


Changeset:
Modified: trunk/buildroot/package/libpng/libpng.mk
===================================================================
--- trunk/buildroot/package/libpng/libpng.mk	2007-02-03 17:29:14 UTC (rev 17741)
+++ trunk/buildroot/package/libpng/libpng.mk	2007-02-03 18:47:50 UTC (rev 17742)
@@ -21,7 +21,7 @@
 # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
 # USA
 
-LIBPNG_VER:=1.2.12
+LIBPNG_VER:=1.2.16
 LIBPNG_DIR:=$(BUILD_DIR)/libpng-$(LIBPNG_VER)
 LIBPNG_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libpng
 LIBPNG_SOURCE:=libpng-$(LIBPNG_VER).tar.bz2
