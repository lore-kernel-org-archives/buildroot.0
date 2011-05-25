From: Javier Viguera <javier.viguera@digi.com>
Date: Wed, 25 May 2011 14:31:41 +0200
Subject: [Buildroot] [PATCH] makedevs: minor fix to command's help
In-Reply-To: <1306326701-19437-1-git-send-email-javier.viguera@digi.com>
References: <1306326701-19437-1-git-send-email-javier.viguera@digi.com>
Message-ID: <1306326701-19437-2-git-send-email-javier.viguera@digi.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Javier Viguera <javier.viguera@digi.com>
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
