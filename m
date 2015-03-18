From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 18 Mar 2015 15:37:43 -0300
Subject: [Buildroot] [PATCH] readline: add hash file
Message-ID: <1426703863-13885-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/readline/readline.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/readline/readline.hash

diff --git a/package/readline/readline.hash b/package/readline/readline.hash
new file mode 100644
index 0000000..d8833e9
--- /dev/null
+++ b/package/readline/readline.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	56ba6071b9462f980c5a72ab0023893b65ba6debb4eeb475d7a563dc65cafd43	readline-6.3.tar.gz
-- 
2.0.5
