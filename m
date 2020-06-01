From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Jun 2020 23:32:11 +0200
Subject: [Buildroot] [git commit] Kickoff 2020.08 cycle
Message-ID: <20200601213229.DC004813F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1c67785ef58bc7c77f9b6fb7eadd1ac81c2d6f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index b2afe5bcfb..ce1c08a6f6 100644
--- a/Makefile
+++ b/Makefile
@@ -92,7 +92,7 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2020.05
+export BR2_VERSION := 2020.08-git
 # Actual time the release is cut (for reproducible builds)
 BR2_VERSION_EPOCH = 1591045000
 
