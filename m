From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jun 2016 16:33:35 +0200
Subject: [Buildroot] [PATCH 117/121] package/xl2tp: add hash file
In-Reply-To: <cover.1466334225.git.yann.morin.1998@free.fr>
References: <cover.1466334225.git.yann.morin.1998@free.fr>
Message-ID: <0c7ebc4c85548c7e52ee8e19191dd35dadc41fa2.1466334225.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Peter, can you remove this from s.b.o, please?
    xl2tp-v1.3.6.tar.gz
---
 package/xl2tp/xl2tp.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/xl2tp/xl2tp.hash

diff --git a/package/xl2tp/xl2tp.hash b/package/xl2tp/xl2tp.hash
new file mode 100644
index 0000000..67cdf9b
--- /dev/null
+++ b/package/xl2tp/xl2tp.hash
@@ -0,0 +1,2 @@
+# localy computed
+sha256  49b069aa8d873e1d8f615ccc4212351e427bf681ba453fdd211256a8345bb7fb  xl2tp-v1.3.6.tar.gz
-- 
2.7.4
