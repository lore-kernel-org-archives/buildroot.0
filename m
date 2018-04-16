From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 16 Apr 2018 21:39:48 +0200
Subject: [Buildroot] [PATCH v3 1/6] squashfs: add license hash
Message-ID: <20180416193953.19924-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v2 -> v3:
  - new patch
---
 package/squashfs/squashfs.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/squashfs/squashfs.hash b/package/squashfs/squashfs.hash
index 82a650022c..4464e62c02 100644
--- a/package/squashfs/squashfs.hash
+++ b/package/squashfs/squashfs.hash
@@ -1,2 +1,5 @@
 # Locally computed
 sha256 bd0aa3011320b8ebee68aa406060de277bef16daf81bad5b9f70cbea6db1a779 squashfs-e38956b92f738518c29734399629e7cdb33072d3.tar.gz
+
+# License files
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
-- 
2.16.3
