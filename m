From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jun 2016 13:09:39 +0200
Subject: [Buildroot] [PATCH 052/121] package/python-pysnmp: add hash file
In-Reply-To: <cover.1466334225.git.yann.morin.1998@free.fr>
References: <cover.1466334225.git.yann.morin.1998@free.fr>
Message-ID: <12bffec4be240f0b098cfb1ff2492ff5a2e2ebf4.1466334225.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/python-pysnmp/python-pysnmp.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/python-pysnmp/python-pysnmp.hash

diff --git a/package/python-pysnmp/python-pysnmp.hash b/package/python-pysnmp/python-pysnmp.hash
new file mode 100644
index 0000000..67ab160
--- /dev/null
+++ b/package/python-pysnmp/python-pysnmp.hash
@@ -0,0 +1,2 @@
+# localy computed
+sha256  c5d78273f14afc6401b7456f086e7b56baaaa51fa0c39830d159bed611c9d89d  pysnmp-4.2.4.tar.gz
-- 
2.7.4
