From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 22:05:41 +0200
Subject: [Buildroot] [git commit] DEVELOPERS: add Alexey Brodkin as contact
 for cubieboard2_defconfig
Message-ID: <20190811200319.54346835D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43cc954a6184f632221e2f99fe0ed7938de3fc21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Alexey was the last person to make significant changes to this
defconfig, so let's add him as a contact for the maintenance of this
defconfig.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Alexey Brodkin <alexey.brodkin@synopsys.com>
Acked-by: Alexey Brodkin <abrodkin@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 58415c1464..876c81d9f9 100644
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
