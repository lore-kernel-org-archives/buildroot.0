From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  9 Aug 2015 22:09:45 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/libglew: bump version to 1.12.0
Message-ID: <1439150985-5941-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libglew/libglew.hash | 2 +-
 package/libglew/libglew.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libglew/libglew.hash b/package/libglew/libglew.hash
index 9ac811c..68c3e7a 100644
--- a/package/libglew/libglew.hash
+++ b/package/libglew/libglew.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  99c41320b63f6860869b5fb9af9a1854b15582796c64ee3dfd7096dc0c89f307  glew-1.10.0.tgz
+sha256	af58103f4824b443e7fa4ed3af593b8edac6f3a7be3b30911edbc7344f48e4bf	glew-1.12.0.tgz
diff --git a/package/libglew/libglew.mk b/package/libglew/libglew.mk
index 938ec67..4d26ed8 100644
--- a/package/libglew/libglew.mk
+++ b/package/libglew/libglew.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGLEW_VERSION = 1.10.0
+LIBGLEW_VERSION = 1.12.0
 LIBGLEW_SOURCE = glew-$(LIBGLEW_VERSION).tgz
 LIBGLEW_SITE = http://sourceforge.net/projects/glew/files/glew/$(LIBGLEW_VERSION)
 LIBGLEW_LICENSE = BSD-3c, MIT
-- 
2.1.4
