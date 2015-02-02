From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  2 Feb 2015 20:52:42 +0100
Subject: [Buildroot] [PATCH 2/3] lua-testmore: bump to version 0.3.2
In-Reply-To: <1422906763-13919-1-git-send-email-francois.perrad@gadz.org>
References: <1422906763-13919-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1422906763-13919-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-testmore/lua-testmore.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lua-testmore/lua-testmore.mk b/package/lua-testmore/lua-testmore.mk
index c8c8d1f..771b97f 100644
--- a/package/lua-testmore/lua-testmore.mk
+++ b/package/lua-testmore/lua-testmore.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_TESTMORE_VERSION_UPSTREAM = 0.3.1
+LUA_TESTMORE_VERSION_UPSTREAM = 0.3.2
 LUA_TESTMORE_VERSION = $(LUA_TESTMORE_VERSION_UPSTREAM)-1
 LUA_TESTMORE_SUBDIR = lua-TestMore-$(LUA_TESTMORE_VERSION_UPSTREAM)
 LUA_TESTMORE_LICENSE = MIT
-- 
2.1.0
