From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 28 Nov 2020 08:45:55 +0100
Subject: [Buildroot] [PATCH] package/lua-lyaml: bump to version 6.2.7
Message-ID: <20201128074555.1827248-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-lyaml/lua-lyaml.hash | 4 ++--
 package/lua-lyaml/lua-lyaml.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-lyaml/lua-lyaml.hash b/package/lua-lyaml/lua-lyaml.hash
index 07184e9e4..af3d0ae6d 100644
--- a/package/lua-lyaml/lua-lyaml.hash
+++ b/package/lua-lyaml/lua-lyaml.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256 2c52104e75331e4729e5895168fb8f24769db0b84c68696159e6b6a8908b62d2  lua-lyaml-6.2.6.tar.gz
-sha256 81e4ea1d897e259b31111adc2d3c185fe23e435942ff3e9de8c8c9c5d01247d0  LICENSE
+sha256  9bb489cefae48b150d66f6bab4141d8d5831fcb7465bfc52a9845fa01efc63b0  lua-lyaml-6.2.7.tar.gz
+sha256  81e4ea1d897e259b31111adc2d3c185fe23e435942ff3e9de8c8c9c5d01247d0  LICENSE
diff --git a/package/lua-lyaml/lua-lyaml.mk b/package/lua-lyaml/lua-lyaml.mk
index a818ce716..77980f531 100644
--- a/package/lua-lyaml/lua-lyaml.mk
+++ b/package/lua-lyaml/lua-lyaml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_LYAML_VERSION = 6.2.6
+LUA_LYAML_VERSION = 6.2.7
 LUA_LYAML_NAME_UPSTREAM = lyaml
 LUA_LYAML_SITE = $(call github,gvvaughan,$(LUA_LYAML_NAME_UPSTREAM),v$(LUA_LYAML_VERSION))
 LUA_LYAML_LICENSE = MIT
-- 
2.25.1
