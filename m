From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jun 2016 13:10:02 +0200
Subject: [Buildroot] [PATCH 075/121] package/webkit: add hash file
In-Reply-To: <cover.1466334225.git.yann.morin.1998@free.fr>
References: <cover.1466334225.git.yann.morin.1998@free.fr>
Message-ID: <b164e77e8cd3382beccc13aa328b39bee068a41d.1466334225.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/webkit/webkit.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/webkit/webkit.hash

diff --git a/package/webkit/webkit.hash b/package/webkit/webkit.hash
new file mode 100644
index 0000000..e527373
--- /dev/null
+++ b/package/webkit/webkit.hash
@@ -0,0 +1,2 @@
+# localy computed
+sha256  51f808c96f52729dde6fb2b58752a6f623aeea74ff1ac6d4a1658720c6206fbe  webkitgtk-1.11.5.tar.xz
-- 
2.7.4
