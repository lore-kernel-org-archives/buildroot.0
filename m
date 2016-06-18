From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 18 Jun 2016 19:32:31 +0200
Subject: [Buildroot] [PATCH 09/11] package/qdecoder: add .hash file
In-Reply-To: <1466271153-18961-1-git-send-email-romain.naour@gmail.com>
References: <1466271153-18961-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1466271153-18961-9-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to jquery-keyboard, it seems the qdecoder tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/qdecoder/qdecoder.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/qdecoder/qdecoder.hash

diff --git a/package/qdecoder/qdecoder.hash b/package/qdecoder/qdecoder.hash
new file mode 100644
index 0000000..6b30310
--- /dev/null
+++ b/package/qdecoder/qdecoder.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 641d3df4895626d7a530c5d26724e9b5887e9845d4b47f42c1cbce4a17ebf6af  qdecoder-r12.0.5.tar.gz
-- 
2.5.5
