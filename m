From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 2 Mar 2010 17:42:23 +0100
Subject: [Buildroot] [git commit master] Config.in: Bump version
Message-ID: <20100302164423.799ED7777C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=291fedce66e808c65a3ce6388b0fa48052ab69f8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tree is open for development again.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Config.in b/Config.in
index ef5d2a0..4505578 100644
--- a/Config.in
+++ b/Config.in
@@ -8,7 +8,7 @@ config BR2_HAVE_DOT_CONFIG
 
 config BR2_VERSION
 	string
-	default "2010.02"
+	default "2010.05-git"
 
 source "target/Config.in.arch"
 source "target/device/Config.in"
-- 
1.6.3.3
