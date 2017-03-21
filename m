From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Mar 2017 23:17:03 +0100
Subject: [Buildroot] [git commit] squashfs: correct hash
Message-ID: <20170321221730.395E7819D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=85c832247e40f00f48ac328970bb39ab7851f042
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When squashfs was bumped to 3de1687d in commit ee90313c64, the hash
file was not updated. This wasn't noticed before since hashes are not
checked for git downloads.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/squashfs/squashfs.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/squashfs/squashfs.hash b/package/squashfs/squashfs.hash
index eb456be..74fdb44 100644
--- a/package/squashfs/squashfs.hash
+++ b/package/squashfs/squashfs.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	e807202ab4dcfeea214df49d3a728b9a85644a7e7262fc6fcd875a0def99d4ed	squashfs-9c1db6d13a51a2e009f0027ef336ce03624eac0d.tar.gz
+sha256	2c49392816615b73bf5d6cdce9776cb66a01f5a1494b1d9af580667e32bab001  squashfs-3de1687d7432ea9b302c2db9521996f506c140a3.tar.gz
