From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 20 Sep 2018 08:24:49 -0500
Subject: [Buildroot] [PATCH 04/14] boot/at91dataflashboot: URL update
In-Reply-To: <1537449899-9576-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1537449899-9576-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1537449899-9576-4-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 boot/at91dataflashboot/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/at91dataflashboot/Config.in b/boot/at91dataflashboot/Config.in
index 4055f96..1a95709 100644
--- a/boot/at91dataflashboot/Config.in
+++ b/boot/at91dataflashboot/Config.in
@@ -1,3 +1,5 @@
 config BR2_TARGET_AT91DATAFLASHBOOT
 	bool "AT91 DataFlashBoot"
 	depends on BR2_arm926t
+	help
+	  https://www.at91.com/linux4sam/bin/view/Linux4SAM/LegacyAT91Bootstrap
-- 
1.9.1
