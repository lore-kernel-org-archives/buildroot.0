From: Michael Roth <mroth@nessie.de>
Date: Wed, 23 Sep 2009 09:34:08 +0200
Subject: [Buildroot] [git commit master] .gitignore: Update to the new
	directory hierachy
Message-ID: <20090923073604.14281777AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c2946d113910719bb00cf168fab32a1f648c1db6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Michael Roth <mroth@nessie.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
