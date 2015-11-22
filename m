From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Nov 2015 22:57:03 +0100
Subject: [Buildroot] [git commit] package/libglew: bump version to 1.13.0
Message-ID: <20151201232120.64CCD802AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b49bd873e8cf27e3e4159d3851fac0c04b5fe150
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libglew/libglew.hash | 2 +-
 package/libglew/libglew.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libglew/libglew.hash b/package/libglew/libglew.hash
index 68c3e7a..5e12785 100644
--- a/package/libglew/libglew.hash
+++ b/package/libglew/libglew.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	af58103f4824b443e7fa4ed3af593b8edac6f3a7be3b30911edbc7344f48e4bf	glew-1.12.0.tgz
+sha256	aa25dc48ed84b0b64b8d41cdd42c8f40f149c37fa2ffa39cd97f42c78d128bc7	glew-1.13.0.tgz
diff --git a/package/libglew/libglew.mk b/package/libglew/libglew.mk
index 4d26ed8..dc73f39 100644
--- a/package/libglew/libglew.mk
+++ b/package/libglew/libglew.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGLEW_VERSION = 1.12.0
+LIBGLEW_VERSION = 1.13.0
 LIBGLEW_SOURCE = glew-$(LIBGLEW_VERSION).tgz
 LIBGLEW_SITE = http://sourceforge.net/projects/glew/files/glew/$(LIBGLEW_VERSION)
 LIBGLEW_LICENSE = BSD-3c, MIT
