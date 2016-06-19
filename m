From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jun 2016 13:09:29 +0200
Subject: [Buildroot] [PATCH 042/121] package/python-libconfig: add hash file
In-Reply-To: <cover.1466334225.git.yann.morin.1998@free.fr>
References: <cover.1466334225.git.yann.morin.1998@free.fr>
Message-ID: <b12b5766863703e2d39dd91022d844facc15a6fc.1466334225.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Peter, can you remove this from s.b.o, please?
    python-libconfig-b271c3d9dac938ad5cd29b67bd08cc5536a5a391.tar.gz
---
 package/python-libconfig/python-libconfig.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/python-libconfig/python-libconfig.hash

diff --git a/package/python-libconfig/python-libconfig.hash b/package/python-libconfig/python-libconfig.hash
new file mode 100644
index 0000000..16bf79f
--- /dev/null
+++ b/package/python-libconfig/python-libconfig.hash
@@ -0,0 +1,2 @@
+# localy computed
+sha256  f4cfb7e60b8fcee32ca3392c99932c579038db0852c1c2c42d7c4b859eea3c5c  python-libconfig-b271c3d9dac938ad5cd29b67bd08cc5536a5a391.tar.gz
-- 
2.7.4
