From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  6 Oct 2008 08:11:16 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libpng
Message-ID: <20081006151116.2BE723C682@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-06 08:11:15 -0700 (Mon, 06 Oct 2008)
New Revision: 23601

Log:
png: bump version

Upgrade libpng to 1.2.32

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Modified:
   trunk/buildroot/package/libpng/libpng.mk


Changeset:
Modified: trunk/buildroot/package/libpng/libpng.mk
===================================================================
--- trunk/buildroot/package/libpng/libpng.mk	2008-10-06 15:04:46 UTC (rev 23600)
+++ trunk/buildroot/package/libpng/libpng.mk	2008-10-06 15:11:15 UTC (rev 23601)
@@ -21,7 +21,7 @@
 # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
 # USA
 
-LIBPNG_VERSION:=1.2.25
+LIBPNG_VERSION:=1.2.32
 LIBPNG_DIR:=$(BUILD_DIR)/libpng-$(LIBPNG_VERSION)
 LIBPNG_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libpng
 LIBPNG_SOURCE:=libpng-$(LIBPNG_VERSION).tar.bz2
