From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Jan 2017 20:43:15 +0100
Subject: [Buildroot] [git commit] libinput: bump version to 1.6.0
Message-ID: <20170123194745.82C348183D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c933ff93ed0a56ee90caa2704302aa64bd19b606
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libinput/libinput.hash | 4 ++--
 package/libinput/libinput.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 73f5c01..dd3573f 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2017-January/032610.html
-sha256	6f9ad1ede468bd54ec4469b8a4eb93a6f62f7fe6480c7a43e36c5d58cc2822b7	libinput-1.5.4.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2017-January/032746.html
+sha256 b7534f518d735c643aedca2fb4694683dfddc8d0600cfb628c87a18e65255832  libinput-1.6.0.tar.xz
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index f4ae0fc..52aca9a 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.5.4
+LIBINPUT_VERSION = 1.6.0
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
