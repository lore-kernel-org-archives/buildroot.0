From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun,  1 Mar 2015 22:09:47 +0100
Subject: [Buildroot] [PATCH 2/2] autobuild-run: remove handled TODO item for
	killing all subprocesses
In-Reply-To: <1425244187-21189-1-git-send-email-patrickdepinguin@gmail.com>
References: <1425244187-21189-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <1425244187-21189-2-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

(to be squashed with commit 0002f12 (autobuild-run: kill all children on
SIGTERM)

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 scripts/autobuild-run | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 246a032..4c9d55c 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -53,8 +53,6 @@
 #   etc.
 # - Detect selection of multiple virtual package providers and don't consider it
 #   a failure
-# - Properly handle kill of main script: stop all running children and do not
-#   print out stacktraces
 # - Fix problem in removal of output directory: sometimes this fails with
 #   message 'directory not empty' which suggests that someone is writing to the
 #   directory at the time of removal.
-- 
1.8.5.1
