From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 28 Feb 2011 16:11:02 +0100
Subject: [Buildroot] [git commit master 1/1] CHANGES: update with recent
	changes
Message-ID: <20110228151122.950648F790@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=da8700c1bdade780f9a589fa49df1a3670a539bc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index dc7ca7f..73c1ad8 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,8 +2,8 @@
 
 	Fixes all over the tree.
 
-	Updated/fixed packages: alsamixergui, icu, mpd, nuttcp, qt,
-	slang, squashfs, sylpheed, xerces
+	Updated/fixed packages: alsamixergui, avahi, ffmpeg, icu, mpd,
+	nuttcp, qt, slang, squashfs, sylpheed, synergy, xerces
 
 	Deprecated packages: devmem2, webif
 
@@ -11,6 +11,7 @@
 
 	#3259: Unable to build webkit (on arm)
 	#3295: slang fails to build on mipsel
+	#3325: ffmpeg fails to build
 
 2011.02-rc2, Released February 24th, 2011:
 
-- 
1.7.3.4
