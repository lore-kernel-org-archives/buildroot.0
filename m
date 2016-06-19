From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 19 Jun 2016 09:50:19 -0300
Subject: [Buildroot] [PATCH] libinput: bump to version 1.3.2
Message-ID: <1466340619-16714-1-git-send-email-gustavo@zacarias.com.ar>
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
index faf95c3..1bb0973 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2016-May/029126.html
-sha256	cdff653d93395c718f367af61fee866914bc45de75ac94abe7dc1b720462aca9	libinput-1.3.1.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2016-June/029485.html
+sha256	0701230781b59c0f1510ae86da15a7b15655e723ace366ad479ccb09fe92a183	libinput-1.3.2.tar.xz
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 2ff0de3..66a494b 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.3.1
+LIBINPUT_VERSION = 1.3.2
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
-- 
2.7.3
