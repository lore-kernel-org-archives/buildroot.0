From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Jun 2020 23:23:31 +0200
Subject: [Buildroot] [git commit] package/lua-cqueues: bump to version
 20200603
Message-ID: <20200610212227.DDCA68230F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8095a7e5d9cc243f24506581fd5e5c2111b973c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-cqueues/lua-cqueues.hash | 4 ++--
 package/lua-cqueues/lua-cqueues.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-cqueues/lua-cqueues.hash b/package/lua-cqueues/lua-cqueues.hash
index 69d8ec1c10..e12cdc642c 100644
--- a/package/lua-cqueues/lua-cqueues.hash
+++ b/package/lua-cqueues/lua-cqueues.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 24f1aa69b539e6796445c2228f921744ad64f9336498c7537bee97719d914804  lua-cqueues-20190813.tar.gz
-sha256 5f4b1f94047790eadf8fd0f9a8e3bd2895bea4c9a2c0f8bf7cd8c8e57caa5219  LICENSE
+sha256  45b4a0105c096eee5840b69e8e0078eb7b5d61a23aeca30db710f1caac3ec399  lua-cqueues-20200603.tar.gz
+sha256  5f4b1f94047790eadf8fd0f9a8e3bd2895bea4c9a2c0f8bf7cd8c8e57caa5219  LICENSE
diff --git a/package/lua-cqueues/lua-cqueues.mk b/package/lua-cqueues/lua-cqueues.mk
index fc2c85c11f..bfa1df7447 100644
--- a/package/lua-cqueues/lua-cqueues.mk
+++ b/package/lua-cqueues/lua-cqueues.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_CQUEUES_VERSION = 20190813
+LUA_CQUEUES_VERSION = 20200603
 LUA_CQUEUES_SITE = $(call github,wahern,cqueues,rel-$(LUA_CQUEUES_VERSION))
 LUA_CQUEUES_LICENSE = MIT
 LUA_CQUEUES_LICENSE_FILES = LICENSE
