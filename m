From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sun, 15 Feb 2015 15:44:09 +0000
Subject: [Buildroot] [PATCH 1/3] libinput: bump version to 0.10.0
Message-ID: <1424015051-14779-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Bump version to 0.10.0
- Update the hash file

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/libinput/libinput.hash |    4 ++--
 package/libinput/libinput.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index fa246d4..f2791e0 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/wayland-devel/2014-December/018750.html
-sha256 129f485afe5e4a9394641293991c97cb99f5f3338340d0d65b704ff463d1579e  libinput-0.7.0.tar.xz
+# From http://lists.freedesktop.org/archives/wayland-devel/2015-February/019827.html
+sha256  4ce001f80ff1a6bf547784d02125648bf8abe60db7d3d5e0020294d5215c1441  libinput-0.10.0.tar.xz
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index bf4537b..5a793b0 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 0.7.0
+LIBINPUT_VERSION = 0.10.0
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_LICENSE = MIT
-- 
1.7.1
