From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Apr 2015 19:00:40 +0200
Subject: [Buildroot] [git commit] package/libinput: bump version to 0.13.0
Message-ID: <20150412170116.B409B7FF80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9e7c4ef021bc76c53dd5e9203e5fabf63052f531
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libinput/libinput.hash |    4 ++--
 package/libinput/libinput.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 1e4adc5..a910648 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/wayland-devel/2015-March/020475.html
-sha256	6e0ce9dd9ff04e9ac382dffb7fa332b94f093227a197a9c8189e87de6d88b55a	libinput-0.12.0.tar.xz
+# From http://lists.freedesktop.org/archives/wayland-devel/2015-March/020833.html
+sha256	6cecaf7fde525f1d81474cbd495ce526d5e34c845d3e9d6f3e2565b7048cc61a	libinput-0.13.0.tar.xz
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index a6dec86..a9723c6 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 0.12.0
+LIBINPUT_VERSION = 0.13.0
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_LICENSE = MIT
