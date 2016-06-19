From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jun 2016 16:33:39 +0200
Subject: [Buildroot] [PATCH 121/121] package/ympd: add hash file
In-Reply-To: <cover.1466334225.git.yann.morin.1998@free.fr>
References: <cover.1466334225.git.yann.morin.1998@free.fr>
Message-ID: <df8b229ce88812d9c28d1d61bc0c34ef044e479f.1466334225.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/ympd/ympd.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/ympd/ympd.hash

diff --git a/package/ympd/ympd.hash b/package/ympd/ympd.hash
new file mode 100644
index 0000000..7bf3164
--- /dev/null
+++ b/package/ympd/ympd.hash
@@ -0,0 +1,2 @@
+# localy computed
+sha256  092c26c51166d1d1f025cd06742981783dea7e42bfe4f73f10c4418fc003de94  ympd-v1.2.3.tar.gz
-- 
2.7.4
