From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 17 Sep 2014 11:20:07 -0300
Subject: [Buildroot] [PATCH 09/11] libnl: add hash
In-Reply-To: <1410963609-18128-1-git-send-email-gustavo@zacarias.com.ar>
References: <1410963609-18128-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1410963609-18128-9-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libnl/libnl.hash | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 package/libnl/libnl.hash

diff --git a/package/libnl/libnl.hash b/package/libnl/libnl.hash
new file mode 100644
index 0000000..6188d70
--- /dev/null
+++ b/package/libnl/libnl.hash
@@ -0,0 +1,3 @@
+# From http://lists.infradead.org/pipermail/libnl/2014-July/001549.html
+sha256	8beb7590674957b931de6b7f81c530b85dc7c1ad8fbda015398bc1e8d1ce8ec5 libnl-3.2.25.tar.gz
+md5	03f74d0cd5037cadc8cdfa313bbd195c	libnl-3.2.25.tar.gz
-- 
1.8.5.5
