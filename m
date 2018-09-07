From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:16:41 -0000
Subject: [Buildroot] [git commit] sunxi-mali-mainline-driver: free-electrons
 is now bootlin
Message-ID: <20180907111549.9F4347FCA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf9106fe559cc9ea9f742c21713fe95f176b84b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even though http://github.com/free-electrons/<foo>/ properly redirects
to http://github.com/bootlin/<foo>/, it makes sense to use the
bootlin/ URL directly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sunxi-mali-mainline-driver/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sunxi-mali-mainline-driver/Config.in b/package/sunxi-mali-mainline-driver/Config.in
index c939d2a957..057f20db66 100644
--- a/package/sunxi-mali-mainline-driver/Config.in
+++ b/package/sunxi-mali-mainline-driver/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_SUNXI_MALI_MAINLINE_DRIVER
 	  Linux kernels (>= 4.4). Note that it should be installed
 	  together with the corresponding userspace OpenGL libraries,
 	  which are provided as binaries only at:
-	  https://github.com/free-electrons/mali-blobs
+	  https://github.com/bootlin/mali-blobs
 
 	  sunxi-mali-mainline-driver requires a Linux kernel >= 4.4
 	  with the following options enabled:
