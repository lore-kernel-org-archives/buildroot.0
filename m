From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 18 Jan 2012 16:02:54 +0100
Subject: [Buildroot] [git commit] bison: remove redundant
	HOST_M4_DEPENDENCIES
Message-ID: <20120118150407.9CC4990383@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=880438cba4b1ac8b4411618313b10fcd7581ff37
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bison/bison.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index c277e96..a1de39a 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -16,7 +16,5 @@ endef
 
 BISON_POST_CONFIGURE_HOOKS += BISON_DISABLE_EXAMPLES
 
-HOST_BISON_DEPENDENCIES += host-m4
-
 $(eval $(call AUTOTARGETS))
 $(eval $(call AUTOTARGETS,host))
