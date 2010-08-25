From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 25 Aug 2010 17:30:38 +0200
Subject: [Buildroot] [git commit master 1/1] CHANGES: update with changes
	from for-2010.08 branch
Message-ID: <20100825153146.C81B589016@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2e7ab32c97a27423d64214aa21f3c5c999a7f87a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES   |   18 ++++++++++++++++++
 Config.in |    2 +-
 2 files changed, 19 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 09efdb0..ccc6a52 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,21 @@
+2010.08, Not released yet:
+
+	Fixes all over the tree.
+
+	Mark the combination of uClibc 0.9.31, gcc 4.2.x, C++ and
+	locale support as broken.
+
+	Mark CRIS architecture as deprecated, as it is discontinued
+	upstream.
+
+	Updated/fixed packages: busybox, imagemagick, libglib2, lua,
+	luafilesystem, lzo, netcat, php, sysvinit, util-linux
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#635:  util-linux fails to build in 2009.08
+	#2239: netcat package installs its binary to target as avr32-linux...
+
 2010.08-rc1, Released July 30th, 2010:
 
 	Fixes all over the tree and new features.
diff --git a/Config.in b/Config.in
index bcf9feb..52ea6d6 100644
--- a/Config.in
+++ b/Config.in
@@ -8,7 +8,7 @@ config BR2_HAVE_DOT_CONFIG
 
 config BR2_VERSION
 	string
-	default "2010.08-rc1"
+	default "2010.08-rc1-git"
 
 source "target/Config.in.arch"
 source "target/device/Config.in"
-- 
1.7.1
