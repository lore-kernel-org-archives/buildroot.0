From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Jun 2016 22:47:30 +0200
Subject: [Buildroot] [git commit] package/apitrace: add .hash file
Message-ID: <20160618205842.3B90A81976@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f7b188cf6de1be845bc1b5ca7809b2b3cc0a7d6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to jquery-keyboard, it seems the apitrace tarball on the
autobuilder is corrupt.  Fix it by adding a .hash file so it falls back to
our s.b.o mirror.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apitrace/apitrace.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/apitrace/apitrace.hash b/package/apitrace/apitrace.hash
new file mode 100644
index 0000000..eac470b
--- /dev/null
+++ b/package/apitrace/apitrace.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 21d0cc765b84e537c5a3a117073818942653b85685b9633d364836ccfe0b9fd5  apitrace-7.0.tar.gz
