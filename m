From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jul 2015 15:28:23 -0300
Subject: [Buildroot] [PATCH 32/40] jasper: add hash file
In-Reply-To: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436984911-17680-32-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/jasper/jasper.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/jasper/jasper.hash

diff --git a/package/jasper/jasper.hash b/package/jasper/jasper.hash
new file mode 100644
index 0000000..4d9ed74
--- /dev/null
+++ b/package/jasper/jasper.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	6e9a959bf4f8cb02f77f42d1b9880b8e85d021ac51f43d8787b5438fd2b7a1c5	jasper-1.900.1.tar.bz2
-- 
2.3.6
