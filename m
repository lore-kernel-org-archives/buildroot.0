From: Peter Seiderer <ps.report@gmx.net>
Date: Fri,  3 Apr 2020 20:55:31 +0200
Subject: [Buildroot] [PATCH v1] package/sysdig: update upstream URL in
 Config.in
Message-ID: <20200403185531.500-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes #12746 ([1]).

[1] https://bugs.busybox.net/show_bug.cgi?id=12746

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/sysdig/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
index c37d8d05cc..5c22bb0b52 100644
--- a/package/sysdig/Config.in
+++ b/package/sysdig/Config.in
@@ -23,7 +23,7 @@ config BR2_PACKAGE_SYSDIG
 	  Think of it as strace + tcpdump + lsof + awesome sauce.
 	  With a little Lua cherry on top.
 
-	  http://sysdig.org
+	  https://github.com/draios/sysdig
 
 comment "sysdig needs a glibc or uclibc toolchain w/ C++, gcc >= 4.8, dynamic library and a Linux kernel to be built"
 	depends on !BR2_LINUX_KERNEL || !BR2_INSTALL_LIBSTDCPP \
-- 
2.26.0
