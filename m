From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jun 2016 13:08:59 +0200
Subject: [Buildroot] [PATCH 012/121] package/ipkg: add hash file
In-Reply-To: <cover.1466334225.git.yann.morin.1998@free.fr>
References: <cover.1466334225.git.yann.morin.1998@free.fr>
Message-ID: <bd0c3ce0cb6805052ab3c9ae11422fcdbd5c88d9.1466334225.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/ipkg/ipkg.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/ipkg/ipkg.hash

diff --git a/package/ipkg/ipkg.hash b/package/ipkg/ipkg.hash
new file mode 100644
index 0000000..f04e7d6
--- /dev/null
+++ b/package/ipkg/ipkg.hash
@@ -0,0 +1,2 @@
+# localy computed
+sha256  405743e1ba320ed6095d42a898f1486e3af1d745cae2bd45dfe1d8403a4d8995  ipkg-0.99.163.tar.gz
-- 
2.7.4
