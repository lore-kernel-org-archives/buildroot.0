From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Jan 2017 23:33:21 +0100
Subject: [Buildroot] [git commit] package/x264: bump version
Message-ID: <20170122223619.5B89980434@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4bae469b0d2d4cca1a8db0ff019acfafcc1e8d58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x264/x264.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x264/x264.mk b/package/x264/x264.mk
index 19111f0..aa7bb55 100644
--- a/package/x264/x264.mk
+++ b/package/x264/x264.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-X264_VERSION = 72d53ab2ac7af24597a824e868f2ef363a22f5d4
+X264_VERSION = b97ae0644f16bad2e2c9c9181264a946769a0aa0
 X264_SITE = git://git.videolan.org/x264.git
 X264_LICENSE = GPLv2+
 X264_DEPENDENCIES = host-pkgconf
