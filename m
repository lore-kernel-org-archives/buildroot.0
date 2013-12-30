From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Dec 2013 00:10:58 +0100
Subject: [Buildroot] [git commit] grub: add web reference that documents how
	to generate a splashimage
Message-ID: <20131230231250.3F47F9C1F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=765dad1eab610318f63a66a13bcd29c50ba76a8c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 boot/grub/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/boot/grub/Config.in b/boot/grub/Config.in
index 3ae8448..4db8642 100644
--- a/boot/grub/Config.in
+++ b/boot/grub/Config.in
@@ -42,8 +42,10 @@ config BR2_TARGET_GRUB_SPLASH
 	help
 	  Add support for splashimage.
 
-	  A splashimage is a 14-color indexed .xpm picture which
-	  is displayed as background for the grub menu.
+	  A splashimage is a 14-color indexed .xpm picture which is
+	  displayed as background for the grub menu. See
+	  http://www.katspace.org/computers/Grub_Splash/ for details
+	  on how to generate a splashimage.
 
 config BR2_TARGET_GRUB_DISKLESS
 	bool "diskless support"
