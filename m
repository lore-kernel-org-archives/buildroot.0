From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 20 Sep 2018 08:24:48 -0500
Subject: [Buildroot] [PATCH 03/14] boot/at91bootstrap3: URL update
In-Reply-To: <1537449899-9576-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1537449899-9576-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1537449899-9576-3-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 boot/at91bootstrap3/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
index 614363c..4534b4e 100644
--- a/boot/at91bootstrap3/Config.in
+++ b/boot/at91bootstrap3/Config.in
@@ -10,6 +10,9 @@ config BR2_TARGET_AT91BOOTSTRAP3
 	  - Physical media algorithm such as DataFlash, NandFlash, NOR
 	    Flash...
 
+
+	  https://www.at91.com/linux4sam/bin/view/Linux4SAM/AT91Bootstrap
+
 if BR2_TARGET_AT91BOOTSTRAP3
 
 choice
-- 
1.9.1
