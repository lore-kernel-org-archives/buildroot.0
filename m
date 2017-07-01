From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 1 Jul 2017 18:40:39 +0200
Subject: [Buildroot] [PATCH 1/3] DEVELOPERS: fix after moving scripts to
	utils/ directory
Message-ID: <20170701164041.5515-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There were still references to support/scripts/ for scripts that have
moved to the utils directory. There were also references that were
updated, but not re-updated when the tools moves to utils.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 DEVELOPERS | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index b02908ab1f..9539d3e8a1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -606,7 +606,7 @@ F:	package/qemu/
 F:	package/sdl2_mixer/
 F:	package/sdl2_net/
 F:	package/tekui/
-F:	support/scripts/scancpan
+F:	utils/scancpan
 
 N:	Frank Hunleth <fhunleth@troodon-software.com>
 F:	package/am335x-pru-package/
@@ -1392,8 +1392,8 @@ N:	Rhys Williams <github@wilberforce.co.nz>
 F:	package/lirc-tools/
 
 N:	Ricardo Martincoski <ricardo.martincoski@gmail.com>
-F:	tools/check-package
-F:	tools/checkpackagelib/
+F:	utils/check-package
+F:	utils/checkpackagelib/
 
 N:	Richard Braun <rbraun@sceen.net>
 F:	package/curlftpfs/
@@ -1632,7 +1632,7 @@ N:	Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 F:	docs/manual/
 F:	package/opkg-utils/
 F:	support/scripts/size-stats
-F:	support/scripts/size-stats-compare
+F:	utils/size-stats-compare
 F:	toolchain/
 
 N:	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
@@ -1836,7 +1836,7 @@ F:	package/ti-utils/
 F:	package/x11r7/xapp_xconsole/
 F:	package/x11r7/xapp_xinput-calibrator/
 F:	package/zlog/
-F:	support/scripts/scanpypi
+F:	utils/scanpypi
 
 N:	Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
 F:	package/crudini/
-- 
2.13.1
