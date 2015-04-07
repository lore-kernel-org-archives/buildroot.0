From: Sagaert Johan <sagaert.johan@proximus.be>
Date: Tue,  7 Apr 2015 11:59:31 +0200
Subject: [Buildroot] [PATCH 1/1] libvpx : name the supported formats.
Message-ID: <1428400771-15579-1-git-send-email-sagaert.johan@proximus.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>
---
 package/libvpx/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libvpx/Config.in b/package/libvpx/Config.in
index 0ed3e1a..6b0400c 100644
--- a/package/libvpx/Config.in
+++ b/package/libvpx/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_LIBVPX
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  A high-quality, open video format that's freely available to
-	  everyone.
+	  everyone. Supports the VP8 and VP9 formats.
 
 	  http://webmproject.org
 
-- 
2.3.3
