From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 29 Apr 2018 14:37:25 +0200
Subject: [Buildroot] [PATCH 1/1] libdcadec: add hash for license file
Message-ID: <20180429123725.21927-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libdcadec/libdcadec.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libdcadec/libdcadec.hash b/package/libdcadec/libdcadec.hash
index dda58d1065..e2b68cd70f 100644
--- a/package/libdcadec/libdcadec.hash
+++ b/package/libdcadec/libdcadec.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256	ed9d207fde3e8d576f3af8b0d1235b3371e315175757173689104efcaebf0d44	libdcadec-v0.2.0.tar.gz
+sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING.LGPLv2.1
-- 
2.14.1
