From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 6 Jul 2010 17:27:03 +0200
Subject: [Buildroot] [git commit master 1/1] libsvgtiny: fix clean command
	name
Message-ID: <20100706152828.4AEF5825AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3b709a3d86407556f09642ef5ee4b37de2f4e93c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Thanks to Thomas for noticing.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libsvgtiny/libsvgtiny.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libsvgtiny/libsvgtiny.mk b/package/libsvgtiny/libsvgtiny.mk
index 7484764..5e53346 100644
--- a/package/libsvgtiny/libsvgtiny.mk
+++ b/package/libsvgtiny/libsvgtiny.mk
@@ -45,7 +45,7 @@ define LIBSVGTINY_UNINSTALL_TARGET_CMDS
 		$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(TARGET_DIR) uninstall
 endef
 
-define BZIP2_CLEAN_CMDS
+define LIBSVGTINY_CLEAN_CMDS
 	$(TARGET_CONFIGURE_ENV) $(TARGET_CONFIGURE_OPTS) \
 		$(MAKE) -C $(@D) clean
 endef
-- 
1.7.1
