From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Mar 2021 13:02:09 +0100
Subject: [Buildroot] [git commit] Kickoff 2021.05 cycle
Message-ID: <20210307113931.759FC81124@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7abc0d1001b24043ac05ac26dea4f68c92b68bfd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 9d6b962477..ef2b6a34e8 100644
--- a/Makefile
+++ b/Makefile
@@ -92,7 +92,7 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2021.02
+export BR2_VERSION := 2021.05-git
 # Actual time the release is cut (for reproducible builds)
 BR2_VERSION_EPOCH = 1615065000
 
