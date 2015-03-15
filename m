From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 15 Mar 2015 12:19:10 +0100
Subject: [Buildroot] [PATCH 01/14] package/libinput: bump version to 0.12.0
Message-ID: <1426418363-22738-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libinput/libinput.hash |    4 ++--
 package/libinput/libinput.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index f2791e0..1e4adc5 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/wayland-devel/2015-February/019827.html
-sha256  4ce001f80ff1a6bf547784d02125648bf8abe60db7d3d5e0020294d5215c1441  libinput-0.10.0.tar.xz
+# From http://lists.freedesktop.org/archives/wayland-devel/2015-March/020475.html
+sha256	6e0ce9dd9ff04e9ac382dffb7fa332b94f093227a197a9c8189e87de6d88b55a	libinput-0.12.0.tar.xz
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 5a793b0f..a6dec86 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 0.10.0
+LIBINPUT_VERSION = 0.12.0
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_LICENSE = MIT
-- 
1.7.10.4
