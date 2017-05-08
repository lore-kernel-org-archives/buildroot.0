From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 8 May 2017 18:13:26 +0100
Subject: [Buildroot] [PATCH] libinput: bump version to 1.7.2
Message-ID: <20170508171326.45897-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/libinput/libinput.hash | 4 ++--
 package/libinput/libinput.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 3663b51..490131c 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2017-March/033531.html
-sha256 12a670f63d01e9e9c98ad0b31aef22160aac52187b4ee8f068a6902181c1a8a8  libinput-1.7.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2017-May/034037.html
+sha256 0b1e5a6c106ccc609ccececd9e33e6b27c8b01fc7457ddb4c1dd266e780d6bc2  libinput-1.7.2.tar.xz
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 801a813..4ecc2d1 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.7.0
+LIBINPUT_VERSION = 1.7.2
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
-- 
2.10.2
