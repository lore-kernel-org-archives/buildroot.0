From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:59 -0300
Subject: [Buildroot] [PATCH 058/113] mtdev: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-58-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mtdev/mtdev.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/mtdev/mtdev.hash

diff --git a/package/mtdev/mtdev.hash b/package/mtdev/mtdev.hash
new file mode 100644
index 0000000..7ba5ffd
--- /dev/null
+++ b/package/mtdev/mtdev.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	6b59b055ff22f2b91d4284187c2515826c338b81f6f33bd90f6bedc7c1fb9a38	mtdev-1.1.4.tar.bz2
-- 
2.3.6
