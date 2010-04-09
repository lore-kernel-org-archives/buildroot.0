From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 9 Apr 2010 16:19:13 +0200
Subject: [Buildroot] [git commit master] cramfs: fix help text typo
Message-ID: <20100409142134.CDC6020E7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e7b72e11dc2fb7d15440dca32cff59869dc1c2c3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cramfs/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cramfs/Config.in b/package/cramfs/Config.in
index 553fb8a..a5c73a8 100644
--- a/package/cramfs/Config.in
+++ b/package/cramfs/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_CRAMFS
        bool "cramfs"
        help
-         cramfs is a comporessed read-only filesystem. This package
+         cramfs is a compressed read-only filesystem. This package
          contains the tools to generate and check a cramfs filesystem.
 
-	 http://sourceforge.net/projects/cramfs/
\ No newline at end of file
+	 http://sourceforge.net/projects/cramfs/
-- 
1.6.3.3
