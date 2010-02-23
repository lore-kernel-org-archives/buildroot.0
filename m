From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 23 Feb 2010 21:06:54 +0100
Subject: [Buildroot] [git commit master] CHANGES: add recently resolved
	issues (335, 355, 453, 457, 459, 469, 671, 711, 821, 1039)
Message-ID: <20100223200733.8B6867773B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5239be04c918f9776db59c2ebb273ece140cb17c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Thanks to Thomas for doing this work.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 7c46336..09abc3a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -9,6 +9,16 @@
 
 	Issues resolved (http://bugs.uclibc.org):
 
+	#335: atk looks for the path to the gnome library on the host
+	#355: Please update WebKit - it doesn't compile!
+	#453: libglib2 autoreconf
+	#457: e2fsprogs link problem
+	#459: libgtk2 autoreconf
+	#469: build of libgtk2 for host incorrectly assumes that X.org ...
+	#671: Bash fails to build when building buildront on Ubuntu 9.04
+	#711: WebKit host dependencies problems
+	#821: cp: illegal operation
+	#1039: Not compiled on ubuntu karmic
 	#1069: [PATCH] The AT91BOOTSTRAP makefile contains a typo
 
 2010.02-rc1, Released February 9th, 2010:
-- 
1.6.3.3
