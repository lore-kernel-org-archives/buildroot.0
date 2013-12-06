From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Dec 2013 22:45:13 +0100
Subject: [Buildroot] [git commit] Revert "arc: Add option for ARC-specific
	download site"
Message-ID: <20131206215056.321F99BF34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=26cc49f6c662b8d94255106bd2acaa0751212c16
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All packages use github now.

This reverts commit 1445b7fd2e46db5d39ad5e2f5cc262574399f5f3.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.arc |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

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
