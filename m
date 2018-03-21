From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 21 Mar 2018 09:41:20 -0400
Subject: [Buildroot] [PATCH v2 8/8] gst1-imx: add hash for license file
In-Reply-To: <20180321134120.498-1-aduskett@gmail.com>
References: <20180321134120.498-1-aduskett@gmail.com>
Message-ID: <20180321134120.498-8-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - none

 package/gstreamer1/gst1-imx/gst1-imx.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gstreamer1/gst1-imx/gst1-imx.hash b/package/gstreamer1/gst1-imx/gst1-imx.hash
index 58ff4be225..0ef01d71e9 100644
--- a/package/gstreamer1/gst1-imx/gst1-imx.hash
+++ b/package/gstreamer1/gst1-imx/gst1-imx.hash
@@ -1,2 +1,3 @@
 # locally computed hash
 sha256 3fcf1046ab8c6c7cd94218f4d2bc31ad7b5efa8a6b8f9fd5d93dc182f98ce026  gst1-imx-0.13.0.tar.gz
+sha256 94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23  LICENSE
-- 
2.14.3
