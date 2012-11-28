From: =?utf-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau@advansee.com>
Date: Wed, 28 Nov 2012 19:35:32 +0100 (CET)
Subject: [Buildroot] [PATCH] ccache: Bump version
Message-ID: <912081575.2344559.1354127732064.JavaMail.root@advansee.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau@advansee.com>
---
 .../package/ccache/ccache.mk                                         |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git buildroot-722b82f.orig/package/ccache/ccache.mk buildroot-722b82f/package/ccache/ccache.mk
index b9c2039..1cbad6e 100644
--- buildroot-722b82f.orig/package/ccache/ccache.mk
+++ buildroot-722b82f/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-CCACHE_VERSION = 3.1.7
+CCACHE_VERSION = 3.1.8
 CCACHE_SITE    = http://samba.org/ftp/ccache
 CCACHE_SOURCE  = ccache-$(CCACHE_VERSION).tar.bz2
 
