From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 16 May 2011 14:43:51 +0200
Subject: [Buildroot] [git commit] bison: add host package
Message-ID: <20110516124542.AC43C83537@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=023481efe2f69ca99870677112483e92c641aba9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bison/bison.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index 8849030..93026e9 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -14,3 +14,4 @@ endef
 BISON_POST_CONFIGURE_HOOKS += BISON_DISABLE_EXAMPLES
 
 $(eval $(call AUTOTARGETS,package,bison))
+$(eval $(call AUTOTARGETS,package,bison,host))
-- 
1.7.3.4
