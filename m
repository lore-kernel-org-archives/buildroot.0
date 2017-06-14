From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Jun 2017 21:14:59 +0200
Subject: [Buildroot] [git commit] support/misc/target-dir-warning.txt: fix
	typo
Message-ID: <20170614191707.B27347FBED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52c724d3d4ec34a89baf9367cf27bb3d4408f137
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

s/owernship/ownership/

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/misc/target-dir-warning.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/misc/target-dir-warning.txt b/support/misc/target-dir-warning.txt
index 90f8841..94d2e0c 100644
--- a/support/misc/target-dir-warning.txt
+++ b/support/misc/target-dir-warning.txt
@@ -25,5 +25,5 @@ can extract as root:
 
 Those image files are created using the contents of the target/
 directory, but there is a post-processing step to create device files
-and set owernship/permissions properly even if Buildroot does not run
+and set ownership/permissions properly even if Buildroot does not run
 as root.
