From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2021 19:43:17 +0100
Subject: [Buildroot] [git commit] Update for 2020.11.3
Message-ID: <20210217182321.0C7C2860E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ecbfbabcf746bc9c9ff00c31f1b602c996c0db69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 610e67b1fc4ac44e0c4a7ba437c917ad6d63f481)
[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 24 ++++++++++++++++++++++++
 support/misc/Vagrantfile |  2 +-
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/CHANGES b/CHANGES
index 01c2c7688d..6804131d50 100644
--- a/CHANGES
+++ b/CHANGES
@@ -78,6 +78,30 @@
 	#13471: package/mpd/mpd.conf make use of path not created
 	#13506: BR2_PACKAGE_DHCPCD missing directory creation
 
+2020.11.3, released February 17th, 2021
+
+	meson: Fix ccache detection handling when per-package builds
+	are used.
+
+	Fakeroot: Fix compatibility issue with glibc 2.33
+
+	Updated/fixed packages: atftp, binutils, busybox, cereal,
+	chartjs, connman, dhcpcd, dnsmasq, docker-cli, docker-engine,
+	ebtables, fakeroot, flashrom, go, gst1-python, guile,
+	intel-mediadriver, intel-microcode, jasper,
+	kodi-inputstream-adaptive, lcms2, libbsd, libopenssl,
+	makedumpfile, memtester, mosquitto, ne10, openblas, orc, php,
+	postgresql, privoxy, pugixml, python-bottle, python-django,
+	python3, rauc, sox, stress-ng, subversion, tzdata,
+	uboot-tools, uclibc, webkitgtk, wireguard-linux-compat,
+	wireshark, wpa_supplicant, wpewebkit, xenomai,
+	xserver_xorg-server, xterm
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11706: binman (U-boot tool) cannot find libfdt "binman: No mod..
+	#13506: BR2_PACKAGE_DHCPCD missing directory creation
+
 2020.11.2, released January 31st, 2021
 
 	Important / security related fixes.
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index ed12abd2f0..28a74b9929 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2020.11.2'
+RELEASE='2020.11.3'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
