From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Thu, 19 Jun 2014 13:44:48 -0400
Subject: [Buildroot] [PATCH] Makefile: document make <package>-dirclean
Message-ID: <1403199888-24237-1-git-send-email-vivien.didelot@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index a2681f6..81da5ae 100644
--- a/Makefile
+++ b/Makefile
@@ -849,6 +849,7 @@ help:
 	@echo '  toolchain              - build toolchain'
 	@echo '  <package>-rebuild      - force recompile <package>'
 	@echo '  <package>-reconfigure  - force reconfigure <package>'
+	@echo '  <package>-dirclean     - remove the whole <package> build directory'
 	@echo '  <package>-graph-depends    - generate graph of the dependency tree for package'
 	@echo
 	@echo 'Configuration:'
-- 
2.0.0
