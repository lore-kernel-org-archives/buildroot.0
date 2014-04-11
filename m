From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 12 Apr 2014 00:38:49 +0200
Subject: [Buildroot] [git commit] gst-fsl-plugins: fix typo in comment
Message-ID: <20140411223911.C56ED9C6D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=231d1ec17ebeebb101950ef23f35a9076c8719b3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer/gst-fsl-plugins/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gstreamer/gst-fsl-plugins/Config.in b/package/gstreamer/gst-fsl-plugins/Config.in
index afedd95..19fa0da 100644
--- a/package/gstreamer/gst-fsl-plugins/Config.in
+++ b/package/gstreamer/gst-fsl-plugins/Config.in
@@ -1,7 +1,7 @@
 comment "gst-fsl-plugins needs an imx-specific Linux kernel to be built"
 	depends on BR2_arm && !BR2_LINUX_KERNEL
 
-comment "gst-fsl-plugines needs an (e)glibc toolchain"
+comment "gst-fsl-plugins needs an (e)glibc toolchain"
 	depends on BR2_arm
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
 
