From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jun 2016 16:33:34 +0200
Subject: [Buildroot] [PATCH 116/121] package/xinetd: add hash file
In-Reply-To: <cover.1466334225.git.yann.morin.1998@free.fr>
References: <cover.1466334225.git.yann.morin.1998@free.fr>
Message-ID: <9eab9283a32ff9a458ec6d7f03be72aa0d23c993.1466334225.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/xinetd/xinetd.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/xinetd/xinetd.hash

diff --git a/package/xinetd/xinetd.hash b/package/xinetd/xinetd.hash
new file mode 100644
index 0000000..c510d14
--- /dev/null
+++ b/package/xinetd/xinetd.hash
@@ -0,0 +1,2 @@
+# localy computed
+sha256  620b25f4ab4d72fdf32b13797156ea40df2049f1c07e640177e5fec544e9a94c  xinetd-xinetd-2-3-15.tar.gz
-- 
2.7.4
