From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 22:42:18 +0200
Subject: [Buildroot] [git commit branch/next] package/vlc: bump version to
	2.2.6
Message-ID: <20170531204222.3382182825@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b2f2f92887df5333772a9d0b75b5c4cb5675dd88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vlc/vlc.hash | 4 ++--
 package/vlc/vlc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
index efd4e27..628dad7 100644
--- a/package/vlc/vlc.hash
+++ b/package/vlc/vlc.hash
@@ -1,2 +1,2 @@
-# From http://download.videolan.org/pub/videolan/vlc/2.2.3/vlc-2.2.3.tar.xz.sha256
-sha256 1632e91d2a0087e0ef4c3fb4c95c3c2890f7715a9d1d43ffd46329f428cf53be  vlc-2.2.4.tar.xz
+# From http://download.videolan.org/pub/videolan/vlc/2.2.6/vlc-2.2.6.tar.xz.sha256
+sha256 c403d3accd9a400eb2181c958f3e7bc5524fe5738425f4253d42883b425a42a8  vlc-2.2.6.tar.xz
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 36b5fd3..49390a2 100644
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
