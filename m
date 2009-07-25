From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 25 Jul 2009 21:08:55 +0200
Subject: [Buildroot] [git commit] target/Config.in: remove reference to
	target/linux/Config.in.experimental
Message-ID: <20090725191957.21AC7777FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=261b3fc0f49ec8b372668bb6d11cb4a0047aa669
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

File doesn't exist any more.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/Config.in |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/target/Config.in b/target/Config.in
index 87abbe6..4bd76c5 100644
--- a/target/Config.in
+++ b/target/Config.in
@@ -85,7 +85,6 @@ config BR2_PACKAGE_LINUX
 
 if BR2_PACKAGE_LINUX
 source "target/linux/Config.in"
-#source "target/linux/Config.in.experimental"
 source "target/linux/Config.in.advanced"
 endif
 
-- 
1.6.3.3
