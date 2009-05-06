From: Michael Roth <mroth@nessie.de>
Date: Thu,  7 May 2009 00:45:40 +0200
Subject: [Buildroot] [PATCH] .gitignore: Add download directory 'dl'
Message-ID: <1241649940-16168-1-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(And additionally, ease /binaries pattern.)

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 .gitignore |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/.gitignore b/.gitignore
index 4a2de4e..e7117d3 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,7 +1,8 @@
 /build_*
 /project_*
 /toolchain_*
-/binaries/*
+/binaries
+/dl
 /.auto.deps
 /.config.cmd
 /.config.old
-- 
1.6.0.6
