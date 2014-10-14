From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Oct 2014 07:57:02 -0300
Subject: [Buildroot] [PATCH 4/5] gmp: add hash file
In-Reply-To: <1413284223-20630-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413284223-20630-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1413284223-20630-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gmp/gmp.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/gmp/gmp.hash

diff --git a/package/gmp/gmp.hash b/package/gmp/gmp.hash
new file mode 100644
index 0000000..9fe6344
--- /dev/null
+++ b/package/gmp/gmp.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	9156d32edac6955bc53b0218f5f3763facb890b73a835d5e1b901dcf8eb8b764	gmp-6.0.0a.tar.xz
-- 
2.0.4
