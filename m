From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 18 Jun 2016 18:43:01 +0200
Subject: [Buildroot] [PATCH 01/19] package/apitrace: add .hash file
Message-ID: <1466268199-5417-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to jquery-keyboard, it seems the apitrace tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/apitrace/apitrace.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/apitrace/apitrace.hash

diff --git a/package/apitrace/apitrace.hash b/package/apitrace/apitrace.hash
new file mode 100644
index 0000000..eac470b
--- /dev/null
+++ b/package/apitrace/apitrace.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 21d0cc765b84e537c5a3a117073818942653b85685b9633d364836ccfe0b9fd5  apitrace-7.0.tar.gz
-- 
2.5.5
