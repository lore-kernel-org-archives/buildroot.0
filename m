From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 18 Jul 2009 00:04:45 +0200
Subject: [Buildroot] [git commit] expat: fix typo
Message-ID: <20090717221845.9DE5B7771E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=adfd17b0bcc43124e13d869e8ffd186e30232b03
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/expat/expat.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 88a7f16..6706716 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -55,7 +55,7 @@ $(STAMP_DIR)/host_expat_installed: $(STAMP_DIR)/host_expat_compiled
 	$(MAKE) -C $(EXPAT_HOST_DIR) installlib
 	touch $@
 
-host-expat: $(STAM_DIR)/host_expat_installed
+host-expat: $(STAMP_DIR)/host_expat_installed
 
 host-expat-source: expat-source
 
-- 
1.6.3.3
