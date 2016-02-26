From: Ignacy =?iso-8859-2?Q?Gaw=EAdzki?= <ignacy.gawedzki@green-communications.fr>
Date: Fri, 26 Feb 2016 17:48:05 +0100
Subject: [Buildroot] [PATCH] Makefile: Add help to nobuild_targets.
Message-ID: <20160226164805.GA6142@zenon.in.qult.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 90018b4..c43c599 100644
--- a/Makefile
+++ b/Makefile
@@ -94,7 +94,7 @@ noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconf
 # something else than one of the nobuild_targets.
 nobuild_targets := source source-check \
 	legal-info external-deps _external-deps \
-	clean distclean
+	clean distclean help
 ifeq ($(MAKECMDGOALS),)
 BR_BUILDING = y
 else ifneq ($(filter-out $(nobuild_targets),$(MAKECMDGOALS)),)
-- 
2.5.0
