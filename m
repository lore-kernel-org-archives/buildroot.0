From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  9 Aug 2019 14:17:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/lua-cqueues: bump to version
 20190731
Message-ID: <20190809121727.31629-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Add hash for license file
- Fix build failure with gcc 9

Fixes:
 - http://autobuild.buildroot.org/results/f44ceb1fced5102cd7b15e8a054a8937a8cbca95

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lua-cqueues/lua-cqueues.hash | 3 ++-
 package/lua-cqueues/lua-cqueues.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/lua-cqueues/lua-cqueues.hash b/package/lua-cqueues/lua-cqueues.hash
index 7824c08f9b..354577263a 100644
--- a/package/lua-cqueues/lua-cqueues.hash
+++ b/package/lua-cqueues/lua-cqueues.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 ae51b713bdf966215b87244e03ac60b5a12beb82d15dfb02755a000cfb2df905  lua-cqueues-20161215.tar.gz
+sha256 a4b6e8f35ffa130a94bf4f454cbc2a001ffb765e09307bebbfc7a892345fdcf0  lua-cqueues-20190731.tar.gz
+sha256 5f4b1f94047790eadf8fd0f9a8e3bd2895bea4c9a2c0f8bf7cd8c8e57caa5219  LICENSE
diff --git a/package/lua-cqueues/lua-cqueues.mk b/package/lua-cqueues/lua-cqueues.mk
index 8f94386fb3..94bdb1477a 100644
--- a/package/lua-cqueues/lua-cqueues.mk
+++ b/package/lua-cqueues/lua-cqueues.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_CQUEUES_VERSION = 20161215
+LUA_CQUEUES_VERSION = 20190731
 LUA_CQUEUES_SITE = $(call github,wahern,cqueues,rel-$(LUA_CQUEUES_VERSION))
 LUA_CQUEUES_LICENSE = MIT
 LUA_CQUEUES_LICENSE_FILES = LICENSE
-- 
2.20.1
