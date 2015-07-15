From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jul 2015 15:28:25 -0300
Subject: [Buildroot] [PATCH 34/40] gmpc: add hash file
In-Reply-To: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436984911-17680-34-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gmpc/gmpc.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/gmpc/gmpc.hash

diff --git a/package/gmpc/gmpc.hash b/package/gmpc/gmpc.hash
new file mode 100644
index 0000000..cd39822
--- /dev/null
+++ b/package/gmpc/gmpc.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	a69414f35396846733632ca9619921d7acda537ffd6d49bd84b444945cb76b2c	gmpc-11.8.16.tar.gz
-- 
2.3.6
