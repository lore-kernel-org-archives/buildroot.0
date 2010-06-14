From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jun 2010 22:33:08 +0200
Subject: [Buildroot] [git commit master 1/1] at91bootstrap: fix incorrect
	config option comment
Message-ID: <20100614203442.1BDBF804D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b19272d4bef98a8d46d06fe968beab031026d9f3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
1.7.1
