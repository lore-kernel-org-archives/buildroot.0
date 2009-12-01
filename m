From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 Dec 2009 15:46:57 +0100
Subject: [Buildroot] [git commit master] Config.in: Bump version
Message-ID: <20091201144735.9DD4F776D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5aeecd24877a4c03375bf3b3199dcfb0fe5df068
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tree is open for development again.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Config.in b/Config.in
index 9a11043..e4edaae 100644
--- a/Config.in
+++ b/Config.in
@@ -8,7 +8,7 @@ config BR2_HAVE_DOT_CONFIG
 
 config BR2_VERSION
 	string
-	default "2009.11"
+	default "2010.02-git"
 
 source "target/Config.in.arch"
 source "target/device/Config.in"
-- 
1.6.3.3
