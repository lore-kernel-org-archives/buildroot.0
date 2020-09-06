From: Francois Perrad <fperrad@gmail.com>
Date: Sun,  6 Sep 2020 20:53:53 +0200
Subject: [Buildroot] [PATCH] package/lua-lyaml: bump to version 6.2.6
Message-ID: <20200906185353.1456706-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-lyaml/lua-lyaml.hash | 2 +-
 package/lua-lyaml/lua-lyaml.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua-lyaml/lua-lyaml.hash b/package/lua-lyaml/lua-lyaml.hash
index 188194425..07184e9e4 100644
--- a/package/lua-lyaml/lua-lyaml.hash
+++ b/package/lua-lyaml/lua-lyaml.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256 16bbc8e3bf1ad3cf29bdefc24cd136959481ec03bd52da94c3c1f6fa5ae299ce  lua-lyaml-6.2.5.tar.gz
+sha256 2c52104e75331e4729e5895168fb8f24769db0b84c68696159e6b6a8908b62d2  lua-lyaml-6.2.6.tar.gz
 sha256 81e4ea1d897e259b31111adc2d3c185fe23e435942ff3e9de8c8c9c5d01247d0  LICENSE
diff --git a/package/lua-lyaml/lua-lyaml.mk b/package/lua-lyaml/lua-lyaml.mk
index b16faeae6..a818ce716 100644
--- a/package/lua-lyaml/lua-lyaml.mk
+++ b/package/lua-lyaml/lua-lyaml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_LYAML_VERSION = 6.2.5
+LUA_LYAML_VERSION = 6.2.6
 LUA_LYAML_NAME_UPSTREAM = lyaml
 LUA_LYAML_SITE = $(call github,gvvaughan,$(LUA_LYAML_NAME_UPSTREAM),v$(LUA_LYAML_VERSION))
 LUA_LYAML_LICENSE = MIT
-- 
2.25.1
