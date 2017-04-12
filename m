From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Apr 2017 21:03:14 +0200
Subject: [Buildroot] [git commit] minnowboard_max-graphical defconfig:
	remove deprecated AIGLX option
Message-ID: <20170412190317.EA8D182753@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a6cc77ff732270a993a7b127271f4110abf2f08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In the default xserver_xorg-server version 1.19.x, the AIGLX option
is no longer available (cfr. commit ec502ea8e4). In fact, AIGLX is
always enabled. So remove this option.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/minnowboard_max-graphical_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/minnowboard_max-graphical_defconfig b/configs/minnowboard_max-graphical_defconfig
index e8eb133..1a2cd33 100644
--- a/configs/minnowboard_max-graphical_defconfig
+++ b/configs/minnowboard_max-graphical_defconfig
@@ -46,7 +46,6 @@ BR2_PACKAGE_FB_TEST_APP=y
 # X
 BR2_PACKAGE_XORG7=y
 BR2_PACKAGE_XSERVER_XORG_SERVER=y
-BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX=y
 BR2_PACKAGE_XAPP_XRANDR=y
 BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV=y
 BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD=y
