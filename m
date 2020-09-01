From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Sep 2020 23:05:41 +0200
Subject: [Buildroot] [git commit] Kickoff 2020.11 cycle
Message-ID: <20200901205811.9313C80107@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e3d7f5fe51d4d8d612cfdad798fb6cba183e15a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index a6b99d0868..0da0902864 100644
--- a/Makefile
+++ b/Makefile
@@ -92,7 +92,7 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2020.08
+export BR2_VERSION := 2020.11-git
 # Actual time the release is cut (for reproducible builds)
 BR2_VERSION_EPOCH = 1598992000
 
