From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jun 2016 13:09:06 +0200
Subject: [Buildroot] [PATCH 019/121] package/libglu: add hash file
In-Reply-To: <cover.1466334225.git.yann.morin.1998@free.fr>
References: <cover.1466334225.git.yann.morin.1998@free.fr>
Message-ID: <c1fa0c521fc9a4498bae7e9044268b670191013a.1466334225.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Peter, can you remove this from s.b.o, please?
    glu-9.0.0.tar.gz
---
 package/libglu/libglu.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libglu/libglu.hash

diff --git a/package/libglu/libglu.hash b/package/libglu/libglu.hash
new file mode 100644
index 0000000..5a1e8b0
--- /dev/null
+++ b/package/libglu/libglu.hash
@@ -0,0 +1,2 @@
+# localy computed
+sha256  3d19cca9b26ec4048dd22e3d294acd43e080a3205a29ff47765bd514571ea8f9  glu-9.0.0.tar.gz
-- 
2.7.4
