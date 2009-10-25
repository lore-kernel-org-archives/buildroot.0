From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Sun, 25 Oct 2009 21:05:38 +0100
Subject: [Buildroot] [git commit master] package: Bump SawMan to 1.4.2
Message-ID: <20091025200944.E8C147773F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b208bd4daa01e9af421debe7276f2ff4fc3bb052
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |    2 +-
 package/sawman/sawman.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index dc7112c..a7e56c9 100644
--- a/CHANGES
+++ b/CHANGES
@@ -8,7 +8,7 @@
 	gst-plugins-good, imagemagick, iptables, kernel-headers, kismet,
 	libevent, libglib2, liblockfile, libmad, libnl, libupnp, libuuid,
 	ltrace, lua, mdadm, ncftp, ncurses, netkittelnet, ntfs-3g, openssl,
-	php, python, quagga, radvd, rsync, samba, shared-mime-info,
+	php, python, quagga, radvd, rsync, samba, sawman, shared-mime-info,
 	speech-tools, sqlite, squashfs, syslinux, u-boot, util-linux,
 	valgrind, vsftpd, wipe, wpa-supplicant, xdata_xcursor-themes, zlib
 
diff --git a/package/sawman/sawman.mk b/package/sawman/sawman.mk
index 76e599a..01bb3da 100644
--- a/package/sawman/sawman.mk
+++ b/package/sawman/sawman.mk
@@ -3,7 +3,7 @@
 # SAWMAN
 #
 #############################################################
-SAWMAN_VERSION:=1.4.1
+SAWMAN_VERSION:=1.4.2
 SAWMAN_SOURCE:=SaWMan-$(SAWMAN_VERSION).tar.gz
 SAWMAN_SITE:=http://www.directfb.org/downloads/Extras
 SAWMAN_INSTALL_STAGING = YES
-- 
1.6.3.3
