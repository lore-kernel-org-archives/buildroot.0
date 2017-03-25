From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Mar 2017 14:53:46 +0100
Subject: [Buildroot] [git commit] libinput: bump version to 1.7.0
Message-ID: <20170325135354.818268226E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df8138670084c2bb6a4b3e3a2ad30c8367ec7440
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libinput/libinput.hash | 4 ++--
 package/libinput/libinput.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 64caf33..3663b51 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2017-March/033377.html
-sha256 74da2798728e79c3aedfffa268d8fe811c3766ca3708309c0dc45502be137da1  libinput-1.6.3.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2017-March/033531.html
+sha256 12a670f63d01e9e9c98ad0b31aef22160aac52187b4ee8f068a6902181c1a8a8  libinput-1.7.0.tar.xz
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 2761336..801a813 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.6.3
+LIBINPUT_VERSION = 1.7.0
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
