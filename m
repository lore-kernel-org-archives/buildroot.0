From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Jun 2021 11:20:28 +0200
Subject: [Buildroot] [git commit] Kickoff 2021.08 cycle
Message-ID: <20210607085108.9B02A7FA4B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=24753e9bf626af6beba3c710a27ea387f94b76b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 08e4a4104d..472af5a318 100644
--- a/Makefile
+++ b/Makefile
@@ -92,7 +92,7 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2021.05
+export BR2_VERSION := 2021.08-git
 # Actual time the release is cut (for reproducible builds)
 BR2_VERSION_EPOCH = 1623014000
 
