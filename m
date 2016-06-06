From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jun 2016 23:19:26 +0200
Subject: [Buildroot] [git commit] fs/cloop: split long line
Message-ID: <20160606211934.A0A3581E92@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d515406c26e9de3580af5d89b92873a5ffdf24d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

.. and add the missing newline-at-end-of-file.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/cloop/cloop.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/cloop/cloop.mk b/fs/cloop/cloop.mk
index f783ade..9e42a3a 100644
--- a/fs/cloop/cloop.mk
+++ b/fs/cloop/cloop.mk
@@ -7,7 +7,8 @@
 ROOTFS_CLOOP_DEPENDENCIES = host-cloop host-cdrkit
 
 define ROOTFS_CLOOP_CMD
-	$(HOST_DIR)/usr/bin/genisoimage -r $(TARGET_DIR) | $(HOST_DIR)/usr/bin/create_compressed_fs - 65536 > $@
+	$(HOST_DIR)/usr/bin/genisoimage -r $(TARGET_DIR) | \
+		$(HOST_DIR)/usr/bin/create_compressed_fs - 65536 > $@
 endef
 
-$(eval $(call ROOTFS_TARGET,cloop))
\ No newline at end of file
+$(eval $(call ROOTFS_TARGET,cloop))
