From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 23 Feb 2017 18:00:46 +0100
Subject: [Buildroot] [PATCH 24/25] luabitop: use PKG_NAME_UPSTREAM
In-Reply-To: <20170223170047.24417-1-arnout@mind.be>
References: <20170223170047.24417-1-arnout@mind.be>
Message-ID: <20170223170047.24417-25-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/luabitop/luabitop.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/luabitop/luabitop.mk b/package/luabitop/luabitop.mk
index 5ced99b327..a36a2feaf1 100644
--- a/package/luabitop/luabitop.mk
+++ b/package/luabitop/luabitop.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LUABITOP_VERSION_UPSTREAM = 1.0.2
-LUABITOP_VERSION = $(LUABITOP_VERSION_UPSTREAM)-1
-LUABITOP_SUBDIR = LuaBitOp-$(LUABITOP_VERSION_UPSTREAM)
+LUABITOP_VERSION = 1.0.2-1
+LUABITOP_NAME_UPSTREAM = LuaBitOp
 LUABITOP_LICENSE = MIT
 LUABITOP_LICENSE_FILES = $(LUABITOP_SUBDIR)/README
 
-- 
2.11.0
