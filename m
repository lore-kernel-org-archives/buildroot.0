From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 10 Apr 2016 18:59:30 +0200
Subject: [Buildroot] [PATCH 3/3] googlefontdirectory: add hash file
In-Reply-To: <1460307570-10914-1-git-send-email-fabio.porcedda@gmail.com>
References: <1460307570-10914-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1460307570-10914-3-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/googlefontdirectory/googlefontdirectory.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/googlefontdirectory/googlefontdirectory.hash

diff --git a/package/googlefontdirectory/googlefontdirectory.hash b/package/googlefontdirectory/googlefontdirectory.hash
new file mode 100644
index 0000000..6b15b2b
--- /dev/null
+++ b/package/googlefontdirectory/googlefontdirectory.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 8a7d04feef21fdfc09d90cd3e2c0c05dcb2fdd4e15f971e8ceaf4d90c1c123cd googlewebfonts.tgz
-- 
2.8.1
