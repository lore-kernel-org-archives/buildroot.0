From: Michael Roth <mroth@nessie.de>
Date: Mon, 11 May 2009 12:26:07 +0200
Subject: [Buildroot] [git commit] .gitignore: Ease /binaries pattern
Message-ID: <20090512102506.15846777DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7204488170bc0a23aaabd90a129e44c3374ff0e7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


The current /binaries/* hid the directory, but completely removed
it by "git-clean -d", which should not be intended.

Reported-by: Markus Heidelberg <markus.heidelberg@web.de>
Signed-off-by: Michael Roth <mroth@nessie.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
