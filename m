From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Sep 2017 15:14:27 +0200
Subject: [Buildroot] [git commit] Kickoff 2017.11 cycle
Message-ID: <20170902130729.3D7FF81D49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d02b7bfab1cbd58601ee7614ad54421f0ad15270
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 6dd9c6f..9b09589 100644
--- a/Makefile
+++ b/Makefile
@@ -87,7 +87,7 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2017.08
+export BR2_VERSION := 2017.11-git
 # Actual time the release is cut (for reproducible builds)
 BR2_VERSION_EPOCH = 1504300000
 
