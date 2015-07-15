From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jul 2015 15:28:10 -0300
Subject: [Buildroot] [PATCH 19/40] nasm: add hash file
In-Reply-To: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436984911-17680-19-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nasm/nasm.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/nasm/nasm.hash

diff --git a/package/nasm/nasm.hash b/package/nasm/nasm.hash
new file mode 100644
index 0000000..a92ba3c
--- /dev/null
+++ b/package/nasm/nasm.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	233c574f2c068c0256f9b3653220ceb247c72b671085595259529156c6cfa55d	nasm-2.11.02.tar.xz
-- 
2.3.6
