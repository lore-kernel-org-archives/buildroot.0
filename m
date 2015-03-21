From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Mar 2015 20:49:45 +0100
Subject: [Buildroot] [PATCH 1/4] Makefile: declare 'help' target as phony.
In-Reply-To: <1426967388-559-1-git-send-email-arnout@mind.be>
References: <1426967388-559-1-git-send-email-arnout@mind.be>
Message-ID: <1426967388-559-2-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 33a89b1..de2abfe 100644
--- a/Makefile
+++ b/Makefile
@@ -433,7 +433,7 @@ prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 world: target-post-image
 
 .PHONY: all world toolchain dirs clean distclean source outputmakefile \
-	legal-info legal-info-prepare legal-info-clean printvars \
+	legal-info legal-info-prepare legal-info-clean printvars help \
 	target-finalize target-post-image \
 	$(TARGETS) $(TARGETS_ROOTFS) \
 	$(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO) \
-- 
2.1.4
