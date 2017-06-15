From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Jun 2017 11:41:27 +0200
Subject: [Buildroot] [git commit] Makefile: document noconfig_targets
	variable
Message-ID: <20170615100005.45EC57FD6B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=106dc75521067267977172a518bafeded9563b00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 5f348b2..089989c 100644
--- a/Makefile
+++ b/Makefile
@@ -125,6 +125,7 @@ DATE := $(shell date +%Y%m%d)
 # Need to export it, so it can be got from environment in children (eg. mconf)
 export BR2_VERSION_FULL := $(BR2_VERSION)$(shell $(TOPDIR)/support/scripts/setlocalversion)
 
+# List of targets and target patterns for which .config doesn't need to be read in
 noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconfig \
 	defconfig %_defconfig allyesconfig allnoconfig silentoldconfig release \
 	randpackageconfig allyespackageconfig allnopackageconfig \
