From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 16 Dec 2018 09:56:54 +0100
Subject: [Buildroot] [PATCH 10/12] luaexpat: bump to version 1.3.3
In-Reply-To: <20181216085656.30105-1-francois.perrad@gadz.org>
References: <20181216085656.30105-1-francois.perrad@gadz.org>
Message-ID: <20181216085656.30105-10-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luaexpat/luaexpat.hash | 2 +-
 package/luaexpat/luaexpat.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luaexpat/luaexpat.hash b/package/luaexpat/luaexpat.hash
index 27f6ed034..a810e58b5 100644
--- a/package/luaexpat/luaexpat.hash
+++ b/package/luaexpat/luaexpat.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	aa7883a0d44f500e32ef306c04632546f97f33159fffa7bcdc3f451170f95896  luaexpat-1.3.0-1.src.rock
+sha256 b55908fcd7df490a59aab25284460add8283f1c6b94ab584900fe3e49775172a  luaexpat-1.3.3-1.src.rock
diff --git a/package/luaexpat/luaexpat.mk b/package/luaexpat/luaexpat.mk
index c7377f6af..2b715bc0a 100644
--- a/package/luaexpat/luaexpat.mk
+++ b/package/luaexpat/luaexpat.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LUAEXPAT_VERSION = 1.3.0-1
+LUAEXPAT_VERSION = 1.3.3-1
 LUAEXPAT_DEPENDENCIES = expat
 LUAEXPAT_LICENSE = MIT
-LUAEXPAT_LICENSE_FILES = $(LUAEXPAT_SUBDIR)/doc/us/license.html
+LUAEXPAT_LICENSE_FILES = $(LUAEXPAT_SUBDIR)/LICENSE
 
 $(eval $(luarocks-package))
-- 
2.17.1
