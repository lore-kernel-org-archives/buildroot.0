From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 22 Jan 2020 09:16:49 +0100
Subject: [Buildroot] [PATCH 17/26] package/curlftpfs: add hash for license
 file
In-Reply-To: <20200122081657.31817-1-heiko.thiery@gmail.com>
References: <20200122081657.31817-1-heiko.thiery@gmail.com>
Message-ID: <20200122081657.31817-18-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/curlftpfs/curlftpfs.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/curlftpfs/curlftpfs.hash b/package/curlftpfs/curlftpfs.hash
index a94fab1239..8413c1e102 100644
--- a/package/curlftpfs/curlftpfs.hash
+++ b/package/curlftpfs/curlftpfs.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  4eb44739c7078ba0edde177bdd266c4cfb7c621075f47f64c85a06b12b3c6958  curlftpfs-0.9.2.tar.gz
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
-- 
2.20.1
