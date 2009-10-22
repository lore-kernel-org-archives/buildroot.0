From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 22 Oct 2009 23:06:11 +0200
Subject: [Buildroot] [git commit master] Update sqlite package to version
	3.6.18
Message-ID: <20091022210719.474887772A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ab17f403955a169a6ec9e8e16be6f1ce527b3f01
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #655.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                           |    5 +++--
 package/database/sqlite/sqlite.mk |    2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index b1f4135..dc7112c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -9,8 +9,8 @@
 	libevent, libglib2, liblockfile, libmad, libnl, libupnp, libuuid,
 	ltrace, lua, mdadm, ncftp, ncurses, netkittelnet, ntfs-3g, openssl,
 	php, python, quagga, radvd, rsync, samba, shared-mime-info,
-	speech-tools, squashfs, syslinux, u-boot, util-linux, valgrind,
-	vsftpd, wipe, wpa-supplicant, xdata_xcursor-themes, zlib
+	speech-tools, sqlite, squashfs, syslinux, u-boot, util-linux,
+	valgrind, vsftpd, wipe, wpa-supplicant, xdata_xcursor-themes, zlib
 
 	Removed package: mdnsresponder, mpatrol
 
@@ -28,6 +28,7 @@
 	#617: netkit/inetd requires RPC and fails to build if RPC is disabled
 	#619: netkittelnet requires netkitbase to install, but there's no dependency
 	#653: [SECURITY] Update php package to version 5.2.11
+	#655: Update sqlite package to version 3.6.18
 	#657: Bug in imagemagick-clean target
 	#665: [PATCH] Samba package
 
diff --git a/package/database/sqlite/sqlite.mk b/package/database/sqlite/sqlite.mk
index 6b57185..00e5559 100644
--- a/package/database/sqlite/sqlite.mk
+++ b/package/database/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SQLITE_VERSION = 3.6.16
+SQLITE_VERSION = 3.6.18
 SQLITE_SOURCE = sqlite-amalgamation-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org
 SQLITE_INSTALL_STAGING = YES
-- 
1.6.3.3
