From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  1 Jun 2010 00:08:20 +0200
Subject: [Buildroot] [PATCH 34/46] at91bootstrap: fix incorrect config
	option comment
In-Reply-To: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
References: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
Message-ID: <0569678db1c6d140f1a57280ebf868f2bc4a1e33.1275343448.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/at91bootstrap/Config.in |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/boot/at91bootstrap/Config.in b/boot/at91bootstrap/Config.in
index 7c0f393..1bf8d50 100644
--- a/boot/at91bootstrap/Config.in
+++ b/boot/at91bootstrap/Config.in
@@ -61,10 +61,7 @@ choice
 	prompt "Start address of application"
 	default BR2_AT91BOOTSTRAP_JUMP_TO_DEFAULT
 	help
-	  Select Chip for which AT91 bootstrap should be built
-	  Currently supports AT91SAM9260EK, AT91SAM9261EK,
-	  AT91SAM9XEEK, AT91SAM9263EK
-
+	  Location of the application start address
 
 config	BR2_AT91BOOTSTRAP_JUMP_TO_DEFAULT
 	bool "Copy to the default U-Boot start location in the SDRAM"
-- 
1.7.0.4
