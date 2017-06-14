From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 15 Jun 2017 00:11:29 +0200
Subject: [Buildroot] [PATCH 2/8] Makefile: document noconfig_targets variable
In-Reply-To: <20170614221135.17470-1-arnout@mind.be>
References: <20170614221135.17470-1-arnout@mind.be>
Message-ID: <20170614221135.17470-3-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 5f348b2513..089989c624 100644
--- a/Makefile
+++ b/Makefile
@@ -125,6 +125,7 @@ DATE := $(shell date +%Y%m%d)
 # Need to export it, so it can be got from environment in children (eg. mconf)
 export BR2_VERSION_FULL := $(BR2_VERSION)$(shell $(TOPDIR)/support/scripts/setlocalversion)
 
+# List of targets and target patterns for which .config doesn't need to be read in
 noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconfig \
 	defconfig %_defconfig allyesconfig allnoconfig silentoldconfig release \
 	randpackageconfig allyespackageconfig allnopackageconfig \
-- 
2.11.0
