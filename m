From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jun 2016 16:33:36 +0200
Subject: [Buildroot] [PATCH 118/121] package/xxhash: add hash file
In-Reply-To: <cover.1466334225.git.yann.morin.1998@free.fr>
References: <cover.1466334225.git.yann.morin.1998@free.fr>
Message-ID: <4cd30995ef0843b0ab56d1ec559508cb87af5835.1466334225.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/xxhash/xxhash.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/xxhash/xxhash.hash

diff --git a/package/xxhash/xxhash.hash b/package/xxhash/xxhash.hash
new file mode 100644
index 0000000..78dd5ef
--- /dev/null
+++ b/package/xxhash/xxhash.hash
@@ -0,0 +1,2 @@
+# localy computed
+sha256  9743539ed787ea9bd5bb348265cebdd5adcbf820ad329bf44c28bc69ab4c7cd8  xxhash-r40.tar.gz
-- 
2.7.4
