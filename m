From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:20 -0300
Subject: [Buildroot] [PATCH 019/113] iostat: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-19-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iostat/iostat.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/iostat/iostat.hash

diff --git a/package/iostat/iostat.hash b/package/iostat/iostat.hash
new file mode 100644
index 0000000..2ba10a3
--- /dev/null
+++ b/package/iostat/iostat.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	edc5aa73f43bd6c7d49f2c1d5906a0a68c0b28bc4dfdaf1f2aa5ae4a2449c58e	iostat-2.2.tar.gz
-- 
2.3.6
