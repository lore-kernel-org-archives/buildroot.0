From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:55 -0300
Subject: [Buildroot] [PATCH 054/113] lzma: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-54-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/lzma/lzma.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/lzma/lzma.hash

diff --git a/package/lzma/lzma.hash b/package/lzma/lzma.hash
new file mode 100644
index 0000000..e73517c
--- /dev/null
+++ b/package/lzma/lzma.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	02aa57f995d15b7acb7c2496d88a39fb0124ea00bf027cc61dd24eddb5942dff	lzma-4.32.7.tar.xz
-- 
2.3.6
