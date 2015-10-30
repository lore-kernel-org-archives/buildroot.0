From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 30 Oct 2015 14:33:36 +0000
Subject: [Buildroot] [PATCH] pulseaudio: bump to version 7.1
Message-ID: <1446215616-58750-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/pulseaudio/pulseaudio.hash |    6 +++---
 package/pulseaudio/pulseaudio.mk   |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pulseaudio/pulseaudio.hash b/package/pulseaudio/pulseaudio.hash
index 0e560d0..7e9dcac 100644
--- a/package/pulseaudio/pulseaudio.hash
+++ b/package/pulseaudio/pulseaudio.hash
@@ -1,3 +1,3 @@
-# From http://freedesktop.org/software/pulseaudio/releases/pulseaudio-7.0.tar.xz.{md5,sha1}
-md5 09668b660ffb32f2639cfd6fdc9d3b37  pulseaudio-7.0.tar.xz
-sha1 b4a3d331bdd94eb97a299f7328950dec31cf2b6a  pulseaudio-7.0.tar.xz
+# From http://freedesktop.org/software/pulseaudio/releases/pulseaudio-7.1.tar.xz.{md5,sha1}
+md5 9d0a9817b632cac8e3f3834d7eb1c99d pulseaudio-7.1.tar.xz
+sha1 dc35a8aa66c513ac989319e13a18e317d8e432b3 pulseaudio-7.1.tar.xz
diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 5bc6ec7..a59a6c5 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PULSEAUDIO_VERSION = 7.0
+PULSEAUDIO_VERSION = 7.1
 PULSEAUDIO_SOURCE = pulseaudio-$(PULSEAUDIO_VERSION).tar.xz
 PULSEAUDIO_SITE = http://freedesktop.org/software/pulseaudio/releases
 PULSEAUDIO_INSTALL_STAGING = YES
-- 
1.7.1
