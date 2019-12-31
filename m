From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 31 Dec 2019 16:05:45 +0100
Subject: [Buildroot] [git commit] DEVELOPERS: add Joao Pinto as contact for
 snps_aarch64_vdk_defconfig
Message-ID: <20191231150327.A7B5B8E93C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a6841e1b1077693473deaa5c3bb3d810358851f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Joao added this defconfig a while ago, and is still active
contributing to Buildroot, so let's add him as the contact for this
defconfig, so that he receives build failure notifications and gets
Cc'ed on patches.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Joao Pinto <jpinto@synopsys.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3c3a4e9a2e..3a41b426a9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1232,6 +1232,10 @@ F:	package/wmctrl/
 F:	package/x11r7/xdriver_xf86-video-imx/
 F:	package/x11r7/xdriver_xf86-video-imx-viv/
 
+N:	Joao Pinto <jpinto@synopsys.com>
+F:	board/synopsys/vdk/
+F:	configs/snps_aarch64_vdk_defconfig
+
 N:	Joel Carlson <JoelsonCarl@gmail.com>
 F:	package/c-capnproto/
 F:	package/capnproto/
