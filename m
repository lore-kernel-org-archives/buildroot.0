From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  2 Jun 2015 12:26:26 +0200
Subject: [Buildroot] [PATCH 1/3] package/lzo: add hash file
Message-ID: <1433240788-14191-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/lzo/lzo.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/lzo/lzo.hash

diff --git a/package/lzo/lzo.hash b/package/lzo/lzo.hash
new file mode 100644
index 0000000..8d7c666
--- /dev/null
+++ b/package/lzo/lzo.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 ac1b3e4dee46febe9fd28737eb7f5692d3232ef1a01da10444394c3d47536614 lzo-2.08.tar.gz
-- 
2.4.1
