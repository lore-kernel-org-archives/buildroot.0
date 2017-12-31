From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Dec 2017 10:03:52 +0100
Subject: [Buildroot] [git commit branch/2017.11.x] Update for 2017.11.1
Message-ID: <20171231090454.E2CBB800D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b919080e2061598e1beac3fa04da8ce62ae1e5f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 12 ++++++++++++
 Makefile |  4 ++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index bca075a..5de127d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,15 @@
+2017.11.1, Released December 31th, 2017
+
+	Important / security related fixes.
+
+	Updated/fixed packages: asterisk, checkpolicy, dhcp, flann,
+	gdb, glibc, heimdal, kodi-pvr-mediaportal-tvserver,
+	kodi-pvr-stalker, libcue, libopenssl, libpqxx, libsoxr,
+	linknx, linux-tools, lldpd, ltp-testsuite, mariadb, mfgtools,
+	nodejs, nut, pulseaudio, python-cffi, qemu, rsync, tor, uboot,
+	uboot-tools, vlc, webkitgtk, weston, wireguard, wireshark,
+	xenomai, xfsprogs
+
 2017.11, Released November 30, 2017
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index a86d764..e4fb90a 100644
--- a/Makefile
+++ b/Makefile
@@ -87,9 +87,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2017.11
+export BR2_VERSION := 2017.11.1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1512070000
+BR2_VERSION_EPOCH = 1514710000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
