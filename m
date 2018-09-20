From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 20 Sep 2018 08:24:50 -0500
Subject: [Buildroot] [PATCH 05/14] boot/xloader: URL update
In-Reply-To: <1537449899-9576-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1537449899-9576-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1537449899-9576-5-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 boot/xloader/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/xloader/Config.in b/boot/xloader/Config.in
index c411be4..f687b89 100644
--- a/boot/xloader/Config.in
+++ b/boot/xloader/Config.in
@@ -5,6 +5,8 @@ config BR2_TARGET_XLOADER
 	  The x-loader bootloader. It is mainly used on OMAP-based
 	  platforms.
 
+	  http://omappedia.org/wiki/Linux_OMAP_Kernel_Main
+
 if BR2_TARGET_XLOADER
 config BR2_TARGET_XLOADER_BOARDNAME
 	string "x-loader board name"
-- 
1.9.1
