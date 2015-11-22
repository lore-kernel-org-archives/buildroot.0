From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Nov 2015 22:47:33 +0100
Subject: [Buildroot] [git commit branch/next] package/yasm: bump version to
	1.3.0
Message-ID: <20151122220216.1310B800E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=590683b1f0677b3c3675647abd222076c3e79c14
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/yasm/yasm.hash |    2 +-
 package/yasm/yasm.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/yasm/yasm.hash b/package/yasm/yasm.hash
index d5cf267..016c15b 100644
--- a/package/yasm/yasm.hash
+++ b/package/yasm/yasm.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 768ffab457b90a20a6d895c39749adb547c1b7cb5c108e84b151a838a23ccf31 yasm-1.2.0.tar.gz
+sha256	3dce6601b495f5b3d45b59f7d2492a340ee7e84b5beca17e48f862502bd5603f	yasm-1.3.0.tar.gz
diff --git a/package/yasm/yasm.mk b/package/yasm/yasm.mk
index 0bbd22d..bf8a481 100644
--- a/package/yasm/yasm.mk
+++ b/package/yasm/yasm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-YASM_VERSION = 1.2.0
+YASM_VERSION = 1.3.0
 YASM_SITE = http://www.tortall.net/projects/yasm/releases
 
 define YASM_PRE_CONFIGURE_FIXUP
