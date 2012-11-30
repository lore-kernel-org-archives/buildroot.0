From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 29 Nov 2012 23:25:09 -0800
Subject: [Buildroot] [git commit] cramfs.mk: drop invalid -q option
Message-ID: <20121130072907.27436994D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f27ec358ef9b6ecfc0204a3e9e899a778c55bfe8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/cramfs/cramfs.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/cramfs/cramfs.mk b/fs/cramfs/cramfs.mk
index 9b0141f..55f6bdb 100644
--- a/fs/cramfs/cramfs.mk
+++ b/fs/cramfs/cramfs.mk
@@ -10,7 +10,7 @@ CRAMFS_OPTS=-l
 endif
 
 define ROOTFS_CRAMFS_CMD
- $(HOST_DIR)/usr/bin/mkcramfs -q $(CRAMFS_OPTS) $(TARGET_DIR) $$@
+ $(HOST_DIR)/usr/bin/mkcramfs $(CRAMFS_OPTS) $(TARGET_DIR) $$@
 endef
 
 ROOTFS_CRAMFS_DEPENDENCIES = host-cramfs
