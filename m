From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 23 Sep 2019 11:03:56 +0200
Subject: [Buildroot] [PATCH 1/2] package/lua-cqueues: bump to version
 20190813
Message-ID: <20190923090357.13545-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-cqueues/lua-cqueues.hash | 2 +-
 package/lua-cqueues/lua-cqueues.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua-cqueues/lua-cqueues.hash b/package/lua-cqueues/lua-cqueues.hash
index 354577263..69d8ec1c1 100644
--- a/package/lua-cqueues/lua-cqueues.hash
+++ b/package/lua-cqueues/lua-cqueues.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 a4b6e8f35ffa130a94bf4f454cbc2a001ffb765e09307bebbfc7a892345fdcf0  lua-cqueues-20190731.tar.gz
+sha256 24f1aa69b539e6796445c2228f921744ad64f9336498c7537bee97719d914804  lua-cqueues-20190813.tar.gz
 sha256 5f4b1f94047790eadf8fd0f9a8e3bd2895bea4c9a2c0f8bf7cd8c8e57caa5219  LICENSE
diff --git a/package/lua-cqueues/lua-cqueues.mk b/package/lua-cqueues/lua-cqueues.mk
index 94bdb1477..fc2c85c11 100644
--- a/package/lua-cqueues/lua-cqueues.mk
+++ b/package/lua-cqueues/lua-cqueues.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_CQUEUES_VERSION = 20190731
+LUA_CQUEUES_VERSION = 20190813
 LUA_CQUEUES_SITE = $(call github,wahern,cqueues,rel-$(LUA_CQUEUES_VERSION))
 LUA_CQUEUES_LICENSE = MIT
 LUA_CQUEUES_LICENSE_FILES = LICENSE
-- 
2.20.1
