From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 9 Jun 2009 16:43:40 +0200
Subject: [Buildroot] [git commit] Config.in: update version for 2009.08
	development
Message-ID: <20090609144407.67CFB776E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=42eca21d2caaf582d4f4cf08e92b2d163149a259
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Config.in b/Config.in
index 1e2e06f..d248565 100644
--- a/Config.in
+++ b/Config.in
@@ -8,7 +8,7 @@ config BR2_HAVE_DOT_CONFIG
 
 config BR2_VERSION
 	string
-	default "2009.05"
+	default "2009.08-git"
 
 source "target/Config.in.arch"
 source "target/device/Config.in"
-- 
1.6.0.6
