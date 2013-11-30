From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Nov 2013 09:37:14 +0100
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20131130084024.DAD939BE7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1351d0c284e1b85db92caa8af51bb56a6e432b1d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index e5d0f37..8604337 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,24 @@
+2013.11, Not yet released:
+
+	Minor fixes.
+
+	Updated/fixed packages: apr, binutils, dbus-python, dropwatch,
+	ecryptfs-utils, eglibc, gdb, gpsd, grantlee, hostapd,
+	iptables, qlibiscsi, libnspr, libnss, libpfm4, libtool,
+	lua-ev, lvm2, mplayer, qt, qt5, quagga, ruby, tinymembench,
+	tvheadend, util-linux, wpa_supplicant
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#1279: Buildroot compiled Busybox and Coreutils LFS issues
+	#2995: -fstack-protector-all causes ssh to SIGSEGV
+	#5570: Cannot compile software on the target machine
+	#6428: util-linux libmount segfaults with patch from buildroot
+	#6500: php fails to build for armel
+	#6554: gdb needs to dependents on host texinfo
+	#6692: GNU nano fails to compile for x86_64
+	#6704: wpa_supplicant: fix wrong path to executable file in D-Bus
+
 2013.11-rc3, Released November 26th, 2013
 
 	Fixes all over the tree.
