From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 18 Jun 2016 19:32:28 +0200
Subject: [Buildroot] [PATCH 06/11] package/neardal: add .hash file
In-Reply-To: <1466271153-18961-1-git-send-email-romain.naour@gmail.com>
References: <1466271153-18961-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1466271153-18961-6-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to jquery-keyboard, it seems the neardal tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/neardal/neardal.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/neardal/neardal.hash

diff --git a/package/neardal/neardal.hash b/package/neardal/neardal.hash
new file mode 100644
index 0000000..c767a74
--- /dev/null
+++ b/package/neardal/neardal.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 9955753759a2604fa47562a4bbccd3b787d625e70311bb6662936d89d26715b7  neardal-33b54a55032b047fd885a5eb3592c169c0056c49.tar.gz
-- 
2.5.5
