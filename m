From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jun 2016 13:09:52 +0200
Subject: [Buildroot] [PATCH 065/121] package/sqlcipher: add hash file
In-Reply-To: <cover.1466334225.git.yann.morin.1998@free.fr>
References: <cover.1466334225.git.yann.morin.1998@free.fr>
Message-ID: <d229ba21d7f3af86cf1ed8a6510dcd5f21c752a1.1466334225.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/sqlcipher/sqlcipher.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/sqlcipher/sqlcipher.hash

diff --git a/package/sqlcipher/sqlcipher.hash b/package/sqlcipher/sqlcipher.hash
new file mode 100644
index 0000000..b350085
--- /dev/null
+++ b/package/sqlcipher/sqlcipher.hash
@@ -0,0 +1,2 @@
+# localy computed
+sha256  25fa4f4cb38dcf9e52e4d1f46be8fee9c7aaef35b6df96912a216b289e22c2af  sqlcipher-v3.2.0.tar.gz
-- 
2.7.4
