From: Alexandre Belloni <abelloni@adeneo-embedded.com>
Date: Thu,  5 Jan 2012 12:03:48 +0100
Subject: [Buildroot] [PATCH v4 1/3] Reorder entries alphabetically
In-Reply-To: <1325761430-3942-1-git-send-email-abelloni@adeneo-embedded.com>
References: <1325761430-3942-1-git-send-email-abelloni@adeneo-embedded.com>
Message-ID: <1325761430-3942-2-git-send-email-abelloni@adeneo-embedded.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexandre Belloni <abelloni@adeneo-embedded.com>
---
 boot/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/Config.in b/boot/Config.in
index 2a97695..7e3d108 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -1,11 +1,11 @@
 menu "Bootloaders"
 
+source "boot/at91bootstrap/Config.in"
+source "boot/at91dataflashboot/Config.in"
 source "boot/barebox/Config.in"
 source "boot/grub/Config.in"
 source "boot/syslinux/Config.in"
 source "boot/uboot/Config.in"
-source "boot/at91bootstrap/Config.in"
-source "boot/at91dataflashboot/Config.in"
 source "boot/xloader/Config.in"
 
 endmenu
-- 
1.7.8.2
