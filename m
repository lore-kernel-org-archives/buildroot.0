From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 24 Dec 2014 10:10:37 +0100
Subject: [Buildroot] [PATCH 4/7] lua-csnappy: bump to version 0.1.2
In-Reply-To: <1419412240-16068-1-git-send-email-francois.perrad@gadz.org>
References: <1419412240-16068-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1419412240-16068-4-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-csnappy/lua-csnappy.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lua-csnappy/lua-csnappy.mk b/package/lua-csnappy/lua-csnappy.mk
index b956c38..b739abc 100644
--- a/package/lua-csnappy/lua-csnappy.mk
+++ b/package/lua-csnappy/lua-csnappy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_CSNAPPY_VERSION_UPSTREAM = 0.1.1
+LUA_CSNAPPY_VERSION_UPSTREAM = 0.1.2
 LUA_CSNAPPY_VERSION = $(LUA_CSNAPPY_VERSION_UPSTREAM)-1
 LUA_CSNAPPY_SUBDIR = lua-csnappy-$(LUA_CSNAPPY_VERSION_UPSTREAM)
 LUA_CSNAPPY_LICENSE = BSD-3c
-- 
2.1.0
