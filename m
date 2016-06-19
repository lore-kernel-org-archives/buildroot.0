From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jun 2016 13:08:51 +0200
Subject: [Buildroot] [PATCH 004/121] package/evtest: add hash file
In-Reply-To: <cover.1466334225.git.yann.morin.1998@free.fr>
References: <cover.1466334225.git.yann.morin.1998@free.fr>
Message-ID: <026fccdec126483fa77abbe75f0f73a055d5df92.1466334225.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/evtest/evtest.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/evtest/evtest.hash

diff --git a/package/evtest/evtest.hash b/package/evtest/evtest.hash
new file mode 100644
index 0000000..1604d1b
--- /dev/null
+++ b/package/evtest/evtest.hash
@@ -0,0 +1,2 @@
+# localy computed
+sha256  9fb68236a6871c163e52433ba8f2cce142c0f4208163a2962768c13f262d549f  evtest-1.33.tar.gz
-- 
2.7.4
