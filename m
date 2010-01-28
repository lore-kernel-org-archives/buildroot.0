From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Thu, 28 Jan 2010 16:05:40 +0100
Subject: [Buildroot] [git commit master] flex: add flex-host package
	(required by webkit)
Message-ID: <20100128150632.BA71377719@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8b2bd9319e6d6c5ac1a8a62e58abea617f3c3dee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/flex/flex.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index 223f58e..fed0d77 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -37,3 +37,4 @@ FLEX_POST_CLEAN_HOOKS += FLEX_UNINSTALL_LIBFL
 endif
 
 $(eval $(call AUTOTARGETS,package,flex))
+$(eval $(call AUTOTARGETS,package,flex,host))
-- 
1.6.3.3
