From: Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Fri, 20 Sep 2019 12:43:45 +0000
Subject: [Buildroot] [PATCH 9/9] package/xinetd: add missing hash for
 COPYRIGHT file
In-Reply-To: <20190920124242.22479-1-nicolas.carrier@orolia.com>
References: <20190920124242.22479-1-nicolas.carrier@orolia.com>
Message-ID: <20190920124242.22479-10-nicolas.carrier@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
---
 package/xinetd/xinetd.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/xinetd/xinetd.hash b/package/xinetd/xinetd.hash
index d02d6d3a50..1b7ee09b09 100644
--- a/package/xinetd/xinetd.hash
+++ b/package/xinetd/xinetd.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  620b25f4ab4d72fdf32b13797156ea40df2049f1c07e640177e5fec544e9a94c  xinetd-2-3-15.tar.gz
+sha256  2f3dd19831b1837f7360f80a7700a130c04a59e387d4359299d6df712308bbed  COPYRIGHT
-- 
2.20.1
