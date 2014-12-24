From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 24 Dec 2014 10:10:38 +0100
Subject: [Buildroot] [PATCH 5/7] lua-coat: bump to version 0.9.1
In-Reply-To: <1419412240-16068-1-git-send-email-francois.perrad@gadz.org>
References: <1419412240-16068-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1419412240-16068-5-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-coat/lua-coat.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lua-coat/lua-coat.mk b/package/lua-coat/lua-coat.mk
index e5a09b0..205995e 100644
--- a/package/lua-coat/lua-coat.mk
+++ b/package/lua-coat/lua-coat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_COAT_VERSION_UPSTREAM = 0.9.0
+LUA_COAT_VERSION_UPSTREAM = 0.9.1
 LUA_COAT_VERSION = $(LUA_COAT_VERSION_UPSTREAM)-1
 LUA_COAT_SUBDIR = lua-Coat-$(LUA_COAT_VERSION_UPSTREAM)
 LUA_COAT_LICENSE = MIT
-- 
2.1.0
