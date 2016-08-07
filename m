From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Aug 2016 22:56:00 +0200
Subject: [Buildroot] [git commit] configs/odroidc2: enable console display
Message-ID: <20160807205605.4F7CA81F4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61b6abb2a2198d0a659d305ac3dd813a1f900aa1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Redirect the console output to the screen and not only to the serial
port.

Signed-off-by: Dagg Stompler <daggs@gmx.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/hardkernel/odroidc2/boot.ini | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/hardkernel/odroidc2/boot.ini b/board/hardkernel/odroidc2/boot.ini
index 4f17fec..203a42a 100644
--- a/board/hardkernel/odroidc2/boot.ini
+++ b/board/hardkernel/odroidc2/boot.ini
@@ -13,7 +13,7 @@ setenv m_bpp "32"
 setenv hpd "true"
 
 # Default Console Device Setting
-setenv condev "console=ttyS0,115200n8"	# Serial Console
+setenv condev "console=ttyS0,115200n8 console=tty0"   # on both
 
 # Meson Timer
 # 1 - Meson Timer
