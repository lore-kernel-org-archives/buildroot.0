From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jun 2016 13:09:07 +0200
Subject: [Buildroot] [PATCH 020/121] package/libhid: add hash file
In-Reply-To: <cover.1466334225.git.yann.morin.1998@free.fr>
References: <cover.1466334225.git.yann.morin.1998@free.fr>
Message-ID: <842f6c2063a9b98503c444f456b27ce64df02a4c.1466334225.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/libhid/libhid.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libhid/libhid.hash

diff --git a/package/libhid/libhid.hash b/package/libhid/libhid.hash
new file mode 100644
index 0000000..67a31ec
--- /dev/null
+++ b/package/libhid/libhid.hash
@@ -0,0 +1,2 @@
+# localy computed
+sha256  f6809ab3b9c907cbb05ceba9ee6ca23a705f85fd71588518e14b3a7d9f2550e5  libhid-0.2.16.tar.gz
-- 
2.7.4
