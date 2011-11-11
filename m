From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 11 Nov 2011 22:45:28 +0100
Subject: [Buildroot] [git commit branch/next] kickoff 2012.02 development
	cycle
Message-ID: <20111111214555.B76118F4DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f7c26a26780d6160dca1473c120507058dc2550f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index df2f859..84cea1c 100644
--- a/Makefile
+++ b/Makefile
@@ -24,7 +24,7 @@
 #--------------------------------------------------------------
 
 # Set and export the version string
-export BR2_VERSION:=2011.11-rc1
+export BR2_VERSION:=2012.02-git
 
 # This top-level Makefile can *not* be executed in parallel
 .NOTPARALLEL:
