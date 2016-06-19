From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jun 2016 13:09:45 +0200
Subject: [Buildroot] [PATCH 058/121] package/python-simplejson: add hash file
In-Reply-To: <cover.1466334225.git.yann.morin.1998@free.fr>
References: <cover.1466334225.git.yann.morin.1998@free.fr>
Message-ID: <6c1f4b8fcacafcdd424f1b2b1ec0c5542529276d.1466334225.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/python-simplejson/python-simplejson.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/python-simplejson/python-simplejson.hash

diff --git a/package/python-simplejson/python-simplejson.hash b/package/python-simplejson/python-simplejson.hash
new file mode 100644
index 0000000..63d662f
--- /dev/null
+++ b/package/python-simplejson/python-simplejson.hash
@@ -0,0 +1,2 @@
+# localy computed
+sha256  a80dc90320e1c1b8eaceaaa755ae2aed382d64a59321ae9f6ddbe0321c02878a  simplejson-3.5.3.tar.gz
-- 
2.7.4
