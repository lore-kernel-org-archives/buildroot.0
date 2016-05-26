From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 May 2016 21:52:21 +0200
Subject: [Buildroot] [git commit branch/next] libinput: bump to version 1.3.0
Message-ID: <20160526195257.4AABF81F6B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c7fe54ec2a3247f0e3a8fb8080dde06691c8fc9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libinput/libinput.hash | 4 ++--
 package/libinput/libinput.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 43fcf5d..bd77321 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2016-April/028215.html
-sha256	aee3650ad2a864ab9a10e7e63df543cc2b475f6bf3974751037a2df325dabbb1	libinput-1.2.4.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2016-May/028704.html
+sha256	998a75fb261d161efaa7da44411cdc9a32a953280e4ffc6322ca19f057d0c1ea	libinput-1.3.0.tar.xz
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index d994d29..25ca818 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.2.4
+LIBINPUT_VERSION = 1.3.0
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
