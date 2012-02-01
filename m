From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 1 Feb 2012 23:30:22 +0100
Subject: [Buildroot] [git commit] boot: Reorder entries alphabetically
Message-ID: <20120201224701.77EC090979@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=14b600203b31f69d4ca90572b2fbf096053c29e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alexandre Belloni <abelloni@adeneo-embedded.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
