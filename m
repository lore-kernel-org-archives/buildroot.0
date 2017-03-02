From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  2 Mar 2017 09:47:42 -0300
Subject: [Buildroot] [PATCH] libinput: bump to version 1.6.2
Message-ID: <20170302124742.22185-1-gustavo@zacarias.com.ar>
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
index 7dd4c04..78f022a 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2017-February/032940.html
-sha256 9d816f13eee63bcca0e9c3bb652c52ab55f39be4d1b90b54e4bfd1dc92ef55a8  libinput-1.6.1.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2017-February/033169.html
+sha256 96fc0e0b24a96042b16e561201979dfa4a3f00a642538195c62f72b79f4084fa  libinput-1.6.2.tar.xz
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 776e1af..6cfe407 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.6.1
+LIBINPUT_VERSION = 1.6.2
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
-- 
2.10.2
