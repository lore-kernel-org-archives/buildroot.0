From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 17 Jun 2020 19:54:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/vlc: security bump version to 3.0.11
Message-ID: <20200617175410.1172563-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2020-13428: https://www.videolan.org/security/sb-vlc3011.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vlc/vlc.hash | 12 ++++++------
 package/vlc/vlc.mk   |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
index 8b2910af49..7775e449f4 100644
--- a/package/vlc/vlc.hash
+++ b/package/vlc/vlc.hash
@@ -1,9 +1,9 @@
-# From https://get.videolan.org/vlc/3.0.10/vlc-3.0.10.tar.xz.sha256
-sha256  a966abfc7f3b2ff3adaa130306ecaf5d6ad3b6dc73385fc9ab0c1204029d4c31  vlc-3.0.10.tar.xz
-# From https://get.videolan.org/vlc/3.0.10/vlc-3.0.10.tar.xz.sha1
-sha1  4b3c75d1861bf463db53ba9059e8cc165f5c30a7  vlc-3.0.10.tar.xz
-# From https://get.videolan.org/vlc/3.0.10/vlc-3.0.10.tar.xz.md5
-md5  28417dd27462ccb014b7dc7e50e9e9d6  vlc-3.0.10.tar.xz
+# From https://get.videolan.org/vlc/3.0.11/vlc-3.0.11.tar.xz.sha256
+sha256  3e94a1acf33445e9da15d528aa48657aa26b912eaa2656b403d43860a8834919  vlc-3.0.11.tar.xz
+# From https://get.videolan.org/vlc/3.0.11/vlc-3.0.11.tar.xz.sha1
+sha1  66d377a2f24b6b865d5c56530e10d84b8262b46c  vlc-3.0.11.tar.xz
+# From https://get.videolan.org/vlc/3.0.11/vlc-3.0.11.tar.xz.md5
+md5  7e68f9e2d307eb7cc16e7345cda9e978  vlc-3.0.11.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 039f106181..38d9751690 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VLC_VERSION = 3.0.10
+VLC_VERSION = 3.0.11
 VLC_SITE = https://get.videolan.org/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPL-2.0+, LGPL-2.1+
-- 
2.26.2
