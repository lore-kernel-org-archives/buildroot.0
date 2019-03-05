From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Mar 2019 10:03:32 +0100
Subject: [Buildroot] [git commit] Kickoff 2019.05 cycle
Message-ID: <20190305090142.161148E896@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d29ec62899ed7fafefd0a3fddee61683648421fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 2b91d40919..a64196f9c3 100644
--- a/Makefile
+++ b/Makefile
@@ -92,7 +92,7 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2019.02
+export BR2_VERSION := 2019.05-git
 # Actual time the release is cut (for reproducible builds)
 BR2_VERSION_EPOCH = 1551735000
 
