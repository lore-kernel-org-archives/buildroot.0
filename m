From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 24 May 2017 23:13:17 +0200
Subject: [Buildroot] [PATCH/next] package/vlc: bump version to 2.2.6
Message-ID: <20170524211317.3831-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vlc/vlc.hash | 4 ++--
 package/vlc/vlc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
index efd4e27e7..628dad74d 100644
--- a/package/vlc/vlc.hash
+++ b/package/vlc/vlc.hash
@@ -1,2 +1,2 @@
-# From http://download.videolan.org/pub/videolan/vlc/2.2.3/vlc-2.2.3.tar.xz.sha256
-sha256 1632e91d2a0087e0ef4c3fb4c95c3c2890f7715a9d1d43ffd46329f428cf53be  vlc-2.2.4.tar.xz
+# From http://download.videolan.org/pub/videolan/vlc/2.2.6/vlc-2.2.6.tar.xz.sha256
+sha256 c403d3accd9a400eb2181c958f3e7bc5524fe5738425f4253d42883b425a42a8  vlc-2.2.6.tar.xz
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 36b5fd3ea..49390a285 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VLC_VERSION = 2.2.4
+VLC_VERSION = 2.2.6
 VLC_SITE = http://get.videolan.org/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPL-2.0+, LGPL-2.1+
-- 
2.11.0
