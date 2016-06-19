From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jun 2016 13:10:04 +0200
Subject: [Buildroot] [PATCH 077/121] package/wvdial: add hash file
In-Reply-To: <cover.1466334225.git.yann.morin.1998@free.fr>
References: <cover.1466334225.git.yann.morin.1998@free.fr>
Message-ID: <0b3ad0ce0ec9da8d2308a12a6a387fd20929197f.1466334225.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/wvdial/wvdial.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/wvdial/wvdial.hash

diff --git a/package/wvdial/wvdial.hash b/package/wvdial/wvdial.hash
new file mode 100644
index 0000000..46da416
--- /dev/null
+++ b/package/wvdial/wvdial.hash
@@ -0,0 +1,2 @@
+# localy computed
+sha256  99906d9560cbdbc97e1855e7b0a7169f1e11983be3ac539140423f09debced82  wvdial-1.61.tar.bz2
-- 
2.7.4
