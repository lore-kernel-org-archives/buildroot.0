From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 13 Jan 2015 19:37:31 -0300
Subject: [Buildroot] [PATCH 2/2] postgresql: add hash
In-Reply-To: <1421188651-4424-1-git-send-email-gustavo@zacarias.com.ar>
References: <1421188651-4424-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1421188651-4424-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/postgresql/postgresql.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/postgresql/postgresql.hash

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
new file mode 100644
index 0000000..834eb30
--- /dev/null
+++ b/package/postgresql/postgresql.hash
@@ -0,0 +1,2 @@
+# From https://ftp.postgresql.org/pub/source/v9.4.0/postgresql-9.4.0.tar.bz2.sha256
+sha256	7a35c3cb77532f7b15702e474d7ef02f0f419527ee80a4ca6036fffb551625a5	postgresql-9.4.0.tar.bz2
-- 
2.0.5
