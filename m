From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jun 2016 13:09:53 +0200
Subject: [Buildroot] [PATCH 066/121] package/sunxi-boards: add hash file
In-Reply-To: <cover.1466334225.git.yann.morin.1998@free.fr>
References: <cover.1466334225.git.yann.morin.1998@free.fr>
Message-ID: <1a1536314676553f6588b6243dad68b717dd4c33.1466334225.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/sunxi-boards/sunxi-boards.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/sunxi-boards/sunxi-boards.hash

diff --git a/package/sunxi-boards/sunxi-boards.hash b/package/sunxi-boards/sunxi-boards.hash
new file mode 100644
index 0000000..0843bb2
--- /dev/null
+++ b/package/sunxi-boards/sunxi-boards.hash
@@ -0,0 +1,2 @@
+# localy computed
+sha256  ff1fa509fd5716d26c23a82e59300876a848122f745713a610f8f3c47d448064  sunxi-boards-a6a4e94066f4ec6b26fc7060dc453a6bcf26a504.tar.gz
-- 
2.7.4
