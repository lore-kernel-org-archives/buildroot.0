From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 May 2019 15:03:56 +0200
Subject: [Buildroot] [git commit] linux/linux.hash: fix typo in 5.1.4 entry
Message-ID: <20190525125914.84E2381393@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ffab91d336966a48c2a22e338f8c239afbe9fd6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index a04fb742c2..0a17592799 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256 5c6d65faba54652b3ab4cfcb2f3be88d53478a2cd24d0f1cdd9344c7aad1e7f9  linux-5.1.4.tar.x
+sha256 5c6d65faba54652b3ab4cfcb2f3be88d53478a2cd24d0f1cdd9344c7aad1e7f9  linux-5.1.4.tar.xz
 sha256 7fbd0b3d90a7a28a013f1e3f006c02235c12b41fd020460722a0b7c9936db0d8  linux-5.0.18.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 eb31e62fbb30aaeedb892cecdd8ac9746d42cbbef2ef2356f9ca8e13514b9d2b  linux-4.19.45.tar.xz
