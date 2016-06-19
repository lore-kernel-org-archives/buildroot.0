From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jun 2016 13:09:49 +0200
Subject: [Buildroot] [PATCH 062/121] package/qtuio: add hash file
In-Reply-To: <cover.1466334225.git.yann.morin.1998@free.fr>
References: <cover.1466334225.git.yann.morin.1998@free.fr>
Message-ID: <6b9dda6f4d259212f0e764ccbb92d1fb9d898aa1.1466334225.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Peter, can you remove this from s.b.o, please?
    qtuio-abe4973ff60654aad9df7037c4ca15c45f811d24.tar.gz
---
 package/qtuio/qtuio.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/qtuio/qtuio.hash

diff --git a/package/qtuio/qtuio.hash b/package/qtuio/qtuio.hash
new file mode 100644
index 0000000..669ce65
--- /dev/null
+++ b/package/qtuio/qtuio.hash
@@ -0,0 +1,2 @@
+# localy computed
+sha256  65308adb59e910d552d4885772c7f99c7d19dec5e924d852a5a39a1972f8d223  qtuio-abe4973ff60654aad9df7037c4ca15c45f811d24.tar.gz
-- 
2.7.4
