From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jul 2015 15:28:17 -0300
Subject: [Buildroot] [PATCH 26/40] musepack: add hash file
In-Reply-To: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436984911-17680-26-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/musepack/musepack.hash | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 package/musepack/musepack.hash

diff --git a/package/musepack/musepack.hash b/package/musepack/musepack.hash
new file mode 100644
index 0000000..b1bd73c
--- /dev/null
+++ b/package/musepack/musepack.hash
@@ -0,0 +1,4 @@
+# From https://www.musepack.net/index.php?pg=src
+md5	754d67be67f713e54baf70fcfdb2817e	musepack_src_r475.tar.gz
+# Calculated based on the hash above
+sha256	a4b1742f997f83e1056142d556a8c20845ba764b70365ff9ccf2e3f81c427b2b	musepack_src_r475.tar.gz
-- 
2.3.6
