From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 14:07:32 +0200
Subject: [Buildroot] =?utf-8?q?=5BPATCH=5D_DEVELOPERS=3A_add_Fran=C3=A7oi?=
 =?utf-8?q?s_Perrad_as_contact_for_olimex=5Fimx233=5Folinuxino=5Fdefconfig?=
Message-ID: <20190811120739.26539-11-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois has regularly updated this defconfig in the last few years,
so it makes sense to have him as a contact for it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Francois Perrad <francois.perrad@gadz.org>
---
Fran?ois, could you reply with an Acked-by, if you're fine with this?
Thanks!
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0025412be4..8fbb8abad3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -880,7 +880,9 @@ F:	package/ser2net/
 
 N:	Francois Perrad <francois.perrad@gadz.org>
 F:	board/olimex/a20_olinuxino
+F:	board/olimex/imx233_olinuxino/
 F:	configs/olimex_a20_olinuxino_*
+F:	configs/olimex_imx233_olinuxino_defconfig
 F:	package/4th/
 F:	package/chipmunk/
 F:	package/cog/
-- 
2.21.0
