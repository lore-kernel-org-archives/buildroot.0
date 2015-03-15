From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 14:18:26 +0100
Subject: [Buildroot] [git commit] package/libinput: bump version to 0.12.0
Message-ID: <20150315132246.7EA0D807CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d67c01c8b75acdb76b28b710bddc729563adfc94
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
