From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 26 Jun 2011 23:07:01 +0200
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20110626210718.934E688E6E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=94ad0667ded7dd4c5c7c44df329f9eabe46314bd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index a10fa18..3419590 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,5 +1,20 @@
 2011.08, Not released yet:
 
+	Fixes all over the tree and new features.
+
+	Toolchain: uClibc 0.9.32 / NPTL support, ext-toolchain-wrapper
+	improvements, improved non-MMU support.
+
+	Updated/fixed packages: berkeleydb, bmon, busybox, dbus,
+	dbus-glib, ethtool, ffmpeg, gst-plugins-bad, libdnet,
+	libmpeg2, mtd-utils, qt, sudo, synergy, usbutils, webkit
+
+	New packages: live555, sredird, statserial, yajl
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#3907: 2011.05 - Qt 4.7.3 not building on ARM
+
 2011.05, Released May 27th, 2011:
 
 	Updated/fixed packages: makedevs
-- 
1.7.3.4
