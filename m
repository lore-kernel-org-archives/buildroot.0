From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun,  7 Jun 2015 11:37:14 +0200
Subject: [Buildroot] [PATCH 1/6] package/libdaemon: add hash file
Message-ID: <1433669839-21599-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/libdaemon/libdaemon.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libdaemon/libdaemon.hash

diff --git a/package/libdaemon/libdaemon.hash b/package/libdaemon/libdaemon.hash
new file mode 100644
index 0000000..8dbbb5a
--- /dev/null
+++ b/package/libdaemon/libdaemon.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 fd23eb5f6f986dcc7e708307355ba3289abe03cc381fc47a80bca4a50aa6b834 libdaemon-0.14.tar.gz
-- 
2.4.2
