From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Apr 2021 16:46:06 +0200
Subject: [Buildroot] [git commit] package/lualogging: bump to version 1.5.1
Message-ID: <20210404142048.6B4B88B912@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c4fedaaf37d2450a7c21d05dff94d730f140ddc2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff LICENSE:
-Copyright (c) 2004-2020 Kepler Project.
+Copyright (c) 2004-2021 Kepler Project.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lualogging/Config.in       | 2 +-
 package/lualogging/lualogging.hash | 4 ++--
 package/lualogging/lualogging.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lualogging/Config.in b/package/lualogging/Config.in
index 79e352a752..b12b95142e 100644
--- a/package/lualogging/Config.in
+++ b/package/lualogging/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_LUALOGGING
 	  supports, through the use of appenders, console, file, rolling
 	  file, email, socket and SQL outputs.
 
-	  https://github.com/keplerproject/lualogging
+	  https://lunarmodules.github.io/lualogging/
diff --git a/package/lualogging/lualogging.hash b/package/lualogging/lualogging.hash
index 6cd82ab2ec..45f1868856 100644
--- a/package/lualogging/lualogging.hash
+++ b/package/lualogging/lualogging.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 54501b7b84c28fa0c0d310ebfceb6e30be3396bd8aa9caaef7ddfbb0ac0976bc  lualogging-1.4.0-1.src.rock
-sha256 895d1a80efc5fc60236b70c4bf60bdec409c56c75b4ebe4c2da9cb20a1a11908  lualogging/COPYRIGHT
+sha256 70451dbec500dbc760f0eae666a10b19a0ba9bcbfa5dd8d3134908e5ae6d28b1  lualogging-1.5.1-1.src.rock
+sha256 4d95b123e667a13615f567a829aa39211dd55b0b48c9f247bf3fcc5c0b485da7  lualogging/COPYRIGHT
diff --git a/package/lualogging/lualogging.mk b/package/lualogging/lualogging.mk
index 26df9e3314..9c94e588a9 100644
--- a/package/lualogging/lualogging.mk
+++ b/package/lualogging/lualogging.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUALOGGING_VERSION = 1.4.0-1
+LUALOGGING_VERSION = 1.5.1-1
 LUALOGGING_SUBDIR = lualogging
 LUALOGGING_LICENSE = MIT
 LUALOGGING_LICENSE_FILES = $(LUALOGGING_SUBDIR)/COPYRIGHT
