From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 25 Feb 2011 15:31:33 +0100
Subject: [Buildroot] [git commit master 1/1] CHANGES: update with recent
	changes
Message-ID: <20110225143207.ACE558F760@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c82d04c415ef9af9608faa049fb36918e42688d6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 39c9f3b..8149d8f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,11 +2,12 @@
 
 	Fixes all over the tree.
 
-	Updated/fixed packages: icu
+	Updated/fixed packages: icu, nuttcp, slang, sylpheed
 
 	Issues resolved (http://bugs.uclibc.org):
 
 	#3259: Unable to build webkit (on arm)
+	#3295: slang fails to build on mipsel
 
 2011.02-rc2, Released February 24th, 2011:
 
-- 
1.7.3.4
