From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 14:07:28 +0200
Subject: [Buildroot] [PATCH] DEVELOPERS: add Joao Pinto as contact for
 snps_aarch64_vdk_defconfig
Message-ID: <20190811120739.26539-7-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joao added this defconfig a while ago, and is still active
contributing to Buildroot, so let's add him as the contact for this
defconfig, so that he receives build failure notifications and gets
Cc'ed on patches.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Joao Pinto <jpinto@synopsys.com>
---
Joao, could you reply with an Acked-by, if you're fine with this?
Thanks!
---
 DEVELOPERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 62eeb1fa99..8b1ba6b643 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1161,6 +1161,10 @@ F:	package/wmctrl/
 F:	package/x11r7/xdriver_xf86-video-imx/
 F:	package/x11r7/xdriver_xf86-video-imx-viv/
 
+N:	Joao Pinto <jpinto@synopsys.com>
+F:	board/synopsys/vdk/
+F:	configs/snps_aarch64_vdk_defconfig
+
 N:	Joel Carlson <JoelsonCarl@gmail.com>
 F:	package/c-capnproto/
 F:	package/capnproto/
-- 
2.21.0
