From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 21:33:09 +0100
Subject: [Buildroot] [git commit] package/x11r7/xapp_bitmap: bump version to
 1.0.9
Message-ID: <20190315203119.DC27D8EFC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd476bb179bc4cb2277b654cc599dda45c3e9c76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xapp_bitmap/xapp_bitmap.hash | 9 +++++++--
 package/x11r7/xapp_bitmap/xapp_bitmap.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_bitmap/xapp_bitmap.hash b/package/x11r7/xapp_bitmap/xapp_bitmap.hash
index cd64362084..f632bce3c5 100644
--- a/package/x11r7/xapp_bitmap/xapp_bitmap.hash
+++ b/package/x11r7/xapp_bitmap/xapp_bitmap.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2015-January/002518.html
-sha256	806cdeb80f5466ba9121e8cc6c6af82d3e4b32ef1a57bc5a76c15887640ec35d	bitmap-1.0.8.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-February/002941.html
+md5 b94172053ffa282bd88274f1e6a677f1  bitmap-1.0.9.tar.bz2
+sha1 26ba3130b14a2db81b427f2353ac21301c5d2527  bitmap-1.0.9.tar.bz2
+sha256 e0f3afad5272d796f54c33fa1b5bd1fb3f62843a54b28c87196d06a35123e5f5  bitmap-1.0.9.tar.bz2
+sha512 873c626c72a0f4025fe8c8aeedbf3fe4ee5657fb487ad7410406a20da518c0358041dc45c2549926cc10e1d031977073b9d1ddb32830fdce95b716a52fe44456  bitmap-1.0.9.tar.bz2
+# Locally computed
+sha256 03be44611edac06827bd13c0815a67ecd37ffe8fb1b9e210d6545d79bec89a3a  COPYING
diff --git a/package/x11r7/xapp_bitmap/xapp_bitmap.mk b/package/x11r7/xapp_bitmap/xapp_bitmap.mk
index 1ee2880adc..6bc0dbde0d 100644
--- a/package/x11r7/xapp_bitmap/xapp_bitmap.mk
+++ b/package/x11r7/xapp_bitmap/xapp_bitmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_BITMAP_VERSION = 1.0.8
+XAPP_BITMAP_VERSION = 1.0.9
 XAPP_BITMAP_SOURCE = bitmap-$(XAPP_BITMAP_VERSION).tar.bz2
 XAPP_BITMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_BITMAP_LICENSE = MIT
