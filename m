From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 12 Jun 2015 22:06:20 +0200
Subject: [Buildroot] [PATCH 1/6] package/libpthread-stubs: add hash file
Message-ID: <1434139585-19742-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/libpthread-stubs/libpthread-stubs.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libpthread-stubs/libpthread-stubs.hash

diff --git a/package/libpthread-stubs/libpthread-stubs.hash b/package/libpthread-stubs/libpthread-stubs.hash
new file mode 100644
index 0000000..8211455
--- /dev/null
+++ b/package/libpthread-stubs/libpthread-stubs.hash
@@ -0,0 +1,2 @@
+# From http://www.x.org/archive/current/src/everything/CHECKSUMS
+sha256 35b6d54e3cc6f3ba28061da81af64b9a92b7b757319098172488a660e3d87299 libpthread-stubs-0.3.tar.bz2
-- 
2.4.2
