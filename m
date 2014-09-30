From: David du Colombier <0intro@gmail.com>
Date: Tue, 30 Sep 2014 15:28:03 +0200
Subject: [Buildroot] [PATCH 1/3] libvpx: bump to version 1.3.0
Message-ID: <1412083685-20812-1-git-send-email-0intro@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: David du Colombier <0intro@gmail.com>
---
 package/libvpx/libvpx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libvpx/libvpx.mk b/package/libvpx/libvpx.mk
index 480f1c4..c288010 100644
--- a/package/libvpx/libvpx.mk
+++ b/package/libvpx/libvpx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVPX_VERSION = v1.2.0
+LIBVPX_VERSION = v1.3.0
 LIBVPX_SITE = http://git.chromium.org/webm/libvpx.git
 LIBVPX_SITE_METHOD = git
 
-- 
1.9.3
