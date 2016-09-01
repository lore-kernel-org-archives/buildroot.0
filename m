From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Sep 2016 14:23:11 +0200
Subject: [Buildroot] [git commit] Kickoff 2016.11 cycle
Message-ID: <20160901122341.E41A680199@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cff53ce35b8dab3bbdd9aa4471d1ecb3238c9fab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 283147c..3163a83 100644
--- a/Makefile
+++ b/Makefile
@@ -46,7 +46,7 @@ else # umask
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2016.08
+export BR2_VERSION := 2016.11-git
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
