From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 22 Nov 2009 21:51:46 +0100
Subject: [Buildroot] [git commit master] Bump spawn-fcgi to 1.6.3
Message-ID: <20091122210624.C921E777F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3848cd6dcafb31e7f4d5204d295dff9d3698576d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #705

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                          |    7 ++++---
 package/spawn-fcgi/spawn-fcgi.mk |    2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index 2255f1d..adcd8bd 100644
--- a/CHANGES
+++ b/CHANGES
@@ -16,9 +16,9 @@
 	kismet, libelf, libevent, libglib2, libidn, liblockfile, libmad,
 	libpcap, libupnp, libuuid, lighttpd, ltrace, lua, lzma, mdadm, ncftp,
 	ncurses, netkittelnet, netsnmp, ntfs-3g, openntp, openssl, php, python,
-	quagga, radvd, rsync, samba, sawman, shared-mime-info, speech-tools,
-	sqlite, squashfs, synergy, syslinux, tcpdump, u-boot, util-linux,
-	valgrind, vsftpd, wipe
+	quagga, radvd, rsync, samba, sawman, shared-mime-info, spawn-fcgi,
+	speech-tools, sqlite, squashfs, synergy, syslinux, tcpdump, u-boot,
+	util-linux, valgrind, vsftpd, wipe
 
 	wpa-supplicant, xdata_xcursor-themes, zlib
 
@@ -45,6 +45,7 @@
 	#665: [PATCH] Samba package
 	#667: [PATCH] e2fsprogs
 	#703: [SECURITY] Update openssl package to 0.9.8l
+	#705: Bump spawn-fcgi package to 1.6.3
 	#709: Bump lighttpd package to 1.4.24
 	#713: Migrate openntpd package to Makefile.autotools.in
 	#715: Bump libidn package to 1.15 and other fixes
diff --git a/package/spawn-fcgi/spawn-fcgi.mk b/package/spawn-fcgi/spawn-fcgi.mk
index ac33d88..5070f73 100644
--- a/package/spawn-fcgi/spawn-fcgi.mk
+++ b/package/spawn-fcgi/spawn-fcgi.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SPAWN_FCGI_VERSION = 1.6.2
+SPAWN_FCGI_VERSION = 1.6.3
 SPAWN_FCGI_SITE = http://www.lighttpd.net/download
 SPAWN_FCGI_SOURCE = spawn-fcgi-$(SPAWN_FCGI_VERSION).tar.bz2
 
-- 
1.6.3.3
