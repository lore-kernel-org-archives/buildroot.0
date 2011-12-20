From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 20 Dec 2011 13:10:17 +0100
Subject: [Buildroot] [git commit] jsmin: fix typo in uninstall target
Message-ID: <20111220121310.BD7798FAD1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=47f20335f548994216e8299eac9dd6295c042773
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Thanks to Thomas for noticing.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/jsmin/jsmin.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/jsmin/jsmin.mk b/package/jsmin/jsmin.mk
index 1c414ff..491bb3e 100644
--- a/package/jsmin/jsmin.mk
+++ b/package/jsmin/jsmin.mk
@@ -9,7 +9,7 @@ define JSMIN_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/jsmin $(TARGET_DIR)/usr/bin/jsmin
 endef
 
-define INPUT_EVENT_DAEMON_UNINSTALL_TARGET_CMDS
+define JSMIN_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/jsmin
 endef
 
