From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Feb 2018 21:25:19 +0100
Subject: [Buildroot] [git commit] pure-ftpd: Config.in: fix help text
 wrapping
Message-ID: <20180214202523.60C9786D18@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=586fdb3bd67d7b442b6bb7fad903915b18be108b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit fixes the warnings reported by check-package on the help
text of package Config.in file, related to the formatting of the help
text: should start with a tab, then 2 spaces, then at most 62
characters.

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Acked-by: Sam Voss <sam.voss@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pure-ftpd/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pure-ftpd/Config.in b/package/pure-ftpd/Config.in
index d03170b7cf..c060102650 100644
--- a/package/pure-ftpd/Config.in
+++ b/package/pure-ftpd/Config.in
@@ -33,7 +33,7 @@ config BR2_PACKAGE_PURE_FTPD_QUOTAS
 config BR2_PACKAGE_PURE_FTPD_UPLOADSCRIPT
 	bool "uploadscript"
 	help
-	  Enable pure-upload script. Automatically run an external program
-	  after a successful upload.
+	  Enable pure-upload script. Automatically run an external
+	  program after a successful upload.
 
 endif
