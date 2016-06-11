From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Jun 2016 20:06:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/vlc: bump version to 2.2.4
Message-ID: <1465668365-29201-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vlc/vlc.hash | 2 +-
 package/vlc/vlc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
index 04632e0..e86fafe 100644
--- a/package/vlc/vlc.hash
+++ b/package/vlc/vlc.hash
@@ -1,2 +1,2 @@
 # From http://download.videolan.org/pub/videolan/vlc/2.2.3/vlc-2.2.3.tar.xz.sha256
-sha256 b9d7587d35f13c3c981964c8cc8b03f1c7c8edf528be476b3ca1d2efedd5bf5b  vlc-2.2.3.tar.xz
+sha256 1632e91d2a0087e0ef4c3fb4c95c3c2890f7715a9d1d43ffd46329f428cf53be  vlc-2.2.4.tar.xz
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 4dc8dfe..8efbecb 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VLC_VERSION = 2.2.3
+VLC_VERSION = 2.2.4
 VLC_SITE = http://get.videolan.org/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPLv2+ LGPLv2.1+
-- 
2.8.1
