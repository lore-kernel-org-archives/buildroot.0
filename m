From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Feb 2016 16:25:33 +0100
Subject: [Buildroot] [git commit] Makefile: Add help to nobuild_targets
Message-ID: <20160227152542.111E680746@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=093a116885e808123e14258ca62befc68ecb196b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ignacy Gaw??dzki <ignacy.gawedzki@green-communications.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
