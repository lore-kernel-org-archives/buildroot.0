From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jun 2016 13:08:52 +0200
Subject: [Buildroot] [PATCH 005/121] package/faifa: add hash file
In-Reply-To: <cover.1466334225.git.yann.morin.1998@free.fr>
References: <cover.1466334225.git.yann.morin.1998@free.fr>
Message-ID: <c3606c0f648ee6cd06e3338b3f49ce7b32a77c4d.1466334225.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/faifa/faifa.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/faifa/faifa.hash

diff --git a/package/faifa/faifa.hash b/package/faifa/faifa.hash
new file mode 100644
index 0000000..5f65fcf
--- /dev/null
+++ b/package/faifa/faifa.hash
@@ -0,0 +1,2 @@
+# localy computed
+sha256  6eada81f3d21f80b5848338b627784981064d728f8e377e5cf973d31640d4489  faifa-v0.1.tar.gz
-- 
2.7.4
