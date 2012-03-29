From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 29 Mar 2012 22:21:43 +0200
Subject: [Buildroot] [git commit] syslinux: add upstream URL
Message-ID: <20120329220348.624A8969A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=13ee02d0635005a8a3e917cf29d5b277328d6df5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/syslinux/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/boot/syslinux/Config.in b/boot/syslinux/Config.in
index 60f3b8f..1928651 100644
--- a/boot/syslinux/Config.in
+++ b/boot/syslinux/Config.in
@@ -5,6 +5,8 @@ config BR2_TARGET_SYSLINUX
 	  The syslinux bootloader for x86 systems.
 	  This includes: syslinux, pxelinux, extlinux.
 
+	  http://syslinux.org
+
 config BR2_TARGET_SYSLINUX_ISOLINUX
 	bool "Install isolinux"
 	depends on BR2_TARGET_SYSLINUX
