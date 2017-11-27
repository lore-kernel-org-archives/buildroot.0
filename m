From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Nov 2017 14:30:49 +0100
Subject: [Buildroot] [PATCH 1/2] DEVELOPERS: adopt the packages I recently
 added
In-Reply-To: <cover.1511789437.git.yann.morin.1998@free.fr>
References: <cover.1511789437.git.yann.morin.1998@free.fr>
Message-ID: <09a4ad4329a8cef00f113036b131162cc10cb9a8.1511789437.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 DEVELOPERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7621f969a0..20fe70253d 100644
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
-- 
2.11.0
