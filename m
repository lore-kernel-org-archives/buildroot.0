From: Javier Viguera <javier.viguera@digi.com>
Date: Wed, 25 May 2011 23:27:22 +0200
Subject: [Buildroot] [git commit] makedevs: minor fix to command's help
Message-ID: <20110525212841.E558983610@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=99ead3c2ead605d6504b9abad111778dc2a93ae6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Javier Viguera <javier.viguera@digi.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/makedevs/makedevs.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/makedevs/makedevs.c b/package/makedevs/makedevs.c
index 9fc71af..95c079a 100644
--- a/package/makedevs/makedevs.c
+++ b/package/makedevs/makedevs.c
@@ -328,7 +328,7 @@ void bb_show_usage(void)
 	fprintf(stderr, "%s: [-d device_table] rootdir\n\n", bb_applet_name);
 	fprintf(stderr, "Creates a batch of special files as specified in a device table.\n");
 	fprintf(stderr, "Device table entries take the form of:\n");
-	fprintf(stderr, "type mode user group major minor start increment count\n\n");
+	fprintf(stderr, "name type mode user group major minor start increment count\n\n");
 	fprintf(stderr, "Where name is the file name,  type can be one of:\n");
 	fprintf(stderr, "      f       A regular file\n");
 	fprintf(stderr, "      d       Directory\n");
-- 
1.7.3.4
