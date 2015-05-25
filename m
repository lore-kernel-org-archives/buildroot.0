From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 25 May 2015 17:30:37 +0200
Subject: [Buildroot] [PATCH 4/5] package/libjpeg: add hash file
In-Reply-To: <1432567838-2948-1-git-send-email-fabio.porcedda@gmail.com>
References: <1432567838-2948-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1432567838-2948-4-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/libjpeg/libjpeg.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libjpeg/libjpeg.hash

diff --git a/package/libjpeg/libjpeg.hash b/package/libjpeg/libjpeg.hash
new file mode 100644
index 0000000..035812a
--- /dev/null
+++ b/package/libjpeg/libjpeg.hash
@@ -0,0 +1,2 @@
+# locally computed hash
+sha256 3a753ea48d917945dd54a2d97de388aa06ca2eb1066cbfdc6652036349fe05a7 jpegsrc.v9a.tar.gz
-- 
2.4.1
