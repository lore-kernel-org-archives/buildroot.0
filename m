From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 1 Jun 2009 09:00:03 +0200
Subject: [Buildroot] [git commit] Update for 2009.05
Message-ID: <20090601070216.89624777DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=571bf57d9f68cc09da9bd8f8e31c07ba1578b3b1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/tags/2009.05


Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES   |    5 +++++
 Config.in |    2 +-
 2 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index ed5efe4..aadc30c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,8 @@
+2009.05, Released June 1st, 2009:
+
+	Fixes for dropbear & diffutils, bump linux-advanced 2.6.29.x
+	version and marked ubifsroot as broken.
+
 2009.05-rc3, Released May 27th, 2009:
 
 	Fixes for toolchain (gcc arm pr37436), stable kernel versions,
diff --git a/Config.in b/Config.in
index cad5db0..1e2e06f 100644
--- a/Config.in
+++ b/Config.in
@@ -8,7 +8,7 @@ config BR2_HAVE_DOT_CONFIG
 
 config BR2_VERSION
 	string
-	default "2009.05-rc3"
+	default "2009.05"
 
 source "target/Config.in.arch"
 source "target/device/Config.in"
-- 
1.6.0.6
