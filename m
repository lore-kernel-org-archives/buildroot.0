From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  4 Jul 2016 15:46:55 +0200
Subject: [Buildroot] [PATCH 1/2] netcat-openbsd: remove stray ~ character at
	end of Config.in
Message-ID: <1467640016-19732-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netcat-openbsd/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/netcat-openbsd/Config.in b/package/netcat-openbsd/Config.in
index fec0ad5..9681801 100644
--- a/package/netcat-openbsd/Config.in
+++ b/package/netcat-openbsd/Config.in
@@ -21,4 +21,3 @@ config BR2_PACKAGE_NETCAT_OPENBSD
 comment "netcat-openbsd needs a glibc toolchain w/ threads"
 	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC
-~
-- 
2.7.4
