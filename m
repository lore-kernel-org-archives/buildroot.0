From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Jul 2016 16:10:26 +0200
Subject: [Buildroot] [git commit] netcat-openbsd: remove stray ~ character
	at end of Config.in
Message-ID: <20160704141454.C9A55817C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=011d684c0b1cf0e0fcc7c207f4746efaf5bd64b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
