From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Mar 2020 10:36:20 +0100
Subject: [Buildroot] [git commit] Kickoff 2020.05 cycle
Message-ID: <20200309092412.335E98081D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b806ded5759ccfac4b3de5ca967ce580666c45e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index c5d66705ce..9819ae6f36 100644
--- a/Makefile
+++ b/Makefile
@@ -92,7 +92,7 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2020.02
+export BR2_VERSION := 2020.05-git
 # Actual time the release is cut (for reproducible builds)
 BR2_VERSION_EPOCH = 1583701800
 
