From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Jun 2017 10:14:57 +0200
Subject: [Buildroot] [git commit] Kickoff 2017.08 cycle
Message-ID: <20170601081655.75EAB82A18@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=284d4f216c2d797fe961e98da01413ef83702175
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index f4d41ce..499a39f 100644
--- a/Makefile
+++ b/Makefile
@@ -86,7 +86,7 @@ else # umask / $(CURDIR) / $(O)
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2017.05
+export BR2_VERSION := 2017.08-git
 # Actual time the release is cut (for reproducible builds)
 BR2_VERSION_EPOCH = 1496267000
 
