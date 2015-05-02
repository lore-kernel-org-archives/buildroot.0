From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  2 May 2015 10:17:36 +0200
Subject: [Buildroot] [PATCH 02/10] package/x11r7/xlib_libxkbfile: bump
	version to 1.0.9
In-Reply-To: <1430554664-19320-1-git-send-email-bernd.kuhls@t-online.de>
References: <1430554664-19320-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1430554664-19320-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash |    4 ++--
 package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash
index 83431cb..759b2ae 100644
--- a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash
+++ b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/pipermail/xorg/2012-March/054011.html
-sha256	8aa94e19c537c43558f30906650cea6e15fa012591445d9f927658c3b32a8f3a	libxkbfile-1.0.8.tar.bz2
+# From http://lists.x.org/archives/xorg-announce/2015-April/002592.html
+sha256	51817e0530961975d9513b773960b4edd275f7d5c72293d5a151ed4f42aeb16a	libxkbfile-1.0.9.tar.bz2
diff --git a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
index 2d5e574..51c58c0 100644
--- a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
+++ b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXKBFILE_VERSION = 1.0.8
+XLIB_LIBXKBFILE_VERSION = 1.0.9
 XLIB_LIBXKBFILE_SOURCE = libxkbfile-$(XLIB_LIBXKBFILE_VERSION).tar.bz2
 XLIB_LIBXKBFILE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXKBFILE_LICENSE = MIT
-- 
1.7.10.4
