From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jun 2016 13:09:50 +0200
Subject: [Buildroot] [PATCH 063/121] package/racehound: add hash file
In-Reply-To: <cover.1466334225.git.yann.morin.1998@free.fr>
References: <cover.1466334225.git.yann.morin.1998@free.fr>
Message-ID: <bcaef19b78beb8472539646aab1256eede25c67c.1466334225.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/racehound/racehound.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/racehound/racehound.hash

diff --git a/package/racehound/racehound.hash b/package/racehound/racehound.hash
new file mode 100644
index 0000000..996677b
--- /dev/null
+++ b/package/racehound/racehound.hash
@@ -0,0 +1,2 @@
+# localy computed
+sha256  935bc4a7c7b645dee5b905f6e97d0db3f0ac4f48e71d15f4e3982811017ac43c  racehound-f09f06fcc3c77c8c5541be3ba5be80aa8148ce0c.tar.gz
-- 
2.7.4
