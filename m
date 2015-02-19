From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 22:31:29 +0100
Subject: [Buildroot] [git commit branch/next] libinput: bump version to
	0.10.0
Message-ID: <20150219213237.0E577817B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d89c3abd5f40d61cfb0b4fa9aebea97dd01c68f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Bump version to 0.10.0
- Update the hash file

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
index bf4537b..5a793b0f 100644
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
