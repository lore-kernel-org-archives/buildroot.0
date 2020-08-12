From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 12 Aug 2020 16:54:36 +0200
Subject: [Buildroot] [PATCH] package/lualogging: bump to version 1.4.0
Message-ID: <20200812145436.60984-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

diff COPYRIGHT:
- Copyright (c) 2004-2013 Kepler Project.
+ Copyright (c) 2004-2020 Kepler Project.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lualogging/Config.in       | 2 +-
 package/lualogging/lualogging.hash | 4 ++--
 package/lualogging/lualogging.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lualogging/Config.in b/package/lualogging/Config.in
index a1ed775fb..79e352a75 100644
--- a/package/lualogging/Config.in
+++ b/package/lualogging/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_LUALOGGING
 	  supports, through the use of appenders, console, file, rolling
 	  file, email, socket and SQL outputs.
 
-	  https://github.com/Neopallium/lualogging
+	  https://github.com/keplerproject/lualogging
diff --git a/package/lualogging/lualogging.hash b/package/lualogging/lualogging.hash
index e2ba5df3a..6cd82ab2e 100644
--- a/package/lualogging/lualogging.hash
+++ b/package/lualogging/lualogging.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 6ca3827c4903814626b96011e17ad99b42ecfa983b605aa75bf58f17e90ed58d  lualogging-1.3.0-1.src.rock
-sha256 4e86086c032a006ce1289565cc9d9afff26b5117891cd26ffa15aa866bd28ee5  lualogging/COPYRIGHT
+sha256 54501b7b84c28fa0c0d310ebfceb6e30be3396bd8aa9caaef7ddfbb0ac0976bc  lualogging-1.4.0-1.src.rock
+sha256 895d1a80efc5fc60236b70c4bf60bdec409c56c75b4ebe4c2da9cb20a1a11908  lualogging/COPYRIGHT
diff --git a/package/lualogging/lualogging.mk b/package/lualogging/lualogging.mk
index 3444a2988..26df9e331 100644
--- a/package/lualogging/lualogging.mk
+++ b/package/lualogging/lualogging.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUALOGGING_VERSION = 1.3.0-1
+LUALOGGING_VERSION = 1.4.0-1
 LUALOGGING_SUBDIR = lualogging
 LUALOGGING_LICENSE = MIT
 LUALOGGING_LICENSE_FILES = $(LUALOGGING_SUBDIR)/COPYRIGHT
-- 
2.25.1
