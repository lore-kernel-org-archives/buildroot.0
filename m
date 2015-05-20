From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 20 May 2015 06:21:21 +0200
Subject: [Buildroot] [PATCH 2/7] package/wsapi: add hash file
In-Reply-To: <1432095686-18628-1-git-send-email-fabio.porcedda@gmail.com>
References: <1432095686-18628-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1432095686-18628-2-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/wsapi/wsapi.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/wsapi/wsapi.hash

diff --git a/package/wsapi/wsapi.hash b/package/wsapi/wsapi.hash
new file mode 100644
index 0000000..3abbfc9
--- /dev/null
+++ b/package/wsapi/wsapi.hash
@@ -0,0 +1,2 @@
+# locally computed hash
+sha256 f7f1b0ddc68c257965c42ac7155904d8ff7c2b7256f65ef1b82fda0039137d61 wsapi-1.6.1-1.src.rock
-- 
2.4.1
