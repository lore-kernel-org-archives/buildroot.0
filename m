From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 14:07:35 +0200
Subject: [Buildroot] [PATCH] DEVELOPERS: add Alexey Brodkin as contact for
 cubieboard2_defconfig
Message-ID: <20190811120739.26539-14-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexey was the last person to make significant changes to this
defconfig, so let's add him as a contact for the maintenance of this
defconfig.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Alexey Brodkin <alexey.brodkin@synopsys.com>
---
Alexey, could you reply with a Acked-by if you're fine with this?
Thanks!
---
 DEVELOPERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a9ed4d5360..409a0364c2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -125,6 +125,10 @@ N:	Alexandre Esse <alexandre.esse.dev@gmail.com>
 F:	package/kvazaar/
 F:	package/v4l2loopback/
 
+N:	Alexey Brodkin <alexey.brodkin@synopsys.com>
+F:	board/cubietech/cubieboard2/
+F:	configs/cubieboard2_defconfig
+
 N:	Alistair Francis <alistair@alistair23.me>
 F:	board/sifive/
 F:	boot/opensbi/
-- 
2.21.0
