From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Jan 2016 15:55:16 +0100
Subject: [Buildroot] [PATCH 4/5] package/libinput: bump version to 1.1.4
In-Reply-To: <1453042517-12040-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453042517-12040-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1453042517-12040-4-git-send-email-bernd.kuhls@t-online.de>
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
index 56b2c10..20b7bf0 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/wayland-devel/2015-December/026041.html
-sha256	a323a32718a8f0f5e85e1ed3a81f0dde45eb52b215a15c7887bec40961d97a84	libinput-1.1.2.tar.xz
+# From http://lists.freedesktop.org/archives/wayland-devel/2015-December/026233.html
+sha256	302cb76209b9c57a5a318e178f9bc446eede8ea79386103b5291cbfaa5fab5b6	libinput-1.1.4.tar.xz
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 91d6e53..8b69a51 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.1.2
+LIBINPUT_VERSION = 1.1.4
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_LICENSE = MIT
-- 
2.7.0.rc3
