From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Jul 2021 22:14:02 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/vlc: bump version
 to 3.0.16
Message-ID: <20210712194110.BF2A0954EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=950eb0cf17efc607d5a98d0f3fe16e1efe8366d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Release notes:
https://www.videolan.org/vlc/releases/3.0.16.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a5585d5509bf8ff0ab7fefbb5d476cb7aa133fdd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vlc/vlc.hash | 8 ++++----
 package/vlc/vlc.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
index 396c3a2ab1..468ec7df35 100644
--- a/package/vlc/vlc.hash
+++ b/package/vlc/vlc.hash
@@ -1,7 +1,7 @@
-# From https://get.videolan.org/vlc/3.0.14/vlc-3.0.14.tar.xz.sha256
-sha256  49b93e5b33deaa37060e6b24a98200cad70c407947f14eb2a8b6a0c64d8535a6  vlc-3.0.14.tar.xz
-# From https://get.videolan.org/vlc/3.0.14/vlc-3.0.14.tar.xz.sha1
-sha1  8a8613f16a9053668d7a7dcfa1e6d8be93af3e89  vlc-3.0.14.tar.xz
+# From https://get.videolan.org/vlc/3.0.16/vlc-3.0.16.tar.xz.sha256
+sha256  ffae35fc64f625c175571d2346bc5f6207be99762517f15423e74f18399410f6  vlc-3.0.16.tar.xz
+# From https://get.videolan.org/vlc/3.0.16/vlc-3.0.16.tar.xz.sha1
+sha1  e22ac839a09b5ead8992ae6aa8ea886364283e6a  vlc-3.0.16.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index c1e190099e..06fc650f6f 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VLC_VERSION = 3.0.14
+VLC_VERSION = 3.0.16
 VLC_SITE = https://get.videolan.org/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPL-2.0+, LGPL-2.1+
