From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Aug 2009 09:23:29 +0200
Subject: [Buildroot] [git commit] CHANGES: gzip fix is post-rc1
Message-ID: <20090805072359.925ED771EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=15dab042b495ff2b722e3e96c755ccc0d00d3085
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 7da12bb..c375c71 100644
--- a/CHANGES
+++ b/CHANGES
@@ -3,6 +3,7 @@
 	Issues resolved (http://bugs.uclibc.org):
 
 	#525: sed broken with external toolchain
+	#537: Fix gzip build with recent glibc
 
 2009.08-rc1, Released August 2nd, 2009:
 
@@ -84,7 +85,6 @@
 	#509: Bump sqlite package to 3.6.16
 	#523: pciutils broken with external toolchain
 	#533: Update gamin to 0.1.10 to fix compilation
-	#537: Fix gzip build with recent glibc
 
 2009.05, Released June 1st, 2009:
 
-- 
1.6.3.3
