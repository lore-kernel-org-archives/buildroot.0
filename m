From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 22:03:13 +0100
Subject: [Buildroot] [git commit] luabitop: use PKG_NAME_UPSTREAM
Message-ID: <20170305210519.AA94A7FCAC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ffffc0e84a85105bf2a82bec39c88a21710f725d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luabitop/luabitop.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/luabitop/luabitop.mk b/package/luabitop/luabitop.mk
index 5ced99b..a36a2fe 100644
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
 
