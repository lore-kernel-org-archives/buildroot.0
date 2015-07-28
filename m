From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:43 -0300
Subject: [Buildroot] [PATCH 042/113] libsigsegv: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-42-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libsigsegv/libsigsegv.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libsigsegv/libsigsegv.hash

diff --git a/package/libsigsegv/libsigsegv.hash b/package/libsigsegv/libsigsegv.hash
new file mode 100644
index 0000000..0151105
--- /dev/null
+++ b/package/libsigsegv/libsigsegv.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	8460a4a3dd4954c3d96d7a4f5dd5bc4d9b76f5754196aa245287553b26d2199a	libsigsegv-2.10.tar.gz
-- 
2.3.6
