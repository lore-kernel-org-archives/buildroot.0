From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue,  8 May 2018 17:58:29 +0200
Subject: [Buildroot] [PATCH] support/download/file: remove set -x
Message-ID: <1525795109-22746-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 support/download/file | 1 -
 1 file changed, 1 deletion(-)

diff --git a/support/download/file b/support/download/file
index 6dd37b0..e52fcf2 100755
--- a/support/download/file
+++ b/support/download/file
@@ -2,7 +2,6 @@
 
 # We want to catch any unexpected failure, and exit immediately
 set -e
-set -x
 
 # Download helper for cp, to be called from the download wrapper script
 #
-- 
2.7.4
