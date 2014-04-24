From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Apr 2014 13:36:09 +0200
Subject: [Buildroot] [git commit] libfslcodec: add comment explaining why it
	needs glibc
Message-ID: <20140424113619.6C4989C9CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f4f022830deb2475aaf87ec48f43a59037d1411b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libfslcodec/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libfslcodec/Config.in b/package/libfslcodec/Config.in
index be79352..d2007fe 100644
--- a/package/libfslcodec/Config.in
+++ b/package/libfslcodec/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBFSLCODEC
 	bool "libfslcodec"
 	depends on BR2_arm # Only relevant for i.MX
-	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_TOOLCHAIN_USES_GLIBC # prebuilt binaries
 	help
 	  Binary codec libraries for the Freescale i.MX SoCs.
 
