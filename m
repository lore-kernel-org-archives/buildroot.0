From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jun 2016 13:09:48 +0200
Subject: [Buildroot] [PATCH 061/121] package/qjson: add hash file
In-Reply-To: <cover.1466334225.git.yann.morin.1998@free.fr>
References: <cover.1466334225.git.yann.morin.1998@free.fr>
Message-ID: <eccb9c0627bb2dc14ce97f07d65f905b2cbd4447.1466334225.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qjson/qjson.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/qjson/qjson.hash

diff --git a/package/qjson/qjson.hash b/package/qjson/qjson.hash
new file mode 100644
index 0000000..5339a7d
--- /dev/null
+++ b/package/qjson/qjson.hash
@@ -0,0 +1,2 @@
+# localy computed
+sha256  863f0dd6b7199f84acf1e2487735830fab316a9a3a5e1651130ad153a231f2ed  qjson-ba273682a9d33a7b3090e74f4742b5f3bf6c9b02.tar.gz
-- 
2.7.4
