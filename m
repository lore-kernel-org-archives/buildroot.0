From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jun 2016 13:09:13 +0200
Subject: [Buildroot] [PATCH 026/121] package/mxs-bootlets: add hash file
In-Reply-To: <cover.1466334225.git.yann.morin.1998@free.fr>
References: <cover.1466334225.git.yann.morin.1998@free.fr>
Message-ID: <7e2a4b8328be7b5a7c9a073f5b16cc9d92fba5ee.1466334225.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 boot/mxs-bootlets/mxs-bootlets.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 boot/mxs-bootlets/mxs-bootlets.hash

diff --git a/boot/mxs-bootlets/mxs-bootlets.hash b/boot/mxs-bootlets/mxs-bootlets.hash
new file mode 100644
index 0000000..57aec81
--- /dev/null
+++ b/boot/mxs-bootlets/mxs-bootlets.hash
@@ -0,0 +1,2 @@
+# localy computed
+sha256  63f6068ae36884adef4259bbb1fe2591755718f22c46d0a59d854883dfab1ffc  imx-bootlets-src-10.12.01.tar.gz
-- 
2.7.4
