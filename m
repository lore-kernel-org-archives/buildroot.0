From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Sep 2016 11:56:02 +0200
Subject: [Buildroot] [git commit] libinput: bump to version 1.5.0
Message-ID: <20160915095728.8906980339@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9714c6d2eff0991ebe84436d79b769a09b47ae81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libinput/libinput.hash | 4 ++--
 package/libinput/libinput.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 0cdcc38..10c5e9d 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2016-August/030857.html
-sha256	8c38826a785594811bef6a9daadbfa2e172e3f070f8863393d6fb7ca4c68e451	libinput-1.4.2.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2016-September/031054.html
+sha256	5a96559385ecfaa30f9e72ea89eb8ebbc97caf68e458f451f4ed62315311081c	libinput-1.5.0.tar.xz
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index eb74e34..2005c47 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.4.2
+LIBINPUT_VERSION = 1.5.0
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
