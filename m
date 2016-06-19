From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jun 2016 16:33:37 +0200
Subject: [Buildroot] [PATCH 119/121] package/yaffs2utils: add hash file
In-Reply-To: <cover.1466334225.git.yann.morin.1998@free.fr>
References: <cover.1466334225.git.yann.morin.1998@free.fr>
Message-ID: <f5ac3d1e2caa5e5c1a7fda34156f8b305fef00fb.1466334225.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/yaffs2utils/yaffs2utils.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/yaffs2utils/yaffs2utils.hash

diff --git a/package/yaffs2utils/yaffs2utils.hash b/package/yaffs2utils/yaffs2utils.hash
new file mode 100644
index 0000000..84cab75
--- /dev/null
+++ b/package/yaffs2utils/yaffs2utils.hash
@@ -0,0 +1,2 @@
+# localy computed
+sha256  9b0912bf683eb839b6e57c9255c83894c3b700d16489a49d319c54c1abf8f6d7  0.2.9.tar.gz
-- 
2.7.4
