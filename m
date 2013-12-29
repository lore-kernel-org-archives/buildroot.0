From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Dec 2013 18:33:48 +0100
Subject: [Buildroot] [PATCHv2 4/4] grub: add web reference that documents
	how to generate a splashimage
In-Reply-To: <1388338428-19833-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1388338428-19833-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1388338428-19833-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/grub/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

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
-- 
1.8.3.2
