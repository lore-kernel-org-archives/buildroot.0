From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 16 May 2010 22:30:22 +0200
Subject: [Buildroot] [git commit master] Config.in: past 2010.05-rc2
Message-ID: <20100517052223.4EAEA12E85E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=93cca7c8bc15893afd213a4a40309b2cf0e2ddac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES   |    4 ++++
 Config.in |    2 +-
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 3a12845..564a8d5 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,7 @@
+2010.05, Not yet released:
+
+	Fixes all over the tree.
+
 2010.05-rc2, Released May 11th, 2010:
 
 	Fixes all over the tree.
diff --git a/Config.in b/Config.in
index c0151bd..debac20 100644
--- a/Config.in
+++ b/Config.in
@@ -8,7 +8,7 @@ config BR2_HAVE_DOT_CONFIG
 
 config BR2_VERSION
 	string
-	default "2010.05-rc2
+	default "2010.05-rc2-git
 
 source "target/Config.in.arch"
 source "target/device/Config.in"
-- 
1.6.3.3
