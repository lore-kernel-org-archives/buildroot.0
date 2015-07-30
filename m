From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 23:34:44 +0200
Subject: [Buildroot] [git commit] xserver_xorg-server: switch to the modular
	server as default
Message-ID: <20150730213457.7BCA181E7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2d0a5e5cea8986d753fcde79102d475eca9c0275
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xserver_xorg-server/Config.in |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index dc0b70c..f0ec598 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -87,7 +87,6 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER_VERSION
 
 choice
 	prompt "X Window System server type"
-	default BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE
 	help
 	  Select the X Window System server to use
 
