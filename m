From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Oct 2019 08:54:44 +0200
Subject: [Buildroot] [git commit] Update for 2019.05.3
Message-ID: <20191004065211.ADD6F88551@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8bab5be06a7516388bef4cad86554fd4848e246
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ea8686068f5ba060181823bdd4ec04a6fa73af39)
[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/CHANGES b/CHANGES
index 49e05ec3f6..ed010edec5 100644
--- a/CHANGES
+++ b/CHANGES
@@ -195,6 +195,41 @@
 	#12051: package/dhcp installs libtool wrapper scripts on tar...
 	#12076: Patchelf can link against an incompatible libc++ ver...
 
+2019.05.3, Released October 3rd, 2019
+
+	Important / security related fixes.
+
+	Defconfigs: AArch64-efi: Fix grub configuration, Beaglebone:
+	Use default console settings
+
+	Dependencies: Ensure host has JSON::PP perl module installed
+	if webkitgtk/wpewebkit packages are enabled as it is needed
+	during their build process.
+
+	Toolchain: Generate check-headers program under BUILD_DIR
+	rather than /tmp to fix issues with distributions mounting
+	/tmp noexec.
+
+	Updated/fixed packages: asterisk, augeas, bind, bwm-ng, cups,
+	cups-filters, docker-cli, docker-engine, docker-proxy,
+	e2fsprogs, eudev, exim, expat, gcc, go, haveged, ifplugd,
+	iptables, joe, kf5-extra-cmake-modules, kf5-modemmanager-qt,
+	kf5-networkmanager-qtlibcamera, libcurl, libgcrypt,
+	libgpg-error, libnftl, libnspr, libnss, libopenssl,
+	libtorrent-rasterbar, luksmeta, mariadb, mbedtls, mongodb,
+	mosquitto, ncurses, nfs-utils, nghttp2, nodejs, openvmtools,
+	php, protobuf, putty, qemu, samba4, swupdate,
+	systemd-bootchart, thttpd, uclibc, unzip, util-linux,
+	wireshark
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#10806: Allow nfs-utils to use ipv6
+	#11781: mariadb build error
+	#12031: Build of cups-filters fails while linking, apparently due..
+	#12141: eudev package is missing "render" and "kvm" groups
+	#12241: Permission denied while running "make"
+
 2019.05.2, Released September 3rd, 2019
 
 	Important / security related fixes.
