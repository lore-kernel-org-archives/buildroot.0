From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 13 Jan 2015 19:37:30 -0300
Subject: [Buildroot] [PATCH 1/2] mysql: add hash
Message-ID: <1421188651-4424-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mysql/mysql.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/mysql/mysql.hash

diff --git a/package/mysql/mysql.hash b/package/mysql/mysql.hash
new file mode 100644
index 0000000..84f3361
--- /dev/null
+++ b/package/mysql/mysql.hash
@@ -0,0 +1,2 @@
+# From https://downloads.mariadb.com/archives/mysql-5.1/mysql-5.1.73.tar.gz.md5
+md5	887f869bcc757957067b9198f707f32f	mysql-5.1.73.tar.gz
-- 
2.0.5
