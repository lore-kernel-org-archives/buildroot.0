From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 2 Sep 2009 10:01:08 +0200
Subject: [Buildroot] [git commit master] Config.in: bump version for 2009.11
	development
Message-ID: <20090902080207.C9621760F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ee609f256da8fae6408655e198ac735bb130ba7c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Config.in b/Config.in
index 06cc899..1881f82 100644
--- a/Config.in
+++ b/Config.in
@@ -8,7 +8,7 @@ config BR2_HAVE_DOT_CONFIG
 
 config BR2_VERSION
 	string
-	default "2009.08"
+	default "2009.11-git"
 
 source "target/Config.in.arch"
 source "target/device/Config.in"
-- 
1.6.3.3
