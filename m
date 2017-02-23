From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 23 Feb 2017 18:00:43 +0100
Subject: [Buildroot] [PATCH 21/25] lua-coat: use PKG_NAME_UPSTREAM
In-Reply-To: <20170223170047.24417-1-arnout@mind.be>
References: <20170223170047.24417-1-arnout@mind.be>
Message-ID: <20170223170047.24417-22-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/lua-coat/lua-coat.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/lua-coat/lua-coat.mk b/package/lua-coat/lua-coat.mk
index 205995ed63..80ca6b1278 100644
--- a/package/lua-coat/lua-coat.mk
+++ b/package/lua-coat/lua-coat.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LUA_COAT_VERSION_UPSTREAM = 0.9.1
-LUA_COAT_VERSION = $(LUA_COAT_VERSION_UPSTREAM)-1
-LUA_COAT_SUBDIR = lua-Coat-$(LUA_COAT_VERSION_UPSTREAM)
+LUA_COAT_VERSION = 0.9.1-1
+LUA_COAT_NAME_UPSTREAM = lua-Coat
 LUA_COAT_LICENSE = MIT
 LUA_COAT_LICENSE_FILES = $(LUA_COAT_SUBDIR)/COPYRIGHT
 
-- 
2.11.0
