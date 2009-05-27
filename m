From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 27 May 2009 20:44:08 +0200
Subject: [Buildroot] [git commit] Update for 2009.05-rc3
Message-ID: <20090527185052.BA56D7786B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=45e11e2960108fe91384a8170e08504abca070b3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES   |    9 +++++++++
 Config.in |    2 +-
 2 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 73ee66d..ed5efe4 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,12 @@
+2009.05-rc3, Released May 27th, 2009:
+
+	Fixes for toolchain (gcc arm pr37436), stable kernel versions,
+	busybox, curl, libusb, readline, python and strace.
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#345: libcurl package needs a urandom fix
+
 2009.05-rc2, Released May 19th, 2009:
 
 	Fixes for toolchain (gcc w/softfloat on ppc, 3.4.6 buildfix
diff --git a/Config.in b/Config.in
index 998bcf1..cad5db0 100644
--- a/Config.in
+++ b/Config.in
@@ -8,7 +8,7 @@ config BR2_HAVE_DOT_CONFIG
 
 config BR2_VERSION
 	string
-	default "2009.05-rc2"
+	default "2009.05-rc3"
 
 source "target/Config.in.arch"
 source "target/device/Config.in"
-- 
1.6.0.6
