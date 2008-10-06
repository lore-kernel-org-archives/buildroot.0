From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Oct 2008 16:43:17 +0200
Subject: [Buildroot] [PATCH] Bump libpng version
Message-ID: <20081006164317.7b026e39@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upgrade libpng to 1.2.32

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libpng/libpng.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: buildroot/package/libpng/libpng.mk
===================================================================
--- buildroot.orig/package/libpng/libpng.mk
+++ buildroot/package/libpng/libpng.mk
@@ -21,7 +21,7 @@
 # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
 # USA
 
-LIBPNG_VERSION:=1.2.25
+LIBPNG_VERSION:=1.2.32
 LIBPNG_DIR:=$(BUILD_DIR)/libpng-$(LIBPNG_VERSION)
 LIBPNG_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libpng
 LIBPNG_SOURCE:=libpng-$(LIBPNG_VERSION).tar.bz2


-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
