From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 23 Feb 2017 18:00:45 +0100
Subject: [Buildroot] [PATCH 23/25] lua-testmore: use PKG_NAME_UPSTREAM
In-Reply-To: <20170223170047.24417-1-arnout@mind.be>
References: <20170223170047.24417-1-arnout@mind.be>
Message-ID: <20170223170047.24417-24-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/lua-testmore/lua-testmore.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/lua-testmore/lua-testmore.mk b/package/lua-testmore/lua-testmore.mk
index 771b97f000..04482e2586 100644
--- a/package/lua-testmore/lua-testmore.mk
+++ b/package/lua-testmore/lua-testmore.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LUA_TESTMORE_VERSION_UPSTREAM = 0.3.2
-LUA_TESTMORE_VERSION = $(LUA_TESTMORE_VERSION_UPSTREAM)-1
-LUA_TESTMORE_SUBDIR = lua-TestMore-$(LUA_TESTMORE_VERSION_UPSTREAM)
+LUA_TESTMORE_VERSION = 0.3.2-1
+LUA_TESTMORE_NAME_UPSTREAM = lua-TestMore
 LUA_TESTMORE_LICENSE = MIT
 LUA_TESTMORE_LICENSE_FILES = $(LUA_TESTMORE_SUBDIR)/COPYRIGHT
 
-- 
2.11.0
