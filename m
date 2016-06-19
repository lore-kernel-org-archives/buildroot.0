From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jun 2016 13:09:17 +0200
Subject: [Buildroot] [PATCH 030/121] package/openvmtools: add hash file
In-Reply-To: <cover.1466334225.git.yann.morin.1998@free.fr>
References: <cover.1466334225.git.yann.morin.1998@free.fr>
Message-ID: <37c2fc406c2fc118231992ef7d9757dc3b6de3a0.1466334225.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/openvmtools/openvmtools.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/openvmtools/openvmtools.hash

diff --git a/package/openvmtools/openvmtools.hash b/package/openvmtools/openvmtools.hash
new file mode 100644
index 0000000..7144d0b
--- /dev/null
+++ b/package/openvmtools/openvmtools.hash
@@ -0,0 +1,2 @@
+# localy computed
+sha256  6b415f6093a15ffce10d3c4b69aa7ff106bdc0efd88e18a70a59d6941d4d2379  openvmtools-stable-9.10.2.tar.gz
-- 
2.7.4
