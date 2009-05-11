From: Michael Roth <mroth@nessie.de>
Date: Mon, 11 May 2009 12:26:07 +0200
Subject: [Buildroot] [PATCH] .gitignore: Ease /binaries pattern
Message-ID: <1242037567-6496-1-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current /binaries/* hid the directory, but completely removed
it by "git-clean -d", which should not be intended.

Reported-by: Markus Heidelberg <markus.heidelberg@web.de>
Signed-off-by: Michael Roth <mroth@nessie.de>
---
 .gitignore |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/.gitignore b/.gitignore
index a50918e..e7117d3 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,7 +1,7 @@
 /build_*
 /project_*
 /toolchain_*
-/binaries/*
+/binaries
 /dl
 /.auto.deps
 /.config.cmd
-- 
1.6.0.6
