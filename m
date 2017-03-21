From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 21 Mar 2017 01:07:01 +0100
Subject: [Buildroot] [PATCH 05/16] squashfs: correct hash
In-Reply-To: <20170321000712.26500-1-arnout@mind.be>
References: <20170321000712.26500-1-arnout@mind.be>
Message-ID: <20170321000712.26500-6-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When squashfs was bumped to 3de1687d in commit ee90313c64, the hash
file was not updated. This wasn't noticed before since hashes are not
checked for git downloads.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/squashfs/squashfs.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/squashfs/squashfs.hash b/package/squashfs/squashfs.hash
index eb456be364..74fdb44354 100644
--- a/package/squashfs/squashfs.hash
+++ b/package/squashfs/squashfs.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	e807202ab4dcfeea214df49d3a728b9a85644a7e7262fc6fcd875a0def99d4ed	squashfs-9c1db6d13a51a2e009f0027ef336ce03624eac0d.tar.gz
+sha256	2c49392816615b73bf5d6cdce9776cb66a01f5a1494b1d9af580667e32bab001  squashfs-3de1687d7432ea9b302c2db9521996f506c140a3.tar.gz
-- 
2.11.0
