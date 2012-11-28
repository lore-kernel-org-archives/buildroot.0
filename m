From: =?utf-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau@advansee.com>
Date: Wed, 28 Nov 2012 19:35:16 +0100 (CET)
Subject: [Buildroot] [PATCH] ccache: Fix URL
Message-ID: <1730327325.2344547.1354127716141.JavaMail.root@advansee.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau@advansee.com>
---
 .../package/ccache/Config.in                                         |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git buildroot-722b82f.orig/package/ccache/Config.in buildroot-722b82f/package/ccache/Config.in
index f4f7f8f..4a37973 100644
--- buildroot-722b82f.orig/package/ccache/Config.in
+++ buildroot-722b82f/package/ccache/Config.in
@@ -5,5 +5,5 @@ config BR2_PACKAGE_CCACHE
 	  caching previous compilations and detecting when the same
 	  compilation is being done again
 
-	  http://samba.ccache.org
+	  http://ccache.samba.org
 
