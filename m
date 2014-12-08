From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 8 Dec 2014 15:36:48 +0000
Subject: [Buildroot] [PATCH] Use CodeSourcery MIPS 2014.11 instead of 2014.05
Message-ID: <1418053008-64558-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 web/toolchains/configs/sourcery-mips.config |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/web/toolchains/configs/sourcery-mips.config b/web/toolchains/configs/sourcery-mips.config
index 39717d3..f0cc960 100644
--- a/web/toolchains/configs/sourcery-mips.config
+++ b/web/toolchains/configs/sourcery-mips.config
@@ -1,3 +1,3 @@
 BR2_mips=y
 BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405=y
+BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201411=y
-- 
1.7.1
