From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 22:54:38 +0200
Subject: [Buildroot] [git commit] Kickoff 2019.11 cycle
Message-ID: <20190902205852.F07398A4A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba4d142886c691d003e2c7962801afd5c7108211
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 24ebaa2874..29dc935bbd 100644
--- a/Makefile
+++ b/Makefile
@@ -92,7 +92,7 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2019.08
+export BR2_VERSION := 2019.11-git
 # Actual time the release is cut (for reproducible builds)
 BR2_VERSION_EPOCH = 1567371000
 
