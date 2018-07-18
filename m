From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Wed, 18 Jul 2018 12:39:59 +0200
Subject: [Buildroot] =?utf-8?q?=5BPATCH_1/2=5D_DEVELOPERS=3A_remove_some_?=
 =?utf-8?q?packages_from_J=C3=B6rg_Krause?=
Message-ID: <20180718104000.5384-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove the following packages from myself:
* bctoolbox
* libshout
* mp4v2

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4c2d1f291f..115cc57b2d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1034,14 +1034,11 @@ N:	J?rg Krause <joerg.krause@embedded.rocks>
 F:	board/lemaker/bananapro/
 F:	configs/bananapro_defconfig
 F:	package/augeas/
-F:	package/bctoolbox/
 F:	package/freescale-imx/imx-alsa-plugins/
 F:	package/libopusenc/
-F:	package/libshout/
 F:	package/libupnpp/
 F:	package/luv/
 F:	package/luvi/
-F:	package/mp4v2/
 F:	package/mpd/
 F:	package/shairport-sync/
 F:	package/swupdate/
-- 
2.18.0
