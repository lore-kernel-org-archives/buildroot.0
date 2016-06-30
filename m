From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 00:00:13 +0200
Subject: [Buildroot] [git commit] libinput: bump to version 1.3.3
Message-ID: <20160630220044.8E8E482198@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d43adf36f8c2d32cdbc9e9a5244b7d600a456b38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libinput/libinput.hash | 4 ++--
 package/libinput/libinput.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 1bb0973..764cf71 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2016-June/029485.html
-sha256	0701230781b59c0f1510ae86da15a7b15655e723ace366ad479ccb09fe92a183	libinput-1.3.2.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2016-June/029680.html
+sha256	30c8edfe47654a38c235ac6b0541d79fd593d010bc18cdda8bd1f6cc6ad8b1ce	libinput-1.3.3.tar.xz
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 66a494b..b1b4f61 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.3.2
+LIBINPUT_VERSION = 1.3.3
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
