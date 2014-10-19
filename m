From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 17:34:22 +0200
Subject: [Buildroot] [git commit] zlib: add hash file
Message-ID: <20141019153637.38AC3AF9BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6c9ed1e3bc3b89ce92fc4a7942d168e4f5a84b24
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zlib/zlib.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/zlib/zlib.hash b/package/zlib/zlib.hash
new file mode 100644
index 0000000..d6382f8
--- /dev/null
+++ b/package/zlib/zlib.hash
@@ -0,0 +1,2 @@
+# From http://www.zlib.net/
+md5	28f1205d8dd2001f26fec1e8c2cebe37	zlib-1.2.8.tar.xz
