From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 24 Jun 2018 00:35:29 +0200
Subject: [Buildroot] [PATCH v6 9/9] gst1-imx: add hash for license file
In-Reply-To: <20180623223529.13629-1-ps.report@gmx.net>
References: <20180623223529.13629-1-ps.report@gmx.net>
Message-ID: <20180623223529.13629-10-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <aduskett@gmail.com>

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v5 -> v6:
  - no changes
---
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
2.17.1
