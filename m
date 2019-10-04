From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Oct 2019 08:37:43 +0200
Subject: [Buildroot] [git commit] Update for 2019.08.1
Message-ID: <20191004063557.CCB5C87FEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c814962f0f0d839085f4cd849376fb1492b6e9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d77f6c1712400cc6a11ffeb80f9f6d8668834359)
[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/CHANGES b/CHANGES
index b75e0558c5..49e05ec3f6 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,38 @@
+2019.08.1, released October 3rd, 2019
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
+	Updated/fixed packages: asterisk, augeas, axel, bind, bwm-ng,
+	cups, cups-filters, docker-cli, docker-engine, docker-proxy,
+	e2fsprogs, eudev, exim, expat, gcc, go, haveged, ifplugd, joe,
+	kf5-extra-cmake-modules, kf5-modemmanager-qt,
+	kf5-networkmanager-qt, libcamera, libcurl, libgcrypt,
+	libglib2, libgpg-error, libnspr, libnss, libopenssl,
+	logrotate, luksmeta, mariadb, mbedtls, mongodb, mosquitto,
+	ncurses, nfs-utils, nghttp2, nodejs, openvmtools, php,
+	protobuf, putty, qemu, samba4, snort, swupdate,
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
 2019.08, released September 1st, 2019
 
 	Various fixes.
