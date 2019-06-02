From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Jun 2019 10:17:27 +0200
Subject: [Buildroot] [git commit] Kickoff 2019.08 cycle
Message-ID: <20190602081743.32A16815E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2421c246b2ff8b9492ce98f2d2f4838f148fa51b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 7ff40496d3..c98a0ed87e 100644
--- a/Makefile
+++ b/Makefile
@@ -92,7 +92,7 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2019.05
+export BR2_VERSION := 2019.08-git
 # Actual time the release is cut (for reproducible builds)
 BR2_VERSION_EPOCH = 1559462000
 
