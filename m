From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 May 2018 23:02:01 +0200
Subject: [Buildroot] [git commit] libiscsi: add hash for license files
Message-ID: <20180501210207.5B66F81139@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e711623912d0db2866a60e9daf6dbe89959de574
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libiscsi/libiscsi.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libiscsi/libiscsi.hash b/package/libiscsi/libiscsi.hash
index 4f7d1af50e..0688f2dd2f 100644
--- a/package/libiscsi/libiscsi.hash
+++ b/package/libiscsi/libiscsi.hash
@@ -1,2 +1,5 @@
 # Locally computed:
 sha256 464d104e12533dc11f0dd7662cbc2f01c132f94aa4f5bd519e3413ef485830e8  libiscsi-1.18.0.tar.gz
+sha256 88e3eccc48722b2a0eaff456dda94b8e8e123848d01f631969bec8e3c6c6eb85  COPYING
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENCE-GPL-2.txt
+sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENCE-LGPL-2.1.txt
