From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Apr 2016 15:06:13 +0200
Subject: [Buildroot] [git commit] binutils: remove 2.22 hash
Message-ID: <20160422130618.36A9D807DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0fb442c51d65b3cfa9effddc35ea19cd4d77e73e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 2f8459539401938a4ec4fe5f4a207c5d81f2cf74 ("binutils: remove
version 2.22"), binutils 2.22 was removed, but forgot to remove the
corresponding hash from the hash file.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/binutils.hash | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 387714d..916b68c 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -1,5 +1,4 @@
 # From ftp://gcc.gnu.org/pub/binutils/releases/sha512.sum
-sha512  ffe8ef263ef99183e8cc823fe8487ff7d0f7bf9a8efd2853b5f4636aca0023850d13de4eac7d77a5f69413d8a50e6f95bb14569be53df86c0bce38034525ab74  binutils-2.22.tar.bz2
 sha512  dec753bbba008f1526b89cf1bd85feba78f362f5333ffdf93953fd131eb755976dec82a0a4ba38c43d2434da007137780cfe674de5414be5cf7ce7fbc6af6d16  binutils-2.23.2.tar.bz2
 sha512  5ec95ad47d49b12c4558a8db0ca2109d3ee1955e3776057f3330c4506f8f4d1cf5e505fbf8a16b98403a0fcdeaaf986fe0a22be6456247dbdace63ce1f776b12  binutils-2.24.tar.bz2
 sha512  0b36dda0e6d32cd25613c0e64b56b28312515c54d6a159efd3db9a86717f114ab0a0a1f69d08975084d55713ebaeab64e4085c9b3d1c3fa86712869f80eb954d  binutils-2.25.1.tar.bz2
