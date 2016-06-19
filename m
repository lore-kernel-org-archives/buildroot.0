From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jun 2016 13:09:05 +0200
Subject: [Buildroot] [PATCH 018/121] package/libcofi: add hash file
In-Reply-To: <cover.1466334225.git.yann.morin.1998@free.fr>
References: <cover.1466334225.git.yann.morin.1998@free.fr>
Message-ID: <7ecf59060165d753d031fc3a2d7be98cc5d3f571.1466334225.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Peter, can you remove this from s.b.o, please?
    libcofi-7313fbe12b0593034d0a1b606bf33c7cf4ababce.tar.gz
---
 package/libcofi/libcofi.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libcofi/libcofi.hash

diff --git a/package/libcofi/libcofi.hash b/package/libcofi/libcofi.hash
new file mode 100644
index 0000000..485b7bd
--- /dev/null
+++ b/package/libcofi/libcofi.hash
@@ -0,0 +1,2 @@
+# localy computed
+sha256  72ec89c19267612b316ec9c5835c07212b8f0a377c5b4c20b6e46e69a6e4a5e5  libcofi-7313fbe12b0593034d0a1b606bf33c7cf4ababce.tar.gz
-- 
2.7.4
