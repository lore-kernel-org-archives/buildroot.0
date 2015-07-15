From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jul 2015 15:28:24 -0300
Subject: [Buildroot] [PATCH 33/40] iftop: add hash file
In-Reply-To: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436984911-17680-33-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iftop/iftop.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/iftop/iftop.hash

diff --git a/package/iftop/iftop.hash b/package/iftop/iftop.hash
new file mode 100644
index 0000000..19ce66b
--- /dev/null
+++ b/package/iftop/iftop.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	f733eeea371a7577f8fe353d86dd88d16f5b2a2e702bd96f5ffb2c197d9b4f97	iftop-1.0pre4.tar.gz
-- 
2.3.6
