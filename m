From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Tue, 12 Nov 2013 14:26:20 +0100
Subject: [Buildroot] [PATCH 7/7] Revert "arc: Add option for ARC-specific
	download site"
In-Reply-To: <1384262780-12743-1-git-send-email-mjonker@synopsys.com>
References: <1384262780-12743-1-git-send-email-mjonker@synopsys.com>
Message-ID: <1384262780-12743-8-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All packages use github now.

This reverts commit 1445b7fd2e46db5d39ad5e2f5cc262574399f5f3.

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 arch/Config.in.arc |    4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index 9f68b46..60b59f0 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -12,7 +12,3 @@ config BR2_ENDIAN
 
 config BR2_GCC_TARGET_CPU
 	default "arc700"
-
-config BR2_ARC_SITE
-	string
-	default "http://www.synopsys.com/apps/arc-developer/"
-- 
1.7.9.5
