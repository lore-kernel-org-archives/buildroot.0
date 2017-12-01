From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 1 Dec 2017 10:31:43 +0100
Subject: [Buildroot] [git commit] Kickoff 2018.02 cycle
Message-ID: <20171201092447.27AF28260D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=57dcad243e6daefefbe21109e1fc97272053a7a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index a86d764..d9fcdeb 100644
--- a/Makefile
+++ b/Makefile
@@ -87,7 +87,7 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2017.11
+export BR2_VERSION := 2018.02-git
 # Actual time the release is cut (for reproducible builds)
 BR2_VERSION_EPOCH = 1512070000
 
