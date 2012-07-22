From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jul 2012 11:32:35 +0200
Subject: [Buildroot] [git commit] lua: fix typo
Message-ID: <20120722093256.4C6E496C77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3afc90c7d7667d698fb7b470ea77d6a7010d7696
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit c8da6d1dd656caf5454c50ee5dddb4beead60326 introduced a stupid
typo. Fix it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lua/lua.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index fa1e7b1..26c1576 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -85,7 +85,7 @@ define LUA_INSTALL_LIBRARY
 endef
 else
 define LUA_INSTALL_LIBRARY
-	$(INSTALL) -m 0644 -D$(@D)/src/liblua.a $(TARGET_DIR)/usr/lib/liblua.a
+	$(INSTALL) -m 0644 -D $(@D)/src/liblua.a $(TARGET_DIR)/usr/lib/liblua.a
 endef
 endif
 
