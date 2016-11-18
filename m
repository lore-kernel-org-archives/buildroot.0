From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 18 Nov 2016 07:39:37 +0200
Subject: [Buildroot] [PATCH] olsr: fix package name display
Message-ID: <f2e7a59828f3542eeca072e3c450be24df0555c4.1479447577.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the package name, olsr, instead of the tarball file name.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/olsr/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/olsr/Config.in b/package/olsr/Config.in
index 2f3d024bd6df..85c5b4da1f87 100644
--- a/package/olsr/Config.in
+++ b/package/olsr/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_OLSR
-	bool "olsrd"
+	bool "olsr"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
-- 
2.10.2
