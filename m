From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 26 Aug 2012 23:57:04 +0200
Subject: [Buildroot] [PATCH] uboot: improve help text of
	BR2_TARGET_UBOOT_BOARDNAME
In-Reply-To: <817F82FC-C333-4BC2-9BD9-4ADBB6D313BC@nasa.gov>
Message-ID: <1346018224-16286-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
The actual text is taken from Thomas P.'s mail.

 boot/uboot/Config.in |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index afc2f91..609632e 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -9,6 +9,8 @@ config BR2_TARGET_UBOOT_BOARDNAME
 	help
 	  One of U-Boot supported boards to be built.
 	  This will be suffixed with _config to meet U-Boot standard naming.
+	  See boards.cfg in U-Boot source code for the list of available
+	  configurations.
 
 choice
 	prompt "U-Boot Version"
-- 
tg: (bc753d3..) t/uboot-help (depends on: master)
