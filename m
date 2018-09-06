From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Sep 2018 22:52:43 +0200
Subject: [Buildroot] [git commit] Kickoff 2018.11 cycle
Message-ID: <20180906205218.2675A82DA6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=89920e9735cb561dccf1e1f81d35788fd10a655b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 3e1319c1ea..1c1467d482 100644
--- a/Makefile
+++ b/Makefile
@@ -87,7 +87,7 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2018.08
+export BR2_VERSION := 2018.11-git
 # Actual time the release is cut (for reproducible builds)
 BR2_VERSION_EPOCH = 1536263000
 
