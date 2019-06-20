From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Jun 2019 21:27:20 +0200
Subject: [Buildroot] [git commit] arch/Config.in.nds32: force syntax
 colouring to kconfig
Message-ID: <20190620192639.E6C5F814DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=faa13ee58099d0dbebf24cd545a416f22e1e87b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It is too sad when an editor picks up the wrong syntax...

Like was done in e837837791 for all the other archs, force
syntax to kconfig for nds32 too.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Nylon Chen <nylon7@andestech.com>
Reviewed-by:Nylon Chen <nylon7@andestech.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.nds32 | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/Config.in.nds32 b/arch/Config.in.nds32
index f268883662..322ff49f2e 100644
--- a/arch/Config.in.nds32
+++ b/arch/Config.in.nds32
@@ -9,3 +9,6 @@ config BR2_ENDIAN
 
 config BR2_READELF_ARCH_NAME
 	default "Andes Technology compact code size embedded RISC processor family"
+
+# vim: ft=kconfig
+# -*- mode:kconfig; -*-
