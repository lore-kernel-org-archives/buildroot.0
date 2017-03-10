From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 10 Mar 2017 17:30:45 +0000
Subject: [Buildroot] [PATCH] libinput: bump version to 1.6.3
Message-ID: <20170310173045.41682-1-Vincent.Riera@imgtec.com>
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
index 78f022a..64caf33 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2017-February/033169.html
-sha256 96fc0e0b24a96042b16e561201979dfa4a3f00a642538195c62f72b79f4084fa  libinput-1.6.2.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2017-March/033377.html
+sha256 74da2798728e79c3aedfffa268d8fe811c3766ca3708309c0dc45502be137da1  libinput-1.6.3.tar.xz
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 6cfe407..2761336 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.6.2
+LIBINPUT_VERSION = 1.6.3
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
-- 
2.10.2
