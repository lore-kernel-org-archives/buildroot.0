From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 May 2018 22:26:43 +0200
Subject: [Buildroot] [git commit] support/download/file: remove set -x
Message-ID: <20180513202612.E3E2E8C94C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43ca1987e6e5eb69677e7f1b461feeef187f0656
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/download/file | 1 -
 1 file changed, 1 deletion(-)

diff --git a/support/download/file b/support/download/file
index 6dd37b04dc..e52fcf2c8c 100755
--- a/support/download/file
+++ b/support/download/file
@@ -2,7 +2,6 @@
 
 # We want to catch any unexpected failure, and exit immediately
 set -e
-set -x
 
 # Download helper for cp, to be called from the download wrapper script
 #
