From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jun 2016 23:55:33 +0200
Subject: [Buildroot] [git commit] package/vlc: bump version to 2.2.4
Message-ID: <20160611215726.8DD52802E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf586c6b6c2de018f28e6c2a676f001648d2b327
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vlc/vlc.hash | 2 +-
 package/vlc/vlc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
index 04632e0..efd4e27 100644
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
