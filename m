From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun,  7 Jun 2015 11:37:19 +0200
Subject: [Buildroot] [PATCH 6/6] package/xfsprogs: add hash file
In-Reply-To: <1433669839-21599-1-git-send-email-fabio.porcedda@gmail.com>
References: <1433669839-21599-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1433669839-21599-6-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/xfsprogs/xfsprogs.hash | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 package/xfsprogs/xfsprogs.hash

diff --git a/package/xfsprogs/xfsprogs.hash b/package/xfsprogs/xfsprogs.hash
new file mode 100644
index 0000000..3fb02df
--- /dev/null
+++ b/package/xfsprogs/xfsprogs.hash
@@ -0,0 +1,3 @@
+# Locally calculated after checking pgp signature:
+#   ftp://oss.sgi.com/projects/xfs/cmd_tars/xfsprogs-3.1.11.tar.gz.sig
+sha256 adf4980177b5c890c1ca86b9c0e3e4d69a3f95bfc01746844280c2393cf4d6be xfsprogs-3.1.11.tar.gz
-- 
2.4.2
