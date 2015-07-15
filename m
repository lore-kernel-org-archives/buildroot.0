From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jul 2015 15:28:26 -0300
Subject: [Buildroot] [PATCH 35/40] gesftpserver: add hash file
In-Reply-To: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436984911-17680-35-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gesftpserver/gesftpserver.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/gesftpserver/gesftpserver.hash

diff --git a/package/gesftpserver/gesftpserver.hash b/package/gesftpserver/gesftpserver.hash
new file mode 100644
index 0000000..b952cf0
--- /dev/null
+++ b/package/gesftpserver/gesftpserver.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	1db183e2d4cca5cc3ef10526f417ddef28e0402d0119030a06227bf925e63872	sftpserver-0.1.tar.gz
-- 
2.3.6
