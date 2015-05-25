From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 25 May 2015 17:30:34 +0200
Subject: [Buildroot] [PATCH 1/5] package/udpcast: add hash file
Message-ID: <1432567838-2948-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/udpcast/udpcast.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/udpcast/udpcast.hash

diff --git a/package/udpcast/udpcast.hash b/package/udpcast/udpcast.hash
new file mode 100644
index 0000000..133e1db
--- /dev/null
+++ b/package/udpcast/udpcast.hash
@@ -0,0 +1,2 @@
+# locally computed hash
+sha256 ce9090ef80b6035a744a9b5ac335e61c99baa92c39ff53277266fbfcb836445a udpcast-20120424.tar.gz
-- 
2.4.1
