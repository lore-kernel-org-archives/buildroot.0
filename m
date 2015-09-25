From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 25 Sep 2015 12:40:33 +0100
Subject: [Buildroot] [PATCH] pulseaudio: bump to version 7.0
Message-ID: <1443181233-18749-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Bump to version 7.0
- Update the hash file
- Remove non-existing --disable-legacy-runtime-dir configure option

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/pulseaudio/pulseaudio.hash |    6 +++---
 package/pulseaudio/pulseaudio.mk   |    3 +--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/pulseaudio/pulseaudio.hash b/package/pulseaudio/pulseaudio.hash
index dad495e..0e560d0 100644
--- a/package/pulseaudio/pulseaudio.hash
+++ b/package/pulseaudio/pulseaudio.hash
@@ -1,3 +1,3 @@
-# From http://freedesktop.org/software/pulseaudio/releases/pulseaudio-5.0.tar.xz.{md5,sha1}
-md5	c43749838612f4860465e83ed62ca38e	pulseaudio-5.0.tar.xz
-sha1	e420931a0b9cf37331cd06e30ba415046317ab85	pulseaudio-5.0.tar.xz
+# From http://freedesktop.org/software/pulseaudio/releases/pulseaudio-7.0.tar.xz.{md5,sha1}
+md5 09668b660ffb32f2639cfd6fdc9d3b37  pulseaudio-7.0.tar.xz
+sha1 b4a3d331bdd94eb97a299f7328950dec31cf2b6a  pulseaudio-7.0.tar.xz
diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 0fcfe38..5bc6ec7 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PULSEAUDIO_VERSION = 5.0
+PULSEAUDIO_VERSION = 7.0
 PULSEAUDIO_SOURCE = pulseaudio-$(PULSEAUDIO_VERSION).tar.xz
 PULSEAUDIO_SITE = http://freedesktop.org/software/pulseaudio/releases
 PULSEAUDIO_INSTALL_STAGING = YES
@@ -12,7 +12,6 @@ PULSEAUDIO_LICENSE = LGPLv2.1+ (specific license for modules, see LICENSE file)
 PULSEAUDIO_LICENSE_FILES = LICENSE GPL LGPL
 PULSEAUDIO_CONF_OPTS = \
 	--disable-default-build-tests \
-	--disable-legacy-runtime-dir \
 	--disable-legacy-database-entry-format \
 	--disable-manpages
 
-- 
1.7.1
