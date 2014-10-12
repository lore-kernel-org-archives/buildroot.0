From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 12:29:47 +0200
Subject: [Buildroot] [git commit] libubox: bump version
Message-ID: <20141012104112.9A916B23A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=84a172cb18059f082e6d5f6823a94dfed6db5aa4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alexey Mednyy <swexru@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libubox/libubox.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libubox/libubox.mk b/package/libubox/libubox.mk
index 770b55d..7ff3c16 100644
--- a/package/libubox/libubox.mk
+++ b/package/libubox/libubox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUBOX_VERSION = bbd846ec2d72b2629758b69dc122ac0b0f2c3e4b
+LIBUBOX_VERSION = 5a0bbefc8fa440446253b171d0ac038d839360e3
 LIBUBOX_SITE = git://nbd.name/luci2/libubox.git
 LIBUBOX_LICENSE = LGPLv2.1, GPLv2, BSD-3c, MIT
 LIBUBOX_INSTALL_STAGING = YES
