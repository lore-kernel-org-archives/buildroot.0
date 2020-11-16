From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Nov 2020 00:04:03 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] Update for 2020.02.8
Message-ID: <20201116225135.7F2F683675@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4832641bcab4e3487a986ac31110fb2c006b2c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 20 ++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 77e274f5ce..389e305a50 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,23 @@
+2020.02.8, released November 16th, 2020
+
+	Important / security related fixes.
+
+	Updated/fixed packages: angularjs, argp-standalone, asterisk,
+	bandwidthd, bitcoin, busybox, cryptsetup, darkhttpd, davfs2,
+	docker-cli, docker-containerd, docker-engine,
+	dovecot-pigeonhole, fastd, fbset, fbtft, freetype, gcc,
+	ghostscript, gnuradio, grpc, gst1-plugins-bad, jsoncpp,
+	keepalived, libass, libexif, libiqrf, libpam-tacplus, libraw,
+	linux-backports, linux-firmware, lzlib, netsnmp, nginx,
+	oniguruma, opencv3, openntpd, patchelf, php, postgresql,
+	python-pyqt5, qt5base, rauc, redis, samba4, slirp, systemd,
+	tcpdump, tmux, tor, webkitgtk, wireguard-linux-compat,
+	wireshark, wpewebkit, xen, xorriso, zeromq, zxing-cpp
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11931: Bugs in support/scripts/apply-patches.sh
+
 2020.02.7, released October 12th, 2020
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index bf17f52f8a..a3fc46e6f2 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2020.02.7
+export BR2_VERSION := 2020.02.8
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1602538000
+BR2_VERSION_EPOCH = 1605567000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index f08806df97..1695972664 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2020.02.7'
+RELEASE='2020.02.8'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
