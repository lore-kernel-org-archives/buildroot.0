From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  1 Jun 2016 08:37:17 -0300
Subject: [Buildroot] [PATCH 4/4] libinput: bump to version 1.3.1
In-Reply-To: <1464781037-26791-1-git-send-email-gustavo@zacarias.com.ar>
References: <1464781037-26791-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1464781037-26791-4-git-send-email-gustavo@zacarias.com.ar>
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
index bd77321..faf95c3 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2016-May/028704.html
-sha256	998a75fb261d161efaa7da44411cdc9a32a953280e4ffc6322ca19f057d0c1ea	libinput-1.3.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2016-May/029126.html
+sha256	cdff653d93395c718f367af61fee866914bc45de75ac94abe7dc1b720462aca9	libinput-1.3.1.tar.xz
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index b848954..2ff0de3 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.3.0
+LIBINPUT_VERSION = 1.3.1
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
-- 
2.7.3
