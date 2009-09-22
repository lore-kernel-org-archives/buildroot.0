From: Michael Roth <mroth@nessie.de>
Date: Wed, 23 Sep 2009 01:30:23 +0200
Subject: [Buildroot] [PATCH 3/4] .gitignore: Update to the new directory
	hierachy
Message-ID: <1253662223-11741-1-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 .gitignore |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/.gitignore b/.gitignore
index 93b53bb..a736c4d 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,7 +1,4 @@
-/build_*
-/project_*
-/toolchain_*
-/binaries
+/output
 /dl
 /.auto.deps
 /.config.cmd
-- 
1.6.3.3
