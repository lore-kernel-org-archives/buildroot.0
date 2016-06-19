From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jun 2016 13:09:58 +0200
Subject: [Buildroot] [PATCH 071/121] package/tidsp-binaries: add hash file
In-Reply-To: <cover.1466334225.git.yann.morin.1998@free.fr>
References: <cover.1466334225.git.yann.morin.1998@free.fr>
Message-ID: <6b25a5aaf665b0da326043a834f8bd3b958c437f.1466334225.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/tidsp-binaries/tidsp-binaries.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/tidsp-binaries/tidsp-binaries.hash

diff --git a/package/tidsp-binaries/tidsp-binaries.hash b/package/tidsp-binaries/tidsp-binaries.hash
new file mode 100644
index 0000000..513b2b2
--- /dev/null
+++ b/package/tidsp-binaries/tidsp-binaries.hash
@@ -0,0 +1,2 @@
+# localy computed
+sha256  c56e5edd53c921768a033906426329279ca8ae6537c5d735c42b948e9778b05c  tidsp-binaries-23.i3.8.tar.gz
-- 
2.7.4
