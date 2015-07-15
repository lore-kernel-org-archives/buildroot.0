From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jul 2015 15:27:52 -0300
Subject: [Buildroot] [PATCH 01/40] tcping: add hash file
Message-ID: <1436984911-17680-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/tcping/tcping.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/tcping/tcping.hash

diff --git a/package/tcping/tcping.hash b/package/tcping/tcping.hash
new file mode 100644
index 0000000..de42775
--- /dev/null
+++ b/package/tcping/tcping.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	1ad52e904094d12b225ac4a0bc75297555e931c11a1501445faa548ff5ecdbd0	tcping-1.3.5.tar.gz
-- 
2.3.6
