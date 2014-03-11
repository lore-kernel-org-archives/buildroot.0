From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Tue, 11 Mar 2014 19:53:44 +0100
Subject: [Buildroot] [PATCH v5 1/6] libdrm: Remove xorg dependency for intel
	driver
Message-ID: <BLU0-SMTP20422ECD84A18D82671FAE4D9770@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/libdrm/Config.in |    1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index 7192e94..24ff7de 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -13,7 +13,6 @@ menu "DRM Drivers"
 
 config BR2_PACKAGE_LIBDRM_INTEL
 	bool "intel"
-	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBATOMIC_OPS
 	select BR2_PACKAGE_XLIB_LIBPCIACCESS
 	depends on BR2_i386 || BR2_x86_64
-- 
1.7.10.4
