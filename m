From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Feb 2017 18:02:39 -0300
Subject: [Buildroot] [PATCH next] libinput: bump to version 1.6.1
Message-ID: <20170215210239.3107-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libinput/libinput.hash | 4 ++--
 package/libinput/libinput.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index dd3573f..7dd4c04 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2017-January/032746.html
-sha256 b7534f518d735c643aedca2fb4694683dfddc8d0600cfb628c87a18e65255832  libinput-1.6.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2017-February/032940.html
+sha256 9d816f13eee63bcca0e9c3bb652c52ab55f39be4d1b90b54e4bfd1dc92ef55a8  libinput-1.6.1.tar.xz
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 52aca9a..776e1af 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.6.0
+LIBINPUT_VERSION = 1.6.1
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
-- 
2.10.2
