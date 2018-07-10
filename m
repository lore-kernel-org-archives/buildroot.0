From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 10 Jul 2018 18:36:37 +0200
Subject: [Buildroot] [PATCH] lua: bump to version 5.3.5
Message-ID: <20180710163637.11405-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua/{5.3.4 => 5.3.5}/0001-root-path.patch           | 0
 package/lua/{5.3.4 => 5.3.5}/0002-shared-libs-for-lua.patch | 0
 package/lua/{5.3.4 => 5.3.5}/0011-linenoise.patch           | 0
 package/lua/lua.hash                                        | 4 ++--
 package/lua/lua.mk                                          | 2 +-
 5 files changed, 3 insertions(+), 3 deletions(-)
 rename package/lua/{5.3.4 => 5.3.5}/0001-root-path.patch (100%)
 rename package/lua/{5.3.4 => 5.3.5}/0002-shared-libs-for-lua.patch (100%)
 rename package/lua/{5.3.4 => 5.3.5}/0011-linenoise.patch (100%)

diff --git a/package/lua/5.3.4/0001-root-path.patch b/package/lua/5.3.5/0001-root-path.patch
similarity index 100%
rename from package/lua/5.3.4/0001-root-path.patch
rename to package/lua/5.3.5/0001-root-path.patch
diff --git a/package/lua/5.3.4/0002-shared-libs-for-lua.patch b/package/lua/5.3.5/0002-shared-libs-for-lua.patch
similarity index 100%
rename from package/lua/5.3.4/0002-shared-libs-for-lua.patch
rename to package/lua/5.3.5/0002-shared-libs-for-lua.patch
diff --git a/package/lua/5.3.4/0011-linenoise.patch b/package/lua/5.3.5/0011-linenoise.patch
similarity index 100%
rename from package/lua/5.3.4/0011-linenoise.patch
rename to package/lua/5.3.5/0011-linenoise.patch
diff --git a/package/lua/lua.hash b/package/lua/lua.hash
index 32e7472c3..43f5be275 100644
--- a/package/lua/lua.hash
+++ b/package/lua/lua.hash
@@ -1,6 +1,6 @@
 # Hashes from: http://www.lua.org/ftp/
-md5 53a9c68bcc0eda58bdc2095ad5cdfc63           lua-5.3.4.tar.gz
-sha1 79790cfd40e09ba796b01a571d4d63b52b1cd950  lua-5.3.4.tar.gz
+md5 4f4b4f323fd3514a68e0ab3da8ce3455           lua-5.3.5.tar.gz
+sha1 112eb10ff04d1b4c9898e121d6bdf54a81482447  lua-5.3.5.tar.gz
 
 md5 913fdb32207046b273fdb17aad70be13           lua-5.2.4.tar.gz
 sha1 ef15259421197e3d85b7d6e4871b8c26fd82c1cf  lua-5.2.4.tar.gz
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 851dc8f73..22643c4c8 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ifeq ($(BR2_PACKAGE_LUA_5_3),y)
-LUA_VERSION = 5.3.4
+LUA_VERSION = 5.3.5
 else
 ifeq ($(BR2_PACKAGE_LUA_5_2),y)
 LUA_VERSION = 5.2.4
-- 
2.17.1
