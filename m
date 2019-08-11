From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 14:07:31 +0200
Subject: [Buildroot] [PATCH] DEVELOPERS: add Gerome Burlats as contact for
 Qemu defconfigs
Message-ID: <20190811120739.26539-10-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gerome Burlats recently took care of the Qemu defconfigs, so it makes
sense to list him as a contact for the maintenance of these
defconfigs.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Gerome Burlats <gerome.burlats@smile.fr>
Cc: Romain Naour <romain.naour@smile.fr>
---
Gerome, could you reply with an Acked-by, if you're fine with this?
Thanks!
---
 DEVELOPERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8c05366630..0025412be4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -945,6 +945,10 @@ N:	Geoffrey Ragot <geoffreyragot@gmail.com>
 F:	package/python-pycli/
 F:	package/python-pyyaml/
 
+N:	Gerome Burlats <gerome.burlats@smile.fr>
+F:	board/qemu/
+F:	configs/qemu_*
+
 N:	Gilles Talis <gilles.talis@gmail.com>
 F:	board/freescale/imx8mmevk/
 F:	configs/freescale_imx8mmevk_defconfig
-- 
2.21.0
