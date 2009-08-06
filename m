From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 Aug 2009 10:39:54 +0200
Subject: [Buildroot] [git commit] CHANGES: update for 2009.08-rc2
Message-ID: <20090806084035.351E4777BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4ebaaf41cfffedd65304e340630acfa34f047415
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES   |   11 ++++++++++-
 Config.in |    2 +-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index c375c71..ec8bfde 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,13 @@
-2009.08, Not yet released:
+2009.08-rc2, Released August 6th, 2009:
+
+	Additional fixes and new features.
+
+	New packages: libuuid, gcc 4.3.4.
+
+	Updated/fixed packages: busybox, classpath, gzip, ipsec-tools,
+	jamvm, libusb, microperl, neon, popt, sed, webkit.
+
+	Fixed issue with 'make oldconfig'
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/Config.in b/Config.in
index d248565..f2e84ac 100644
--- a/Config.in
+++ b/Config.in
@@ -8,7 +8,7 @@ config BR2_HAVE_DOT_CONFIG
 
 config BR2_VERSION
 	string
-	default "2009.08-git"
+	default "2009.08-rc2"
 
 source "target/Config.in.arch"
 source "target/device/Config.in"
-- 
1.6.3.3
