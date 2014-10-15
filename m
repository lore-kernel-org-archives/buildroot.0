From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Wed, 15 Oct 2014 23:23:50 +0200
Subject: [Buildroot] [PATCH 3/4] package/libogg: add hash file
In-Reply-To: <1413408231-31696-1-git-send-email-jkrause@posteo.de>
References: <1413408231-31696-1-git-send-email-jkrause@posteo.de>
Message-ID: <1413408231-31696-3-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/libogg/libogg.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libogg/libogg.hash

diff --git a/package/libogg/libogg.hash b/package/libogg/libogg.hash
new file mode 100644
index 0000000..393ebee
--- /dev/null
+++ b/package/libogg/libogg.hash
@@ -0,0 +1,2 @@
+# From: http://www.xiph.org/downloads/
+sha256 3f687ccdd5ac8b52d76328fbbfebc70c459a40ea891dbf3dccb74a210826e79b libogg-1.3.2.tar.xz
-- 
2.1.2
