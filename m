From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit.thebaudeau.dev@gmail.com>
Date: Mon, 30 Mar 2015 22:35:33 +0200
Subject: [Buildroot] [PATCH] logrotate: add hash file
Message-ID: <1427747733-8541-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau.dev@gmail.com>
---
 package/logrotate/logrotate.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/logrotate/logrotate.hash

diff --git a/package/logrotate/logrotate.hash b/package/logrotate/logrotate.hash
new file mode 100644
index 0000000..8413081
--- /dev/null
+++ b/package/logrotate/logrotate.hash
@@ -0,0 +1,2 @@
+# No upstream hashes for the following:
+sha512 342533f321a1d77c0ca389fd0a393377ba73f10654aae163cbd35f8d5df25673f1aa6e44d0af42be5419d152a7dae11024d9005076bce0a3b3dad1f0e12b9c0d logrotate-3.8.9.tar.gz
-- 
2.1.0
