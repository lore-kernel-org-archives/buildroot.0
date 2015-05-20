From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 20 May 2015 06:21:24 +0200
Subject: [Buildroot] [PATCH 5/7] package/ushare: add hash file
In-Reply-To: <1432095686-18628-1-git-send-email-fabio.porcedda@gmail.com>
References: <1432095686-18628-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1432095686-18628-5-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/ushare/ushare.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/ushare/ushare.hash

diff --git a/package/ushare/ushare.hash b/package/ushare/ushare.hash
new file mode 100644
index 0000000..77f0f0f
--- /dev/null
+++ b/package/ushare/ushare.hash
@@ -0,0 +1,2 @@
+# locally computed hash
+sha256 7b9b85c79968d4f4560f02a99e33c6a33ff58f9d41d8faea79e31cce2ee78665 ushare-1.1a.tar.bz2
-- 
2.4.1
