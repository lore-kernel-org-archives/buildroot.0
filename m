From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jun 2016 13:09:09 +0200
Subject: [Buildroot] [PATCH 022/121] package/libump: add hash file
In-Reply-To: <cover.1466334225.git.yann.morin.1998@free.fr>
References: <cover.1466334225.git.yann.morin.1998@free.fr>
Message-ID: <8c16e73b8939d0893666f70d7e3d6c0841bd6545.1466334225.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/libump/libump.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libump/libump.hash

diff --git a/package/libump/libump.hash b/package/libump/libump.hash
new file mode 100644
index 0000000..4244e20
--- /dev/null
+++ b/package/libump/libump.hash
@@ -0,0 +1,2 @@
+# localy computed
+sha256  745bbb3e6a6b2b1d8caec75d2f2e884691ceefa5c2be0480baed31dba66cf450  libump-ec0680628744f30b8fac35e41a7bd8e23e59c39f.tar.gz
-- 
2.7.4
