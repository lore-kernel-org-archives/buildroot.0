From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  2 Jun 2015 12:26:27 +0200
Subject: [Buildroot] [PATCH 2/3] package/lzop: add hash file
In-Reply-To: <1433240788-14191-1-git-send-email-fabio.porcedda@gmail.com>
References: <1433240788-14191-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1433240788-14191-2-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/lzop/lzop.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/lzop/lzop.hash

diff --git a/package/lzop/lzop.hash b/package/lzop/lzop.hash
new file mode 100644
index 0000000..a484e7f
--- /dev/null
+++ b/package/lzop/lzop.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 c1425b8c77d49f5a679d5a126c90ea6ad99585a55e335a613cae59e909dbb2c9 lzop-1.03.tar.gz
-- 
2.4.1
