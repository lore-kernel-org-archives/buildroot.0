From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 28 Jan 2016 21:21:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/libinput: bump version to 1.1.5
Message-ID: <1454012486-8179-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libinput/libinput.hash | 4 ++--
 package/libinput/libinput.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 20b7bf0..ea4c8e7 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/wayland-devel/2015-December/026233.html
-sha256	302cb76209b9c57a5a318e178f9bc446eede8ea79386103b5291cbfaa5fab5b6	libinput-1.1.4.tar.xz
+# From http://lists.freedesktop.org/archives/wayland-devel/2016-January/026701.html
+sha256	5e08c45dbb8bf32490cc6cd626da098564d646d161a07cba2e3adbd9745c0622	libinput-1.1.5.tar.xz
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 8b69a51..6d8b7b6 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.1.4
+LIBINPUT_VERSION = 1.1.5
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_LICENSE = MIT
-- 
2.7.0.rc3
