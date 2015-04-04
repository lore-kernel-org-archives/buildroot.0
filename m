From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 15:12:53 +0200
Subject: [Buildroot] [git commit] Makefile: declare 'help' target as phony.
Message-ID: <20150404132028.611A08179A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=df79e35aa80327f95d6c57d1ef54b0d6604a84c6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 1f2bef0..397effe 100644
--- a/Makefile
+++ b/Makefile
@@ -434,7 +434,7 @@ prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 world: target-post-image
 
 .PHONY: all world toolchain dirs clean distclean source outputmakefile \
-	legal-info legal-info-prepare legal-info-clean printvars \
+	legal-info legal-info-prepare legal-info-clean printvars help \
 	target-finalize target-post-image \
 	$(TARGETS) $(TARGETS_ROOTFS) \
 	$(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO) \
