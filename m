From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jun 2016 13:10:01 +0200
Subject: [Buildroot] [PATCH 074/121] package/tzdump: add hash file
In-Reply-To: <cover.1466334225.git.yann.morin.1998@free.fr>
References: <cover.1466334225.git.yann.morin.1998@free.fr>
Message-ID: <0b15f5c9e1eb1324c95109e8de881aa8f4645cce.1466334225.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/tzdump/tzdump.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/tzdump/tzdump.hash

diff --git a/package/tzdump/tzdump.hash b/package/tzdump/tzdump.hash
new file mode 100644
index 0000000..564adc8
--- /dev/null
+++ b/package/tzdump/tzdump.hash
@@ -0,0 +1,2 @@
+# localy computed
+sha256  403f22f9c3007a051f9dbccff48b396b8e04eb1afcc8d779e6b3d9b6d971e1fe  tzdump-65a10105564801094b18c3fcacf4dde4c44e4ab8.tar.gz
-- 
2.7.4
