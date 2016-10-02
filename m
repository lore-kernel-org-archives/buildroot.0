From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  2 Oct 2016 18:08:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/libglew: bump to version 2.0.0
Message-ID: <20161002160810.14651-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libglew/libglew.hash | 5 ++++-
 package/libglew/libglew.mk   | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/libglew/libglew.hash b/package/libglew/libglew.hash
index 5e12785..44684ff 100644
--- a/package/libglew/libglew.hash
+++ b/package/libglew/libglew.hash
@@ -1,2 +1,5 @@
+# From https://sourceforge.net/projects/glew/files/glew/2.0.0/
+sha1 6e15c84f7e1fad34cd3679f784a233744ddf048f  glew-2.0.0.tgz
+md5 2a2cd7c98f13854d2fcddae0d2b20411  glew-2.0.0.tgz
 # Locally computed:
-sha256	aa25dc48ed84b0b64b8d41cdd42c8f40f149c37fa2ffa39cd97f42c78d128bc7	glew-1.13.0.tgz
+sha256 c572c30a4e64689c342ba1624130ac98936d7af90c3103f9ce12b8a0c5736764  glew-2.0.0.tgz
diff --git a/package/libglew/libglew.mk b/package/libglew/libglew.mk
index dc73f39..7af3aff 100644
--- a/package/libglew/libglew.mk
+++ b/package/libglew/libglew.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGLEW_VERSION = 1.13.0
+LIBGLEW_VERSION = 2.0.0
 LIBGLEW_SOURCE = glew-$(LIBGLEW_VERSION).tgz
 LIBGLEW_SITE = http://sourceforge.net/projects/glew/files/glew/$(LIBGLEW_VERSION)
 LIBGLEW_LICENSE = BSD-3c, MIT
-- 
2.9.3
