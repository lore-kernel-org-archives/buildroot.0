From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 19:43:45 +0200
Subject: [Buildroot] [git commit] DEVELOPERS: fix after moving scripts to
	utils/ directory
Message-ID: <20170701174125.98CEB81911@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=27304521766dadae159a84b5121d4f714b9b7908
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There were still references to support/scripts/ for scripts that have
moved to the utils directory. There were also references that were
updated, but not re-updated when the tools moves to utils.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index cd726f5..c0e0d40 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -605,7 +605,7 @@ F:	package/qemu/
 F:	package/sdl2_mixer/
 F:	package/sdl2_net/
 F:	package/tekui/
-F:	support/scripts/scancpan
+F:	utils/scancpan
 
 N:	Frank Hunleth <fhunleth@troodon-software.com>
 F:	package/am335x-pru-package/
@@ -1391,8 +1391,8 @@ N:	Rhys Williams <github@wilberforce.co.nz>
 F:	package/lirc-tools/
 
 N:	Ricardo Martincoski <ricardo.martincoski@gmail.com>
-F:	tools/check-package
-F:	tools/checkpackagelib/
+F:	utils/check-package
+F:	utils/checkpackagelib/
 
 N:	Richard Braun <rbraun@sceen.net>
 F:	package/curlftpfs/
@@ -1631,7 +1631,7 @@ N:	Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 F:	docs/manual/
 F:	package/opkg-utils/
 F:	support/scripts/size-stats
-F:	support/scripts/size-stats-compare
+F:	utils/size-stats-compare
 F:	toolchain/
 
 N:	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
@@ -1835,7 +1835,7 @@ F:	package/ti-utils/
 F:	package/x11r7/xapp_xconsole/
 F:	package/x11r7/xapp_xinput-calibrator/
 F:	package/zlog/
-F:	support/scripts/scanpypi
+F:	utils/scanpypi
 
 N:	Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
 F:	package/crudini/
