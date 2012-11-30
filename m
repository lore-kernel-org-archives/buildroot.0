From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Nov 2012 14:27:34 -0800
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20121130223214.008B2995BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d38b25f1be63fe30b190d165a6d6dde891e633f6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index db7b233..7e5de2e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -4,9 +4,13 @@
 
 	Various manual updates and fixes.
 
-	Updated/fixed packages: arptables, binutils, busybox, ccache,
-	cjson, directfb, gdb, hiawatha, lcdproc, libdaemon, libecore,
-	libhid, libpcap, libusb, linux-fusion, ocf-linux, strace,
+	Add checks for legacy features.
+
+	Updated/fixed packages: acpid, alsa-lib, arptables, binutils,
+	busybox, ccache, cjson, cramfs, directfb, flex, gdb, hiawatha,
+	imagemagick, lcdproc, libdaemon, libecore, libhid, libmad,
+	libpcap, libusb, linux-fusion, matchbox, ocf-linux, owl-linux,
+	scons, strace
 
 	Issues resolved (http://bugs.uclibc.org):
 
