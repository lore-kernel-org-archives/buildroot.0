From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  9 Aug 2015 13:36:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/sysdig: Fix typo in comment
Message-ID: <1439120178-27837-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/sysdig/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
index 36d35fb..dc71d5f 100644
--- a/package/sysdig/Config.in
+++ b/package/sysdig/Config.in
@@ -16,6 +16,6 @@ config BR2_PACKAGE_SYSDIG
 
 	  http://sysdig.org
 
-comment "sysdig needs a toolchain w/ C++, dynamibc library and a Linux kernel to be built"
+comment "sysdig needs a toolchain w/ C++, dynamic library and a Linux kernel to be built"
 	depends on !BR2_LINUX_KERNEL || !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
-- 
2.1.4
