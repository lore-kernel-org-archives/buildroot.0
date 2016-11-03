From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Nov 2016 21:46:51 +0100
Subject: [Buildroot] [git commit] CHANGES: additional updates for 2016.11-rc1
Message-ID: <20161103204704.CFE6781992@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2bc3d067ef2f30bf54b11d970f9e4b8908278ead
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 CHANGES | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index c041ec8..db27bc7 100644
--- a/CHANGES
+++ b/CHANGES
@@ -23,13 +23,13 @@
 	toolchainfile.cmake also no longer passes the compiler/linker
 	flags defined by Buildroot.
 
-	New defconfigs: warp7, Solidrun's MX6 Cubox/Hummingboard,
+	New defconfigs: WaRP7, Solidrun's MX6 Cubox/Hummingboard,
 	TS-4900, Grinn's liteBoard, Udoo MX6Q/DL, Qemu ARM noMMU,
-	BeagleBone Qt5 demo, Digilent Zybo.
+	BeagleBone Qt5 demo, Digilent Zybo, FriendlyARM Nanopi NEO.
 
 	New packages: arm-trusted-firmware, amd-catalyst, atop, aufs,
 	aufs-util, fwts, gst1-rtsp-server, libglob, libite, mfgtools,
-	mksh, motion, paho-mqtt-c, php-amqp, python-couchdb,
+	mksh, motion, paho-mqtt-c, php-amqp, pseudo, python-couchdb,
 	python-crcmod, python-cssutils, python-docutils,
 	python-futures, python-mwclient, python-mwscrape,
 	python-mwscrape2slob, python-pyelftools, python-pyicu,
@@ -67,6 +67,7 @@
 	#8946: Valgrind fails to build with stack protection turned on
 	#9021: Kodi - Broken: Illegal instruction (core dumped)
 	#9096: rootfs.ubi not created
+	#9111: glibc 2.23: libmvec.so not copied
 	#9176: minnowboard : USB not mounted
 	#9196: raspberry pi 3 default build seem broken
 	#9201: Permission denied make: *** [core-dependencies] Error 126 in
@@ -88,6 +89,7 @@
 	#9371: openssl: download failes with "Only allow downloads from primary
 	       download site" + local server
 	#9381: check-host-rpath issues
+	#9386: ubinize fails with or without custom config
 
 2016.08, Released September 1st, 2016
 
