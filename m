From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Nov 2017 21:25:59 +0100
Subject: [Buildroot] [git commit] DEVELOPERS: adopt the packages I recently
 added
Message-ID: <20171127202227.2DC058079A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=95157daa8465312b70e1c633798bba8db5be5342
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7621f96..20fe702 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1743,8 +1743,11 @@ F:	package/fwup/
 
 N:	Yann E. MORIN <yann.morin.1998@free.fr>
 F:	fs/squashfs/
+F:	package/asterisk/
 F:	package/cegui06/
 F:	package/celt051/
+F:	package/dahdi-linux/
+F:	package/dahdi-tools/
 F:	package/dtc/
 F:	package/dtv-scan-tables/
 F:	package/dvb-apps/
@@ -1755,7 +1758,9 @@ F:	package/libedit/
 F:	package/libgsm/
 F:	package/libinput/
 F:	package/libiscsi/
+F:	package/libpri/
 F:	package/libseccomp/
+F:	package/libss7/
 F:	package/linux-tools/
 F:	package/mesa3d-headers/
 F:	package/nbd/
