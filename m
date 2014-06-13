From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 13 Jun 2014 23:53:40 +0200
Subject: [Buildroot] [PATCH] package/libatasmart: point to a better homepage
Message-ID: <1402696420-6649-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/libatasmart/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libatasmart/Config.in b/package/libatasmart/Config.in
index 534e7c1..9db3b09 100644
--- a/package/libatasmart/Config.in
+++ b/package/libatasmart/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_LIBATASMART
 	  The libatasmart package is a disk reporting library.
 	  It only supports a subset of the ATA S.M.A.R.T. functionality.
 
-	  http://www.linuxfromscratch.org/blfs/view/svn/general/libatasmart.html
+	  http://0pointer.de/blog/projects/being-smart.html
 
 comment "libatasmart requires udev to be enabled"
 	depends on !BR2_PACKAGE_HAS_UDEV
-- 
1.8.3.2
