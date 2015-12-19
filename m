From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Dec 2015 14:11:20 +0100
Subject: [Buildroot] [git commit] package/libinput: bump version to 1.1.2
Message-ID: <20151219131256.4CD8881E38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d2367f8c4e99617a6872a5abc9124e1bf5bee035
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libinput/libinput.hash | 4 ++--
 package/libinput/libinput.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 18bd4a7..56b2c10 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/wayland-devel/2015-October/025065.html
-sha256	673186ea2a0d2b695afaa9758834f9217b175774d9ae222e1b43ff63c663f582	libinput-1.1.0.tar.xz
+# From http://lists.freedesktop.org/archives/wayland-devel/2015-December/026041.html
+sha256	a323a32718a8f0f5e85e1ed3a81f0dde45eb52b215a15c7887bec40961d97a84	libinput-1.1.2.tar.xz
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 8b51b2b..91d6e53 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.1.0
+LIBINPUT_VERSION = 1.1.2
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_LICENSE = MIT
