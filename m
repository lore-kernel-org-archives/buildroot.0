From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Jul 2019 08:56:13 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/webkitgtk: bump
 to version 2.24.3
Message-ID: <20190707065437.661618A5B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8749266fbd5cf3c79906a7073e03c7c7e60437e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Version 2.24.3 is a minor update which contains many bugfixes.
From the announcement:

  - Fix previous/next gestures in RTL mode.
  - Fix rendering artifacts in popular sites (YouTube, GitHub, etc.)
  - Fix media playback annoyances (volume randomly changing, HLS streams
    starting too slowly, some audio streams would not play, etc.)
  - Fix build with audio and video disabled.

  https://webkitgtk.org/2019/07/02/webkitgtk2.24.3-released.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3ff05d9094be1329b5987589d6b6fefb152ff006)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/webkitgtk.hash | 8 ++++----
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 40bb6f7b63..f1784da2ad 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.24.2.tar.xz.sums
-md5 83012998e1b9f71abb37d8baf6f9c7e6 webkitgtk-2.24.2.tar.xz
-sha1 632a65d93beb996bebdf7592ef9591f3993dea91 webkitgtk-2.24.2.tar.xz
-sha256 019cb1f0d05bf6148b72c7a85734bcd006388a1c14132843ef9a1b2cb7b4321c webkitgtk-2.24.2.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.24.3.tar.xz.sums
+md5 e2a5bbd09a217eba096a2d1562143e35 webkitgtk-2.24.3.tar.xz
+sha1 26a33fd0af8223c130427cd59aaf5ccaba584114 webkitgtk-2.24.3.tar.xz
+sha256 940d746d7e82c357222feb5b3f44c4b201e81df7d81ddca5ca2bf3ae0acf6c51 webkitgtk-2.24.3.tar.xz
 
 # Hashes for license files:
 sha256 0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4 Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index e81ba047e4..f8cd728351 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.24.2
+WEBKITGTK_VERSION = 2.24.3
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
