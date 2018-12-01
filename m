From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 1 Dec 2018 23:36:34 +0100
Subject: [Buildroot] [git commit] Kickoff 2019.02 cycle
Message-ID: <20181201223326.2ACD18A392@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9019189bd107e0f4a301655b88a4f66348215212
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index c4c34b0ff2..e1e7e53068 100644
--- a/Makefile
+++ b/Makefile
@@ -92,7 +92,7 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2018.11
+export BR2_VERSION := 2019.02-git
 # Actual time the release is cut (for reproducible builds)
 BR2_VERSION_EPOCH = 1543701000
 
