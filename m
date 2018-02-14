From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Wed, 14 Feb 2018 00:04:58 -0500
Subject: [Buildroot] [PATCH 3/3] pure-ftpd: Config.in: fix help text wrapping
In-Reply-To: <20180214050458.32281-1-gael.portay@savoirfairelinux.com>
References: <20180214050458.32281-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180214050458.32281-4-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit fixes the warnings reported by check-package on the help
text of package Config.in file, related to the formatting of the help
text: should start with a tab, then 2 spaces, then at most 62
characters.

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
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
-- 
2.15.1
