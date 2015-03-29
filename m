From: Karoly Kasza <kaszak@gmail.com>
Date: Sun, 29 Mar 2015 15:16:50 +0200
Subject: [Buildroot] [PATCH] package/ccache: add hash file
Message-ID: <1427635010-14959-1-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---
 package/ccache/ccache.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/ccache/ccache.hash

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
new file mode 100644
index 0000000..10caac8
--- /dev/null
+++ b/package/ccache/ccache.hash
@@ -0,0 +1,2 @@
+# Verified key http://samba.org/ftp/ccache/ccache-3.1.11.tar.xz.asc - sha256 computed locally
+sha256	60e9f3f1e60f528cfce910f3224bcc698029320f6ab77ec09a7b46bda2bc678e	ccache-3.1.11.tar.xz
-- 
1.7.10.4
