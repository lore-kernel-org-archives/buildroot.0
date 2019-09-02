From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 17:54:44 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/vlc: bump version
 to 3.0.7.1
Message-ID: <20190902161353.4985088EF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c28141aab30f245c658117758f9524329c42271
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes green-flickering bug with Windows AMD drivers:
https://forum.videolan.org/viewtopic.php?p=492405#p492405

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4e5b4397588e5809ca0d8a6682520044da1ab57a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vlc/vlc.hash | 12 ++++++------
 package/vlc/vlc.mk   |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
index 9cda094337..ba053ea963 100644
--- a/package/vlc/vlc.hash
+++ b/package/vlc/vlc.hash
@@ -1,9 +1,9 @@
-# From http://download.videolan.org/pub/videolan/vlc/3.0.7/vlc-3.0.7.tar.xz.sha256
-sha256 5cb5fe140f0f4bae3e0a613fb5f516270f62e2dbde6de27fa78ea9f43cd73916 vlc-3.0.7.tar.xz
-# From http://download.videolan.org/pub/videolan/vlc/3.0.7/vlc-3.0.7.tar.xz.sha1
-sha1 8c9f96a11199e813ec718c3d1885501a557e336f vlc-3.0.7.tar.xz
-# From http://download.videolan.org/pub/videolan/vlc/3.0.7/vlc-3.0.7.tar.xz.md5
-md5 230932ec40185856af28f82ec2e38b8a vlc-3.0.7.tar.xz
+# From http://download.videolan.org/pub/videolan/vlc/3.0.7.1/vlc-3.0.7.1.tar.xz.sha256
+sha256 0655804371096772f06104b75c21cde8a76e3b6c8a2fdadc97914f082c6264f5 vlc-3.0.7.1.tar.xz
+# From http://download.videolan.org/pub/videolan/vlc/3.0.7.1/vlc-3.0.7.1.tar.xz.sha1
+sha1 3f6f9e56695eeea662b86602963721f1ac7afd23 vlc-3.0.7.1.tar.xz
+# From http://download.videolan.org/pub/videolan/vlc/3.0.7.1/vlc-3.0.7.1.tar.xz.md5
+md5 1adf2fe21070378b0e45ad163d3b232d vlc-3.0.7.1.tar.xz
 # Locally computed
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 1f58823ad3..a736643159 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VLC_VERSION = 3.0.7
+VLC_VERSION = 3.0.7.1
 VLC_SITE = https://get.videolan.org/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPL-2.0+, LGPL-2.1+
