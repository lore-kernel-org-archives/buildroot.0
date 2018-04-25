From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Apr 2018 23:34:18 +0200
Subject: [Buildroot] [git commit] squashfs: add license hash
Message-ID: <20180425213425.55FC788E0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10d4c1222ae99abf409a471b4649fdb1861bcf80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
