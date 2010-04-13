From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Apr 2010 17:05:40 +0200
Subject: [Buildroot] [PATCH 28/35] at91bootstrap: fix incorrect config
	option comment
In-Reply-To: <cover.1271170913.git.thomas.petazzoni@free-electrons.com>
References: <cover.1271170913.git.thomas.petazzoni@free-electrons.com>
Message-ID: <6f83956066b9dbb9dba55a0f16081ed5d1f679c8.1271170913.git.thomas.petazzoni@free-electrons.com>
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
1.6.3.3
