From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 18 Jun 2016 18:43:16 +0200
Subject: [Buildroot] [PATCH 16/19] package/libucl: add .hash file
In-Reply-To: <1466268199-5417-1-git-send-email-romain.naour@gmail.com>
References: <1466268199-5417-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1466268199-5417-16-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to jquery-keyboard, it seems the libucl tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/libucl/libucl.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libucl/libucl.hash

diff --git a/package/libucl/libucl.hash b/package/libucl/libucl.hash
new file mode 100644
index 0000000..bd2ca13
--- /dev/null
+++ b/package/libucl/libucl.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 2f69995c7f8320350f56c1183c395cc4a2a958331f22d60b7839a117c9c601e1  libucl-0.7.3.tar.gz
-- 
2.5.5
