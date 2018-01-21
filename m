From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 21 Jan 2018 12:03:28 +0100
Subject: [Buildroot] [PATCH 1/8] lua-coat: bump to version 0.9.2
Message-ID: <20180121110335.20927-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-coat/lua-coat.hash | 2 +-
 package/lua-coat/lua-coat.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua-coat/lua-coat.hash b/package/lua-coat/lua-coat.hash
index ad15a38b9..1f2135566 100644
--- a/package/lua-coat/lua-coat.hash
+++ b/package/lua-coat/lua-coat.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	38a8342f6b3883a81931feaa9ef90a6343445289f3d65a296f0924818587c7d4  lua-coat-0.9.1-1.src.rock
+sha256	24d0e894d743f46c09a282e4dd272d2a6004557608b618c1c9d9f464dd65af02  lua-coat-0.9.2-1.src.rock
diff --git a/package/lua-coat/lua-coat.mk b/package/lua-coat/lua-coat.mk
index 80ca6b127..6555e66cd 100644
--- a/package/lua-coat/lua-coat.mk
+++ b/package/lua-coat/lua-coat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_COAT_VERSION = 0.9.1-1
+LUA_COAT_VERSION = 0.9.2-1
 LUA_COAT_NAME_UPSTREAM = lua-Coat
 LUA_COAT_LICENSE = MIT
 LUA_COAT_LICENSE_FILES = $(LUA_COAT_SUBDIR)/COPYRIGHT
-- 
2.11.0
