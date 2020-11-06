From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  6 Nov 2020 22:49:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/lzlib: add license file
Message-ID: <20201106214936.307864-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add lzlib.c as the license file and, while at it, update indentation to
two spaces

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lzlib/lzlib.hash | 3 ++-
 package/lzlib/lzlib.mk   | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/lzlib/lzlib.hash b/package/lzlib/lzlib.hash
index f983862e41..4bb4c52c8c 100644
--- a/package/lzlib/lzlib.hash
+++ b/package/lzlib/lzlib.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 cbb0cac5825e940b4ea2f31a336d2aaf6db39847d456920afd8e443804420dbb lzlib-0.4.3.tar.gz
+sha256  cbb0cac5825e940b4ea2f31a336d2aaf6db39847d456920afd8e443804420dbb  lzlib-0.4.3.tar.gz
+sha256  f817d4a37077e94e9adf379f46ba5cc0b68775d7add2bbd5b2ca68ba140ad5bb  lzlib.c
diff --git a/package/lzlib/lzlib.mk b/package/lzlib/lzlib.mk
index f468a1c839..74624d5019 100644
--- a/package/lzlib/lzlib.mk
+++ b/package/lzlib/lzlib.mk
@@ -8,6 +8,7 @@ LZLIB_VERSION = 0.4.3
 LZLIB_SITE = $(call github,LuaDist,lzlib,$(LZLIB_VERSION))
 LZLIB_DEPENDENCIES = lua zlib
 LZLIB_LICENSE = MIT
+LZLIB_LICENSE_FILES = lzlib.c
 LZLIB_CONF_OPTS = -DINSTALL_CMOD="/usr/lib/lua/$(LUAINTERPRETER_ABIVER)" \
 	-DINSTALL_LMOD="/usr/share/lua/$(LUAINTERPRETER_ABIVER)"
 
-- 
2.28.0
