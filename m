From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jul 2015 15:28:27 -0300
Subject: [Buildroot] [PATCH 36/40] gamin: add hash file
In-Reply-To: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436984911-17680-36-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gamin/gamin.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/gamin/gamin.hash

diff --git a/package/gamin/gamin.hash b/package/gamin/gamin.hash
new file mode 100644
index 0000000..0a43706
--- /dev/null
+++ b/package/gamin/gamin.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	28085f0ae8be10eab582ff186af4fb0be92cc6c62b5cc19cd09b295c7c2899a1	gamin-0.1.10.tar.gz
-- 
2.3.6
